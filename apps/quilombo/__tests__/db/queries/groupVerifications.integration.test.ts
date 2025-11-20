/**
 * Integration tests for group verification query functions
 * Tests the actual query function APIs with real database
 *
 * NOTE: These tests verify the query function interfaces remain stable
 * while allowing internal SQL implementation to change
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../../setup/db-container';
import { GROUP_VERIFICATION_COOLDOWN_MS } from '@/config/constants';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';

// Type imports for query functions (will be imported dynamically)
type CanVerifyGroup = (groupId: string) => Promise<boolean>;
type VerifyGroup = (userId: string, groupId: string, notes?: string) => Promise<void>;
type GetGroupVerificationHistory = (
  groupId: string
) => Promise<Array<schema.SelectGroupVerification & { user: schema.SelectUser | null }>>;
type GetUserVerificationCount = (userId: string) => Promise<number>;
type GetLatestGroupVerification = (groupId: string) => Promise<schema.SelectGroupVerification | null>;

describe('Group Verification Query Functions (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Query functions (imported dynamically after DATABASE_URL is set)
  let canVerifyGroup: CanVerifyGroup;
  let verifyGroup: VerifyGroup;
  let getGroupVerificationHistory: GetGroupVerificationHistory;
  let getUserVerificationCount: GetUserVerificationCount;
  let getLatestGroupVerification: GetLatestGroupVerification;

  // Test data IDs
  let testGroupId: string;
  let testUserId1: string;
  let testUserId2: string;

  beforeAll(async () => {
    // Start PostgreSQL container and run migrations
    const setup = await setupTestDatabase();
    db = setup.db;

    // Set DATABASE_URL for lazy db initialization
    process.env.DATABASE_URL = setup.container.getConnectionUri();

    // Dynamically import query functions AFTER DATABASE_URL is set
    const queryModule = await import('@/db/queries/groupVerifications');
    canVerifyGroup = queryModule.canVerifyGroup;
    verifyGroup = queryModule.verifyGroup;
    getGroupVerificationHistory = queryModule.getGroupVerificationHistory;
    getUserVerificationCount = queryModule.getUserVerificationCount;
    getLatestGroupVerification = queryModule.getLatestGroupVerification;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create test data
    testGroupId = uuidv4();
    testUserId1 = uuidv4();
    testUserId2 = uuidv4();

    await db.insert(schema.groups).values({
      id: testGroupId,
      name: 'Test Group for Verification',
      createdAt: new Date(),
    });

    await db.insert(schema.users).values([
      { id: testUserId1, email: 'user1@example.com', nickname: 'user1' },
      { id: testUserId2, email: 'user2@example.com', nickname: 'user2' },
    ]);
  });

  describe('canVerifyGroup() - 30-Day Cooldown Logic', () => {
    it('should return true when group has never been verified', async () => {
      const result = await canVerifyGroup(testGroupId);
      expect(result).toBe(true);
    });

    it('should return false within 30-day cooldown period', async () => {
      await verifyGroup(testUserId1, testGroupId, 'Initial verification');

      const result = await canVerifyGroup(testGroupId);
      expect(result).toBe(false);
    });

    it('should return true after 30-day cooldown expires', async () => {
      await verifyGroup(testUserId1, testGroupId);

      // Set verification to 31 days ago
      const oldDate = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 24 * 60 * 60 * 1000);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: oldDate })
        .where(eq(schema.groupVerifications.groupId, testGroupId));

      const result = await canVerifyGroup(testGroupId);
      expect(result).toBe(true);
    });

    it('should enforce cooldown per-group, not per-user', async () => {
      await verifyGroup(testUserId1, testGroupId, 'Verified by user1');

      // User2 tries immediately after
      const result = await canVerifyGroup(testGroupId);
      expect(result).toBe(false);
    });

    it('should check most recent verification for cooldown', async () => {
      // Old verification (expired)
      await verifyGroup(testUserId1, testGroupId);
      const oldDate = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 24 * 60 * 60 * 1000);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: oldDate })
        .where(eq(schema.groupVerifications.userId, testUserId1));

      expect(await canVerifyGroup(testGroupId)).toBe(true);

      // Recent verification (within cooldown)
      await verifyGroup(testUserId2, testGroupId);

      expect(await canVerifyGroup(testGroupId)).toBe(false);
    });

    it('should return true for non-existent group', async () => {
      const nonExistentId = uuidv4();
      const result = await canVerifyGroup(nonExistentId);
      expect(result).toBe(true);
    });
  });

  describe('verifyGroup() - Recording Verifications', () => {
    it('should record verification with all fields', async () => {
      const before = new Date();

      await verifyGroup(testUserId1, testGroupId, 'Confirmed website is active');

      const history = await getGroupVerificationHistory(testGroupId);

      expect(history).toHaveLength(1);
      expect(history[0].userId).toBe(testUserId1);
      expect(history[0].groupId).toBe(testGroupId);
      expect(history[0].notes).toBe('Confirmed website is active');
      expect(history[0].verifiedAt.getTime()).toBeGreaterThanOrEqual(before.getTime());
    });

    it('should record verification without notes', async () => {
      await verifyGroup(testUserId1, testGroupId);

      const history = await getGroupVerificationHistory(testGroupId);

      expect(history).toHaveLength(1);
      expect(history[0].notes).toBeNull();
    });

    it('should allow multiple verifications over time', async () => {
      await verifyGroup(testUserId1, testGroupId, 'First');
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1000) });

      await verifyGroup(testUserId2, testGroupId, 'Second');

      const history = await getGroupVerificationHistory(testGroupId);
      expect(history).toHaveLength(2);
    });
  });

  describe('getGroupVerificationHistory()', () => {
    it('should return empty array for group with no verifications', async () => {
      const history = await getGroupVerificationHistory(testGroupId);
      expect(history).toEqual([]);
    });

    it('should return verifications with user info', async () => {
      await verifyGroup(testUserId1, testGroupId, 'Test');

      const history = await getGroupVerificationHistory(testGroupId);

      expect(history).toHaveLength(1);
      expect(history[0].user).not.toBeNull();
      expect(history[0].user?.email).toBe('user1@example.com');
      expect(history[0].user?.nickname).toBe('user1');
    });

    it('should order by date (oldest first)', async () => {
      await verifyGroup(testUserId1, testGroupId, 'First');
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - 3000) })
        .where(eq(schema.groupVerifications.userId, testUserId1));

      await verifyGroup(testUserId2, testGroupId, 'Second');

      const history = await getGroupVerificationHistory(testGroupId);

      expect(history).toHaveLength(2);
      expect(history[0].notes).toBe('First');
      expect(history[1].notes).toBe('Second');
    });
  });

  describe('getUserVerificationCount()', () => {
    it('should return 0 for user with no verifications', async () => {
      const count = await getUserVerificationCount(testUserId1);
      expect(count).toBe(0);
    });

    it('should count all verifications by user', async () => {
      const group2Id = uuidv4();
      const group3Id = uuidv4();

      await db.insert(schema.groups).values([
        { id: group2Id, name: 'Group 2', createdAt: new Date() },
        { id: group3Id, name: 'Group 3', createdAt: new Date() },
      ]);

      await verifyGroup(testUserId1, testGroupId);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1000) });

      await verifyGroup(testUserId1, group2Id);
      await verifyGroup(testUserId1, group3Id);

      const count = await getUserVerificationCount(testUserId1);
      expect(count).toBe(3);
    });

    it('should only count verifications for specific user', async () => {
      await verifyGroup(testUserId1, testGroupId);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1000) });

      await verifyGroup(testUserId2, testGroupId);

      expect(await getUserVerificationCount(testUserId1)).toBe(1);
      expect(await getUserVerificationCount(testUserId2)).toBe(1);
    });
  });

  describe('getLatestGroupVerification()', () => {
    it('should return null for group with no verifications', async () => {
      const latest = await getLatestGroupVerification(testGroupId);
      expect(latest).toBeNull();
    });

    it('should return most recent verification', async () => {
      await verifyGroup(testUserId1, testGroupId, 'Old');
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1000) });

      await verifyGroup(testUserId2, testGroupId, 'Recent');

      const latest = await getLatestGroupVerification(testGroupId);

      expect(latest).not.toBeNull();
      expect(latest?.userId).toBe(testUserId2);
      expect(latest?.notes).toBe('Recent');
    });

    it('should return correct verification when multiple exist', async () => {
      await verifyGroup(testUserId1, testGroupId, 'First');
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - 5000) })
        .where(eq(schema.groupVerifications.userId, testUserId1));

      await verifyGroup(testUserId2, testGroupId, 'Second');
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: new Date(Date.now() - 2000) })
        .where(eq(schema.groupVerifications.userId, testUserId2));

      await verifyGroup(testUserId1, testGroupId, 'Third (latest)');

      const latest = await getLatestGroupVerification(testGroupId);

      expect(latest?.notes).toBe('Third (latest)');
      expect(latest?.userId).toBe(testUserId1);
    });
  });

  describe('Edge Cases', () => {
    it('should handle near cooldown boundary (still on cooldown)', async () => {
      await verifyGroup(testUserId1, testGroupId);

      // Set to 1 hour before cooldown expires (still within cooldown window)
      const nearBoundaryDate = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS + 60 * 60 * 1000);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: nearBoundaryDate })
        .where(eq(schema.groupVerifications.groupId, testGroupId));

      expect(await canVerifyGroup(testGroupId)).toBe(false);
    });

    it('should handle 1ms past cooldown (no longer on cooldown)', async () => {
      await verifyGroup(testUserId1, testGroupId);

      const pastDate = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1);
      await db
        .update(schema.groupVerifications)
        .set({ verifiedAt: pastDate })
        .where(eq(schema.groupVerifications.groupId, testGroupId));

      expect(await canVerifyGroup(testGroupId)).toBe(true);
    });
  });
});
