/**
 * Integration tests for group claims business logic
 * Tests the group ownership claiming workflow with admin approval
 *
 * Business Rules:
 * - Groups are claimable only if: claimedBy IS NULL AND no admins exist
 * - Approving a claim: marks claim approved, adds user as admin, sets claimedBy/At
 * - Rejecting a claim: marks claim rejected with admin notes
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { and, eq } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';

describe('Group Claims Business Logic (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Test data IDs
  let unclaimedGroupId: string;
  let claimedGroupId: string;
  let groupWithAdminId: string;
  let userId1: string;
  let userId2: string;
  let adminId: string;

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create test users
    userId1 = uuidv4();
    userId2 = uuidv4();
    adminId = uuidv4();

    await db.insert(schema.users).values([
      { id: userId1, email: 'user1@example.com', nickname: 'user1', globalAdmin: false },
      { id: userId2, email: 'user2@example.com', nickname: 'user2', globalAdmin: false },
      { id: adminId, email: 'admin@example.com', nickname: 'admin', globalAdmin: true },
    ]);

    // Create test groups with different claim states
    unclaimedGroupId = uuidv4();
    claimedGroupId = uuidv4();
    groupWithAdminId = uuidv4();

    await db.insert(schema.groups).values([
      {
        id: unclaimedGroupId,
        name: 'Unclaimed Group',
        createdAt: new Date(),
        claimedBy: null,
        claimedAt: null,
      },
      {
        id: claimedGroupId,
        name: 'Already Claimed Group',
        createdAt: new Date(),
        claimedBy: userId1,
        claimedAt: new Date(),
      },
      {
        id: groupWithAdminId,
        name: 'Group With Admin',
        createdAt: new Date(),
        claimedBy: null,
        claimedAt: null,
      },
    ]);

    // Add admin to one group
    await db.insert(schema.groupAdmins).values({
      groupId: groupWithAdminId,
      userId: userId1,
    });
  });

  describe('Group Claimability Check (isGroupClaimable logic)', () => {
    it('should identify unclaimed group with no admins as claimable', async () => {
      // Query logic: LEFT JOIN to check both claimedBy and admin existence
      const result = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, unclaimedGroupId))
        .limit(1);

      expect(result).toHaveLength(1);
      expect(result[0].claimedBy).toBeNull();
      expect(result[0].adminUserId).toBeNull();
      // Both NULL = claimable
    });

    it('should identify already claimed group as not claimable', async () => {
      const result = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, claimedGroupId))
        .limit(1);

      expect(result).toHaveLength(1);
      expect(result[0].claimedBy).toBe(userId1);
      // claimedBy NOT NULL = not claimable
    });

    it('should identify group with admin as not claimable', async () => {
      const result = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, groupWithAdminId))
        .limit(1);

      expect(result).toHaveLength(1);
      expect(result[0].claimedBy).toBeNull();
      expect(result[0].adminUserId).toBe(userId1);
      // adminUserId NOT NULL = not claimable
    });

    it('should return false for non-existent group', async () => {
      const nonExistentId = uuidv4();
      const result = await db.select().from(schema.groups).where(eq(schema.groups.id, nonExistentId));

      expect(result).toHaveLength(0);
      // No group found = not claimable
    });
  });

  describe('Creating Group Claims', () => {
    it('should create a pending claim with all required fields', async () => {
      const claimId = uuidv4();
      const requestedAt = new Date();

      await db.insert(schema.groupClaims).values({
        id: claimId,
        userId: userId1,
        groupId: unclaimedGroupId,
        userMessage: 'I am the founder of this group',
        status: 'pending',
        requestedAt,
      });

      const claims = await db.select().from(schema.groupClaims).where(eq(schema.groupClaims.id, claimId));

      expect(claims).toHaveLength(1);
      expect(claims[0].userId).toBe(userId1);
      expect(claims[0].groupId).toBe(unclaimedGroupId);
      expect(claims[0].userMessage).toBe('I am the founder of this group');
      expect(claims[0].status).toBe('pending');
      expect(claims[0].requestedAt).toEqual(requestedAt);
      expect(claims[0].processedAt).toBeNull();
      expect(claims[0].processedBy).toBeNull();
    });

    it('should allow multiple users to claim the same group', async () => {
      const claim1Id = uuidv4();
      const claim2Id = uuidv4();

      await db.insert(schema.groupClaims).values([
        {
          id: claim1Id,
          userId: userId1,
          groupId: unclaimedGroupId,
          userMessage: 'I am the founder',
          status: 'pending',
          requestedAt: new Date(),
        },
        {
          id: claim2Id,
          userId: userId2,
          groupId: unclaimedGroupId,
          userMessage: 'I am also the founder',
          status: 'pending',
          requestedAt: new Date(),
        },
      ]);

      const claims = await db.select().from(schema.groupClaims).where(eq(schema.groupClaims.groupId, unclaimedGroupId));

      expect(claims).toHaveLength(2);
    });
  });

  describe('Approving Claims (Multi-Step Workflow)', () => {
    let claimId: string;

    beforeEach(async () => {
      // Create a pending claim
      claimId = uuidv4();
      await db.insert(schema.groupClaims).values({
        id: claimId,
        userId: userId1,
        groupId: unclaimedGroupId,
        userMessage: 'I am the founder',
        status: 'pending',
        requestedAt: new Date(),
      });
    });

    it('should update claim status to approved with processor info', async () => {
      const processedAt = new Date();

      await db
        .update(schema.groupClaims)
        .set({
          status: 'approved',
          processedAt,
          processedBy: adminId,
        })
        .where(eq(schema.groupClaims.id, claimId));

      const claim = await db.select().from(schema.groupClaims).where(eq(schema.groupClaims.id, claimId));

      expect(claim[0].status).toBe('approved');
      expect(claim[0].processedAt).toEqual(processedAt);
      expect(claim[0].processedBy).toBe(adminId);
    });

    it('should add user as group admin when claim is approved', async () => {
      // Approve claim - step 1
      await db
        .update(schema.groupClaims)
        .set({ status: 'approved', processedAt: new Date(), processedBy: adminId })
        .where(eq(schema.groupClaims.id, claimId));

      // Add user as admin - step 2
      await db.insert(schema.groupAdmins).values({
        groupId: unclaimedGroupId,
        userId: userId1,
      });

      const admins = await db
        .select()
        .from(schema.groupAdmins)
        .where(and(eq(schema.groupAdmins.groupId, unclaimedGroupId), eq(schema.groupAdmins.userId, userId1)));

      expect(admins).toHaveLength(1);
    });

    it('should update group claimedBy and claimedAt fields', async () => {
      const claimedAt = new Date();

      // Approve claim
      await db
        .update(schema.groupClaims)
        .set({ status: 'approved', processedAt: new Date(), processedBy: adminId })
        .where(eq(schema.groupClaims.id, claimId));

      // Update group - step 3
      await db
        .update(schema.groups)
        .set({
          claimedBy: userId1,
          claimedAt,
        })
        .where(eq(schema.groups.id, unclaimedGroupId));

      const group = await db.select().from(schema.groups).where(eq(schema.groups.id, unclaimedGroupId));

      expect(group[0].claimedBy).toBe(userId1);
      expect(group[0].claimedAt).toEqual(claimedAt);
    });

    it('should add user to the group when claim is approved', async () => {
      // Approve claim
      await db
        .update(schema.groupClaims)
        .set({ status: 'approved', processedAt: new Date(), processedBy: adminId })
        .where(eq(schema.groupClaims.id, claimId));

      // Add user to group - step 4
      await db.update(schema.users).set({ groupId: unclaimedGroupId }).where(eq(schema.users.id, userId1));

      const user = await db.select().from(schema.users).where(eq(schema.users.id, userId1));

      expect(user[0].groupId).toBe(unclaimedGroupId);
    });

    it('should complete full approval workflow atomically', async () => {
      const processedAt = new Date();

      // All 4 steps of approval workflow
      await db
        .update(schema.groupClaims)
        .set({ status: 'approved', processedAt, processedBy: adminId })
        .where(eq(schema.groupClaims.id, claimId));

      await db.insert(schema.groupAdmins).values({ groupId: unclaimedGroupId, userId: userId1 });

      await db
        .update(schema.groups)
        .set({ claimedBy: userId1, claimedAt: processedAt })
        .where(eq(schema.groups.id, unclaimedGroupId));

      await db.update(schema.users).set({ groupId: unclaimedGroupId }).where(eq(schema.users.id, userId1));

      // Verify all changes
      const claim = await db.select().from(schema.groupClaims).where(eq(schema.groupClaims.id, claimId));
      const admin = await db
        .select()
        .from(schema.groupAdmins)
        .where(and(eq(schema.groupAdmins.groupId, unclaimedGroupId), eq(schema.groupAdmins.userId, userId1)));
      const group = await db.select().from(schema.groups).where(eq(schema.groups.id, unclaimedGroupId));
      const user = await db.select().from(schema.users).where(eq(schema.users.id, userId1));

      expect(claim[0].status).toBe('approved');
      expect(admin).toHaveLength(1);
      expect(group[0].claimedBy).toBe(userId1);
      expect(user[0].groupId).toBe(unclaimedGroupId);
    });
  });

  describe('Rejecting Claims', () => {
    let claimId: string;

    beforeEach(async () => {
      claimId = uuidv4();
      await db.insert(schema.groupClaims).values({
        id: claimId,
        userId: userId1,
        groupId: unclaimedGroupId,
        userMessage: 'I am the founder',
        status: 'pending',
        requestedAt: new Date(),
      });
    });

    it('should update claim status to rejected with admin notes', async () => {
      const processedAt = new Date();
      const adminNotes = 'Not enough evidence of ownership';

      await db
        .update(schema.groupClaims)
        .set({
          status: 'rejected',
          processedAt,
          processedBy: adminId,
          adminNotes,
        })
        .where(eq(schema.groupClaims.id, claimId));

      const claim = await db.select().from(schema.groupClaims).where(eq(schema.groupClaims.id, claimId));

      expect(claim[0].status).toBe('rejected');
      expect(claim[0].processedAt).toEqual(processedAt);
      expect(claim[0].processedBy).toBe(adminId);
      expect(claim[0].adminNotes).toBe(adminNotes);
    });

    it('should NOT modify group or user when rejecting claim', async () => {
      // Reject claim
      await db
        .update(schema.groupClaims)
        .set({
          status: 'rejected',
          processedAt: new Date(),
          processedBy: adminId,
          adminNotes: 'Insufficient proof',
        })
        .where(eq(schema.groupClaims.id, claimId));

      // Verify group unchanged
      const group = await db.select().from(schema.groups).where(eq(schema.groups.id, unclaimedGroupId));
      expect(group[0].claimedBy).toBeNull();
      expect(group[0].claimedAt).toBeNull();

      // Verify no admin added
      const admins = await db.select().from(schema.groupAdmins).where(eq(schema.groupAdmins.groupId, unclaimedGroupId));
      expect(admins).toHaveLength(0);

      // Verify user not added to group
      const user = await db.select().from(schema.users).where(eq(schema.users.id, userId1));
      expect(user[0].groupId).toBeNull();
    });
  });

  describe('Querying Claims', () => {
    it('should retrieve pending claims with group and user info', async () => {
      const claim1Id = uuidv4();
      const claim2Id = uuidv4();

      await db.insert(schema.groupClaims).values([
        {
          id: claim1Id,
          userId: userId1,
          groupId: unclaimedGroupId,
          userMessage: 'Claim 1',
          status: 'pending',
          requestedAt: new Date(Date.now() - 2000),
        },
        {
          id: claim2Id,
          userId: userId2,
          groupId: claimedGroupId,
          userMessage: 'Claim 2',
          status: 'pending',
          requestedAt: new Date(),
        },
      ]);

      // Query with joins
      const results = await db
        .select({
          id: schema.groupClaims.id,
          status: schema.groupClaims.status,
          userMessage: schema.groupClaims.userMessage,
          groupName: schema.groups.name,
          userEmail: schema.users.email,
        })
        .from(schema.groupClaims)
        .leftJoin(schema.groups, eq(schema.groupClaims.groupId, schema.groups.id))
        .leftJoin(schema.users, eq(schema.groupClaims.userId, schema.users.id))
        .where(eq(schema.groupClaims.status, 'pending'))
        .orderBy(schema.groupClaims.requestedAt);

      expect(results).toHaveLength(2);
      expect(results[0].id).toBe(claim1Id);
      expect(results[0].groupName).toBe('Unclaimed Group');
      expect(results[0].userEmail).toBe('user1@example.com');
      expect(results[1].id).toBe(claim2Id);
    });

    it('should retrieve all claims for a specific group', async () => {
      const claim1Id = uuidv4();
      const claim2Id = uuidv4();
      const claim3Id = uuidv4();

      await db.insert(schema.groupClaims).values([
        {
          id: claim1Id,
          userId: userId1,
          groupId: unclaimedGroupId,
          userMessage: 'Pending claim',
          status: 'pending',
          requestedAt: new Date(Date.now() - 3000),
        },
        {
          id: claim2Id,
          userId: userId2,
          groupId: unclaimedGroupId,
          userMessage: 'Approved claim',
          status: 'approved',
          requestedAt: new Date(Date.now() - 2000),
          processedAt: new Date(Date.now() - 1000),
          processedBy: adminId,
        },
        {
          id: claim3Id,
          userId: userId1,
          groupId: claimedGroupId,
          userMessage: 'Different group',
          status: 'pending',
          requestedAt: new Date(),
        },
      ]);

      const claims = await db
        .select()
        .from(schema.groupClaims)
        .where(eq(schema.groupClaims.groupId, unclaimedGroupId))
        .orderBy(schema.groupClaims.requestedAt);

      expect(claims).toHaveLength(2);
      expect(claims[0].id).toBe(claim1Id);
      expect(claims[1].id).toBe(claim2Id);
    });
  });

  describe('Foreign Key Constraints', () => {
    it('should enforce userId foreign key', async () => {
      const nonExistentUserId = uuidv4();

      await expect(
        db.insert(schema.groupClaims).values({
          userId: nonExistentUserId,
          groupId: unclaimedGroupId,
          userMessage: 'Test',
          status: 'pending',
          requestedAt: new Date(),
        })
      ).rejects.toThrow();
    });

    it('should enforce groupId foreign key', async () => {
      const nonExistentGroupId = uuidv4();

      await expect(
        db.insert(schema.groupClaims).values({
          userId: userId1,
          groupId: nonExistentGroupId,
          userMessage: 'Test',
          status: 'pending',
          requestedAt: new Date(),
        })
      ).rejects.toThrow();
    });
  });
});
