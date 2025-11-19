/**
 * Integration tests for database schema and basic operations
 * Verifies that Test

containers setup works and schema is correct
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq, and, gte } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { GROUP_VERIFICATION_COOLDOWN_MS } from '@/config/constants';
import { v4 as uuidv4 } from 'uuid';

describe('Database Schema Integration Tests', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  beforeAll(async () => {
    console.log('Starting integration tests...');
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();
  });

  describe('Users Table', () => {
    it('should insert and query users', async () => {
      const userId = uuidv4();

      await db.insert(schema.users).values({
        id: userId,
        email: 'test@example.com',
        nickname: 'testuser',
      });

      const users = await db.select().from(schema.users).where(eq(schema.users.id, userId));

      expect(users).toHaveLength(1);
      expect(users[0].email).toBe('test@example.com');
      expect(users[0].nickname).toBe('testuser');
    });
  });

  describe('Groups Table', () => {
    it('should insert and query groups', async () => {
      const groupId = uuidv4();

      await db.insert(schema.groups).values({
        id: groupId,
        name: 'Test Group',
        description: 'A test group',
        createdAt: new Date(),
      });

      const groups = await db.select().from(schema.groups).where(eq(schema.groups.id, groupId));

      expect(groups).toHaveLength(1);
      expect(groups[0].name).toBe('Test Group');
      expect(groups[0].description).toBe('A test group');
    });
  });

  describe('Group Verification Cooldown Logic (Direct SQL)', () => {
    let testGroupId: string;
    let testUserId: string;

    beforeEach(async () => {
      testGroupId = uuidv4();
      testUserId = uuidv4();

      await db.insert(schema.groups).values({
        id: testGroupId,
        name: 'Test Group',
        createdAt: new Date(),
      });

      await db.insert(schema.users).values({
        id: testUserId,
        email: 'user@example.com',
        nickname: 'testuser',
      });
    });

    it('should allow verification when no recent verifications exist', async () => {
      // Test the actual SQL logic: check if group can be verified
      const cooldownCutoff = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS);

      const recentVerifications = await db
        .select()
        .from(schema.groupVerifications)
        .where(
          and(
            eq(schema.groupVerifications.groupId, testGroupId),
            gte(schema.groupVerifications.verifiedAt, cooldownCutoff)
          )
        );

      expect(recentVerifications).toHaveLength(0);
      // If no recent verifications, group CAN be verified
    });

    it('should prevent verification when recent verification exists', async () => {
      // Insert a recent verification
      await db.insert(schema.groupVerifications).values({
        userId: testUserId,
        groupId: testGroupId,
        verifiedAt: new Date(), // Just now
      });

      // Check if verification is within cooldown
      const cooldownCutoff = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS);

      const recentVerifications = await db
        .select()
        .from(schema.groupVerifications)
        .where(
          and(
            eq(schema.groupVerifications.groupId, testGroupId),
            gte(schema.groupVerifications.verifiedAt, cooldownCutoff)
          )
        );

      expect(recentVerifications).toHaveLength(1);
      // If recent verification exists, group CANNOT be verified
    });

    it('should allow verification after cooldown expires', async () => {
      // Insert an old verification (past cooldown)
      const oldDate = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS - 1000);

      await db.insert(schema.groupVerifications).values({
        userId: testUserId,
        groupId: testGroupId,
        verifiedAt: oldDate,
      });

      // Check if any verifications are within cooldown
      const cooldownCutoff = new Date(Date.now() - GROUP_VERIFICATION_COOLDOWN_MS);

      const recentVerifications = await db
        .select()
        .from(schema.groupVerifications)
        .where(
          and(
            eq(schema.groupVerifications.groupId, testGroupId),
            gte(schema.groupVerifications.verifiedAt, cooldownCutoff)
          )
        );

      expect(recentVerifications).toHaveLength(0);
      // No recent verifications, group CAN be verified
    });

    it('should record verification with correct timestamp', async () => {
      const beforeVerification = new Date();

      await db.insert(schema.groupVerifications).values({
        userId: testUserId,
        groupId: testGroupId,
        notes: 'Test verification',
        verifiedAt: new Date(),
      });

      const verifications = await db
        .select()
        .from(schema.groupVerifications)
        .where(eq(schema.groupVerifications.groupId, testGroupId));

      expect(verifications).toHaveLength(1);
      expect(verifications[0].userId).toBe(testUserId);
      expect(verifications[0].groupId).toBe(testGroupId);
      expect(verifications[0].notes).toBe('Test verification');
      expect(verifications[0].verifiedAt.getTime()).toBeGreaterThanOrEqual(beforeVerification.getTime());
    });
  });

  describe('Foreign Key Constraints', () => {
    it('should enforce group_verifications foreign keys', async () => {
      const nonExistentGroupId = uuidv4();
      const nonExistentUserId = uuidv4();

      // Should fail - group doesn't exist
      await expect(
        db.insert(schema.groupVerifications).values({
          userId: nonExistentUserId,
          groupId: nonExistentGroupId,
          verifiedAt: new Date(),
        })
      ).rejects.toThrow();
    });
  });
});
