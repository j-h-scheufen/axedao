/**
 * Integration tests for group management and membership flows
 * Tests group lifecycle, membership, and admin management using real database
 *
 * Business Flows Tested:
 * - Group creation and updates
 * - Member addition and removal
 * - Admin appointment and removal
 * - Group claiming workflow
 * - Membership constraints and validation
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq, and } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';

describe('Group Management (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Test data
  let user1Id: string;
  let user2Id: string;
  let user3Id: string;
  let adminId: string;
  let groupId: string;

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
    user1Id = uuidv4();
    user2Id = uuidv4();
    user3Id = uuidv4();
    adminId = uuidv4();

    await db.insert(schema.users).values([
      {
        id: user1Id,
        email: 'user1@example.com',
        name: 'User One',
        nickname: 'UserOne',
        isGlobalAdmin: false,
      },
      {
        id: user2Id,
        email: 'user2@example.com',
        name: 'User Two',
        nickname: 'UserTwo',
        isGlobalAdmin: false,
      },
      {
        id: user3Id,
        email: 'user3@example.com',
        name: 'User Three',
        nickname: 'UserThree',
        isGlobalAdmin: false,
      },
      {
        id: adminId,
        email: 'admin@example.com',
        name: 'Admin User',
        nickname: 'Admin',
        isGlobalAdmin: true,
      },
    ]);

    // Create test group
    groupId = uuidv4();
    await db.insert(schema.groups).values({
      id: groupId,
      name: 'Test Group',
      description: 'Test group for membership management',
      style: 'angola',
      createdBy: user1Id,
    });
  });

  describe('Group Creation', () => {
    it('should create a new group with creator', async () => {
      const newGroupId = uuidv4();
      const groups = await db
        .insert(schema.groups)
        .values({
          id: newGroupId,
          name: 'New Group',
          description: 'A new test group',
          style: 'regional',
          createdBy: user2Id,
        })
        .returning();

      expect(groups).toHaveLength(1);
      expect(groups[0].name).toBe('New Group');
      expect(groups[0].createdBy).toBe(user2Id);
      expect(groups[0].claimedBy).toBeNull();
    });

    it('should create group without style (optional)', async () => {
      const newGroupId = uuidv4();
      const groups = await db
        .insert(schema.groups)
        .values({
          id: newGroupId,
          name: 'Styleless Group',
          createdBy: user1Id,
        })
        .returning();

      expect(groups[0].style).toBeNull();
    });

    it('should create group with leader reference', async () => {
      const newGroupId = uuidv4();
      const groups = await db
        .insert(schema.groups)
        .values({
          id: newGroupId,
          name: 'Group with Leader',
          createdBy: user1Id,
          leader: user2Id,
        })
        .returning();

      expect(groups[0].leader).toBe(user2Id);
    });
  });

  describe('Member Management', () => {
    it('should add user as member to group', async () => {
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      expect(member?.groupId).toBe(groupId);
    });

    it('should add multiple users to same group', async () => {
      await db
        .update(schema.users)
        .set({ groupId })
        .where(and(eq(schema.users.id, user1Id), eq(schema.users.id, user2Id), eq(schema.users.id, user3Id)));

      // Add them individually since the above won't work with OR logic
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user2Id));
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user3Id));

      const members = await db.query.users.findMany({
        where: eq(schema.users.groupId, groupId),
      });

      expect(members).toHaveLength(3);
      const memberIds = members.map((m) => m.id);
      expect(memberIds).toContain(user1Id);
      expect(memberIds).toContain(user2Id);
      expect(memberIds).toContain(user3Id);
    });

    it('should remove user from group', async () => {
      // First add user to group
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      // Verify they're a member
      let member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });
      expect(member?.groupId).toBe(groupId);

      // Remove from group
      await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.id, user1Id));

      // Verify they're no longer a member
      member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });
      expect(member?.groupId).toBeNull();
    });

    it('should allow user to change groups', async () => {
      const group2Id = uuidv4();
      await db.insert(schema.groups).values({
        id: group2Id,
        name: 'Second Group',
        createdBy: user2Id,
      });

      // Add user to first group
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      // Move user to second group
      await db.update(schema.users).set({ groupId: group2Id }).where(eq(schema.users.id, user1Id));

      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      expect(member?.groupId).toBe(group2Id);
    });

    it('should get all members of a group', async () => {
      // Add multiple members
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user2Id));

      const members = await db.query.users.findMany({
        where: eq(schema.users.groupId, groupId),
      });

      expect(members).toHaveLength(2);
    });
  });

  describe('Admin Management', () => {
    it('should add user as group admin', async () => {
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(admin).toBeTruthy();
      expect(admin?.userId).toBe(user1Id);
      expect(admin?.groupId).toBe(groupId);
    });

    it('should add multiple admins to same group', async () => {
      await db.insert(schema.groupAdmins).values([
        { groupId, userId: user1Id },
        { groupId, userId: user2Id },
      ]);

      const admins = await db.query.groupAdmins.findMany({
        where: eq(schema.groupAdmins.groupId, groupId),
      });

      expect(admins).toHaveLength(2);
      const adminIds = admins.map((a) => a.userId);
      expect(adminIds).toContain(user1Id);
      expect(adminIds).toContain(user2Id);
    });

    it('should remove user as group admin', async () => {
      // First add as admin
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      // Remove admin
      await db
        .delete(schema.groupAdmins)
        .where(and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)));

      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(admin).toBeUndefined();
    });

    it('should check if user is group admin', async () => {
      // User1 is admin, user2 is not
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      const isUser1Admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      const isUser2Admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user2Id)),
      });

      expect(isUser1Admin).toBeTruthy();
      expect(isUser2Admin).toBeUndefined();
    });

    it('should prevent duplicate admin entries', async () => {
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      // Try to add same admin again
      await expect(async () => {
        await db.insert(schema.groupAdmins).values({
          groupId,
          userId: user1Id,
        });
      }).rejects.toThrow();
    });

    it('should cascade delete admins when group is deleted', async () => {
      // Add admin
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      // Delete group
      await db.delete(schema.groups).where(eq(schema.groups.id, groupId));

      // Admin entry should be gone
      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(admin).toBeUndefined();
    });
  });

  describe('Member and Admin Combined', () => {
    it('should make user both member and admin', async () => {
      // Add as member
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      // Add as admin
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(member?.groupId).toBe(groupId);
      expect(admin?.userId).toBe(user1Id);
    });

    it('should allow user to be admin without being member', async () => {
      // Add as admin only (not member)
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(member?.groupId).toBeNull();
      expect(admin?.userId).toBe(user1Id);
    });

    it('should remove member but keep admin role', async () => {
      // Add as both member and admin
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      // Remove as member
      await db.update(schema.users).set({ groupId: null }).where(eq(schema.users.id, user1Id));

      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      const admin = await db.query.groupAdmins.findFirst({
        where: and(eq(schema.groupAdmins.groupId, groupId), eq(schema.groupAdmins.userId, user1Id)),
      });

      expect(member?.groupId).toBeNull();
      expect(admin?.userId).toBe(user1Id);
    });
  });

  describe('Group Claiming', () => {
    it('should mark group as claimed by user', async () => {
      const claimedAt = new Date();

      await db
        .update(schema.groups)
        .set({
          claimedBy: user1Id,
          claimedAt,
        })
        .where(eq(schema.groups.id, groupId));

      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(group?.claimedBy).toBe(user1Id);
      expect(group?.claimedAt).toBeTruthy();
    });

    it('should check if group is claimable (not claimed and no admins)', async () => {
      // Group is claimable: not claimed and no admins
      const groupInfo = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, groupId))
        .limit(1);

      const isClaimable = groupInfo.length > 0 && !groupInfo[0].claimedBy && !groupInfo[0].adminUserId;

      expect(isClaimable).toBe(true);
    });

    it('should not be claimable if already claimed', async () => {
      // Claim the group
      await db
        .update(schema.groups)
        .set({
          claimedBy: user1Id,
          claimedAt: new Date(),
        })
        .where(eq(schema.groups.id, groupId));

      // Check if still claimable
      const groupInfo = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, groupId))
        .limit(1);

      const isClaimable = groupInfo.length > 0 && !groupInfo[0].claimedBy && !groupInfo[0].adminUserId;

      expect(isClaimable).toBe(false);
    });

    it('should not be claimable if has admins', async () => {
      // Add admin
      await db.insert(schema.groupAdmins).values({
        groupId,
        userId: user1Id,
      });

      // Check if claimable
      const groupInfo = await db
        .select({
          claimedBy: schema.groups.claimedBy,
          adminUserId: schema.groupAdmins.userId,
        })
        .from(schema.groups)
        .leftJoin(schema.groupAdmins, eq(schema.groups.id, schema.groupAdmins.groupId))
        .where(eq(schema.groups.id, groupId))
        .limit(1);

      const isClaimable = groupInfo.length > 0 && !groupInfo[0].claimedBy && !groupInfo[0].adminUserId;

      expect(isClaimable).toBe(false);
    });
  });

  describe('Group Updates', () => {
    it('should update group details', async () => {
      await db
        .update(schema.groups)
        .set({
          name: 'Updated Group Name',
          description: 'Updated description',
        })
        .where(eq(schema.groups.id, groupId));

      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(group?.name).toBe('Updated Group Name');
      expect(group?.description).toBe('Updated description');
    });

    it('should update group style', async () => {
      await db
        .update(schema.groups)
        .set({
          style: 'contemporânea',
        })
        .where(eq(schema.groups.id, groupId));

      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(group?.style).toBe('contemporânea');
    });

    it('should update group leader', async () => {
      await db
        .update(schema.groups)
        .set({
          leader: user2Id,
        })
        .where(eq(schema.groups.id, groupId));

      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(group?.leader).toBe(user2Id);
    });

    it('should track updatedAt timestamp', async () => {
      const initialGroup = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      // Wait a bit to ensure timestamp difference
      await new Promise((resolve) => setTimeout(resolve, 10));

      await db
        .update(schema.groups)
        .set({
          name: 'Updated Name',
        })
        .where(eq(schema.groups.id, groupId));

      const updatedGroup = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(updatedGroup?.updatedAt.getTime()).toBeGreaterThan(initialGroup?.updatedAt.getTime() || 0);
    });
  });

  describe('Group Deletion', () => {
    it('should delete group', async () => {
      await db.delete(schema.groups).where(eq(schema.groups.id, groupId));

      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, groupId),
      });

      expect(group).toBeUndefined();
    });

    it('should set members groupId to null when group is deleted', async () => {
      // Add member
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      // Delete group
      await db.delete(schema.groups).where(eq(schema.groups.id, groupId));

      // Member should have null groupId
      const member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });

      expect(member?.groupId).toBeNull();
    });

    it('should delete all admins when group is deleted', async () => {
      // Add admins
      await db.insert(schema.groupAdmins).values([
        { groupId, userId: user1Id },
        { groupId, userId: user2Id },
      ]);

      // Delete group
      await db.delete(schema.groups).where(eq(schema.groups.id, groupId));

      // Admins should be gone
      const admins = await db.query.groupAdmins.findMany({
        where: eq(schema.groupAdmins.groupId, groupId),
      });

      expect(admins).toHaveLength(0);
    });
  });

  describe('Complex Membership Scenarios', () => {
    it('should handle user joining multiple groups over time', async () => {
      const group2Id = uuidv4();
      const group3Id = uuidv4();

      await db.insert(schema.groups).values([
        {
          id: group2Id,
          name: 'Group 2',
          createdBy: user2Id,
        },
        {
          id: group3Id,
          name: 'Group 3',
          createdBy: user3Id,
        },
      ]);

      // Join group 1
      await db.update(schema.users).set({ groupId }).where(eq(schema.users.id, user1Id));

      let member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });
      expect(member?.groupId).toBe(groupId);

      // Move to group 2
      await db.update(schema.users).set({ groupId: group2Id }).where(eq(schema.users.id, user1Id));

      member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });
      expect(member?.groupId).toBe(group2Id);

      // Move to group 3
      await db.update(schema.users).set({ groupId: group3Id }).where(eq(schema.users.id, user1Id));

      member = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
      });
      expect(member?.groupId).toBe(group3Id);
    });

    it('should handle user being admin of multiple groups', async () => {
      const group2Id = uuidv4();
      await db.insert(schema.groups).values({
        id: group2Id,
        name: 'Group 2',
        createdBy: user2Id,
      });

      // Make user1 admin of both groups
      await db.insert(schema.groupAdmins).values([
        { groupId, userId: user1Id },
        { groupId: group2Id, userId: user1Id },
      ]);

      const adminOf = await db.query.groupAdmins.findMany({
        where: eq(schema.groupAdmins.userId, user1Id),
      });

      expect(adminOf).toHaveLength(2);
      const groupIds = adminOf.map((a) => a.groupId);
      expect(groupIds).toContain(groupId);
      expect(groupIds).toContain(group2Id);
    });

    it('should get all groups where user is admin', async () => {
      const group2Id = uuidv4();
      const group3Id = uuidv4();

      await db.insert(schema.groups).values([
        {
          id: group2Id,
          name: 'Group 2',
          createdBy: user2Id,
        },
        {
          id: group3Id,
          name: 'Group 3',
          createdBy: user3Id,
        },
      ]);

      await db.insert(schema.groupAdmins).values([
        { groupId, userId: user1Id },
        { groupId: group2Id, userId: user1Id },
      ]);

      const adminGroups = await db
        .select({
          groupId: schema.groupAdmins.groupId,
          groupName: schema.groups.name,
        })
        .from(schema.groupAdmins)
        .innerJoin(schema.groups, eq(schema.groupAdmins.groupId, schema.groups.id))
        .where(eq(schema.groupAdmins.userId, user1Id));

      expect(adminGroups).toHaveLength(2);
    });
  });
});
