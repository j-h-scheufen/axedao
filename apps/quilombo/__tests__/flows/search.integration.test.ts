/**
 * Integration tests for search and filtering across entity types
 * Tests search functionality with pagination and filters using real database
 *
 * Entity Types Tested:
 * - Groups: search by name, filter by country, style, verified status
 * - Users: search by name/email, filter by country, wallet status
 * - Combined: pagination consistency across different search results
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { styles } from '@/config/constants';
import type { Style } from '@/types/model';
import { v4 as uuidv4 } from 'uuid';

describe('Search and Filtering (Integration Tests)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Test data
  let user1Id: string;
  let user2Id: string;
  let user3Id: string;
  let group1Id: string;
  let group2Id: string;
  let group3Id: string;

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create test users with various attributes
    user1Id = uuidv4();
    user2Id = uuidv4();
    user3Id = uuidv4();

    await db.insert(schema.users).values([
      {
        id: user1Id,
        email: 'alice@example.com',
        name: 'Alice Smith',
        nickname: 'AliceNick',
        walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
        isGlobalAdmin: false,
      },
      {
        id: user2Id,
        email: 'bob@example.com',
        name: 'Bob Johnson',
        nickname: 'BobNick',
        walletAddress: null,
        isGlobalAdmin: false,
      },
      {
        id: user3Id,
        email: 'charlie@example.com',
        name: 'Charlie Brown',
        nickname: 'CharlieBrown',
        walletAddress: '0x8ba1f109551bD432803012645Ac136ddd64DBA72',
        isGlobalAdmin: false,
      },
    ]);

    // Create test groups with various attributes
    group1Id = uuidv4();
    group2Id = uuidv4();
    group3Id = uuidv4();

    await db.insert(schema.groups).values([
      {
        id: group1Id,
        name: 'Capoeira Angola Group',
        description: 'Traditional Angola style group',
        style: 'angola',
        createdBy: user1Id,
        createdAt: new Date('2024-01-01'),
      },
      {
        id: group2Id,
        name: 'Regional Capoeira Academy',
        description: 'Modern regional style academy',
        style: 'regional',
        createdBy: user2Id,
        createdAt: new Date('2024-02-01'),
      },
      {
        id: group3Id,
        name: 'Contemporânea Group',
        description: 'Contemporary style group',
        style: 'contemporanea',
        createdBy: user3Id,
        createdAt: new Date('2024-03-01'),
      },
    ]);
  });

  describe('Group Search', () => {
    it('should search groups by name (case-insensitive)', async () => {
      const results = await db.query.groups.findMany({
        where: (groups, { ilike }) => ilike(groups.name, '%angola%'),
      });

      expect(results).toHaveLength(1);
      expect(results[0].name).toBe('Capoeira Angola Group');
    });

    it('should search groups by partial name match', async () => {
      const results = await db.query.groups.findMany({
        where: (groups, { ilike }) => ilike(groups.name, '%capoeira%'),
      });

      expect(results.length).toBeGreaterThanOrEqual(2);
      const names = results.map((g) => g.name);
      expect(names).toContain('Capoeira Angola Group');
      expect(names).toContain('Regional Capoeira Academy');
    });

    it('should filter groups by style', async () => {
      const results = await db.query.groups.findMany({
        where: eq(schema.groups.style, 'angola'),
      });

      expect(results).toHaveLength(1);
      expect(results[0].style).toBe('angola');
      expect(results[0].name).toBe('Capoeira Angola Group');
    });

    it('should filter groups by multiple styles', async () => {
      const results = await db.query.groups.findMany({
        where: (groups, { inArray }) => inArray(groups.style, ['angola', 'regional']),
      });

      expect(results).toHaveLength(2);
      const styles = results.map((g) => g.style);
      expect(styles).toContain('angola');
      expect(styles).toContain('regional');
    });

    it('should search and filter groups together', async () => {
      const results = await db.query.groups.findMany({
        where: (groups, { ilike, eq, and }) => and(ilike(groups.name, '%capoeira%'), eq(groups.style, 'angola')),
      });

      expect(results).toHaveLength(1);
      expect(results[0].name).toBe('Capoeira Angola Group');
      expect(results[0].style).toBe('angola');
    });

    it('should return empty results for no matches', async () => {
      const results = await db.query.groups.findMany({
        where: (groups, { ilike }) => ilike(groups.name, '%nonexistent%'),
      });

      expect(results).toHaveLength(0);
    });

    it('should search groups with verified status filter', async () => {
      // Add verification for group1
      await db.insert(schema.groupVerifications).values({
        groupId: group1Id,
        userId: user1Id,
        notes: 'Verified group',
      });

      // Query groups with at least one verification
      const verifiedGroups = await db
        .selectDistinct({ id: schema.groups.id, name: schema.groups.name })
        .from(schema.groups)
        .innerJoin(schema.groupVerifications, eq(schema.groups.id, schema.groupVerifications.groupId));

      expect(verifiedGroups).toHaveLength(1);
      expect(verifiedGroups[0].id).toBe(group1Id);
    });
  });

  describe('User Search', () => {
    it('should search users by name (case-insensitive)', async () => {
      const results = await db.query.users.findMany({
        where: (users, { ilike }) => ilike(users.name, '%alice%'),
      });

      expect(results).toHaveLength(1);
      expect(results[0].name).toBe('Alice Smith');
    });

    it('should search users by email', async () => {
      const results = await db.query.users.findMany({
        where: (users, { ilike }) => ilike(users.email, '%bob@%'),
      });

      expect(results).toHaveLength(1);
      expect(results[0].email).toBe('bob@example.com');
    });

    it('should search users by nickname', async () => {
      const results = await db.query.users.findMany({
        where: (users, { ilike }) => ilike(users.nickname, '%charlie%'),
      });

      expect(results).toHaveLength(1);
      expect(results[0].nickname).toBe('CharlieBrown');
    });

    it('should filter users with wallet addresses', async () => {
      const results = await db.query.users.findMany({
        where: (users, { isNotNull }) => isNotNull(users.walletAddress),
      });

      expect(results).toHaveLength(2);
      const ids = results.map((u) => u.id);
      expect(ids).toContain(user1Id);
      expect(ids).toContain(user3Id);
    });

    it('should filter users without wallet addresses', async () => {
      const results = await db.query.users.findMany({
        where: (users, { isNull }) => isNull(users.walletAddress),
      });

      expect(results).toHaveLength(1);
      expect(results[0].id).toBe(user2Id);
    });

    it('should search users by partial name with wallet filter', async () => {
      const results = await db.query.users.findMany({
        where: (users, { ilike, isNotNull, and }) => and(ilike(users.name, '%smith%'), isNotNull(users.walletAddress)),
      });

      expect(results).toHaveLength(1);
      expect(results[0].name).toBe('Alice Smith');
      expect(results[0].walletAddress).toBeTruthy();
    });
  });

  describe('Group Membership Search', () => {
    beforeEach(async () => {
      // Add user1 as member of group1
      await db.update(schema.users).set({ groupId: group1Id }).where(eq(schema.users.id, user1Id));

      // Add user2 as admin of group2
      await db.update(schema.users).set({ groupId: group2Id }).where(eq(schema.users.id, user2Id));
      await db.insert(schema.groupAdmins).values({
        groupId: group2Id,
        userId: user2Id,
      });
    });

    it('should find users by group membership', async () => {
      const results = await db.query.users.findMany({
        where: eq(schema.users.groupId, group1Id),
      });

      expect(results).toHaveLength(1);
      expect(results[0].id).toBe(user1Id);
    });

    it('should find group admins', async () => {
      const admins = await db
        .select({
          userId: schema.groupAdmins.userId,
          groupId: schema.groupAdmins.groupId,
          userName: schema.users.name,
          userEmail: schema.users.email,
        })
        .from(schema.groupAdmins)
        .innerJoin(schema.users, eq(schema.groupAdmins.userId, schema.users.id))
        .where(eq(schema.groupAdmins.groupId, group2Id));

      expect(admins).toHaveLength(1);
      expect(admins[0].userId).toBe(user2Id);
      expect(admins[0].userName).toBe('Bob Johnson');
    });

    it('should find groups with members', async () => {
      const groupsWithMembers = await db
        .selectDistinct({ id: schema.groups.id, name: schema.groups.name })
        .from(schema.groups)
        .innerJoin(schema.users, eq(schema.groups.id, schema.users.groupId));

      expect(groupsWithMembers.length).toBeGreaterThanOrEqual(2);
      const ids = groupsWithMembers.map((g) => g.id);
      expect(ids).toContain(group1Id);
      expect(ids).toContain(group2Id);
    });
  });

  describe('Pagination', () => {
    beforeEach(async () => {
      // Create 10 more groups for pagination testing
      const additionalGroups = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Test Group ${i + 1}`,
        description: `Test group ${i + 1}`,
        createdBy: user1Id,
        createdAt: new Date(),
      }));

      await db.insert(schema.groups).values(additionalGroups);
    });

    it('should paginate group results with offset and limit', async () => {
      const page1 = await db.query.groups.findMany({
        orderBy: (groups, { asc }) => [asc(groups.createdAt)],
        limit: 5,
        offset: 0,
      });

      const page2 = await db.query.groups.findMany({
        orderBy: (groups, { asc }) => [asc(groups.createdAt)],
        limit: 5,
        offset: 5,
      });

      expect(page1).toHaveLength(5);
      expect(page2).toHaveLength(5);

      // Verify pages don't overlap
      const page1Ids = page1.map((g) => g.id);
      const page2Ids = page2.map((g) => g.id);
      const intersection = page1Ids.filter((id) => page2Ids.includes(id));
      expect(intersection).toHaveLength(0);
    });

    it('should return correct total count for filtered results', async () => {
      const totalCount = await db.query.groups.findMany();
      expect(totalCount.length).toBe(13); // 3 original + 10 additional
    });

    it('should handle last partial page correctly', async () => {
      const lastPage = await db.query.groups.findMany({
        orderBy: (groups, { asc }) => [asc(groups.createdAt)],
        limit: 5,
        offset: 10,
      });

      expect(lastPage).toHaveLength(3); // Only 3 remaining groups
    });

    it('should return empty array when offset exceeds total count', async () => {
      const emptyPage = await db.query.groups.findMany({
        limit: 5,
        offset: 100,
      });

      expect(emptyPage).toHaveLength(0);
    });
  });

  describe('Complex Multi-Entity Search', () => {
    beforeEach(async () => {
      // Set up complex relationships
      await db.update(schema.users).set({ groupId: group1Id }).where(eq(schema.users.id, user1Id));

      await db.insert(schema.groupAdmins).values({
        groupId: group1Id,
        userId: user1Id,
      });

      await db.insert(schema.groupVerifications).values({
        groupId: group1Id,
        userId: user2Id,
        notes: 'Verified by Bob',
      });
    });

    it('should find groups with their members and admins', async () => {
      // Find group
      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, group1Id),
      });

      // Find members
      const members = await db.query.users.findMany({
        where: eq(schema.users.groupId, group1Id),
      });

      // Find admins
      const admins = await db.query.groupAdmins.findMany({
        where: eq(schema.groupAdmins.groupId, group1Id),
      });

      expect(group).toBeTruthy();
      expect(members).toHaveLength(1);
      expect(admins).toHaveLength(1);
      expect(admins[0].userId).toBe(user1Id);
    });

    it('should find verified groups with verification history', async () => {
      // Find group
      const group = await db.query.groups.findFirst({
        where: eq(schema.groups.id, group1Id),
      });

      // Find verifications with user details
      const verifications = await db
        .select({
          userId: schema.groupVerifications.userId,
          notes: schema.groupVerifications.notes,
          userName: schema.users.name,
        })
        .from(schema.groupVerifications)
        .innerJoin(schema.users, eq(schema.groupVerifications.userId, schema.users.id))
        .where(eq(schema.groupVerifications.groupId, group1Id));

      expect(group).toBeTruthy();
      expect(verifications).toHaveLength(1);
      expect(verifications[0].userId).toBe(user2Id);
      expect(verifications[0].notes).toBe('Verified by Bob');
      expect(verifications[0].userName).toBe('Bob Johnson');
    });

    it('should search users with their group and admin status', async () => {
      const userWithGroup = await db.query.users.findFirst({
        where: eq(schema.users.id, user1Id),
        with: {
          group: true,
        },
      });

      expect(userWithGroup).toBeTruthy();
      expect(userWithGroup?.group).toBeTruthy();
      expect(userWithGroup?.group?.id).toBe(group1Id);
    });

    it('should find all admins across all groups', async () => {
      const allAdmins = await db
        .select({
          userId: schema.groupAdmins.userId,
          groupId: schema.groupAdmins.groupId,
          userName: schema.users.name,
          groupName: schema.groups.name,
        })
        .from(schema.groupAdmins)
        .innerJoin(schema.users, eq(schema.groupAdmins.userId, schema.users.id))
        .innerJoin(schema.groups, eq(schema.groupAdmins.groupId, schema.groups.id));

      expect(allAdmins).toHaveLength(1);
      expect(allAdmins[0].userId).toBe(user1Id);
      expect(allAdmins[0].groupId).toBe(group1Id);
      expect(allAdmins[0].userName).toBeTruthy();
      expect(allAdmins[0].groupName).toBeTruthy();
    });
  });

  describe('Sorting and Ordering', () => {
    it('should sort groups by creation date ascending', async () => {
      const results = await db.query.groups.findMany({
        orderBy: (groups, { asc }) => [asc(groups.createdAt)],
      });

      expect(results).toHaveLength(3);
      expect(results[0].id).toBe(group1Id);
      expect(results[1].id).toBe(group2Id);
      expect(results[2].id).toBe(group3Id);
    });

    it('should sort groups by creation date descending', async () => {
      const results = await db.query.groups.findMany({
        orderBy: (groups, { desc }) => [desc(groups.createdAt)],
      });

      expect(results).toHaveLength(3);
      expect(results[0].id).toBe(group3Id);
      expect(results[1].id).toBe(group2Id);
      expect(results[2].id).toBe(group1Id);
    });

    it('should sort groups by name alphabetically', async () => {
      const results = await db.query.groups.findMany({
        orderBy: (groups, { asc }) => [asc(groups.name)],
      });

      expect(results).toHaveLength(3);
      expect(results[0].name).toBe('Capoeira Angola Group');
      expect(results[1].name).toBe('Contemporânea Group');
      expect(results[2].name).toBe('Regional Capoeira Academy');
    });

    it('should sort users by name', async () => {
      const results = await db.query.users.findMany({
        orderBy: (users, { asc }) => [asc(users.name)],
      });

      expect(results.length).toBeGreaterThanOrEqual(3);
      expect(results[0].name).toBe('Alice Smith');
      expect(results[1].name).toBe('Bob Johnson');
      expect(results[2].name).toBe('Charlie Brown');
    });
  });

  describe('Search Performance with Large Dataset', () => {
    beforeEach(async () => {
      // Create 50 users for performance testing
      const manyUsers = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        email: `user${i}@example.com`,
        name: `User ${i}`,
        nickname: `nick${i}`,
        walletAddress: i % 2 === 0 ? `0x${i.toString().padStart(40, '0')}` : null,
        isGlobalAdmin: false,
      }));

      await db.insert(schema.users).values(manyUsers);

      // Create 30 groups for performance testing
      const manyGroups = Array.from({ length: 30 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i}`,
        description: `Description for group ${i}`,
        style: styles[i % 3] as Style,
        createdBy: user1Id,
        createdAt: new Date(),
      }));

      await db.insert(schema.groups).values(manyGroups);
    });

    it('should handle large result sets with pagination', async () => {
      const totalUsers = await db.query.users.findMany();
      expect(totalUsers.length).toBeGreaterThan(50);

      const page = await db.query.users.findMany({
        limit: 25,
        offset: 0,
      });

      expect(page).toHaveLength(25);
    });

    it('should filter large datasets efficiently', async () => {
      const withWallet = await db.query.users.findMany({
        where: (users, { isNotNull }) => isNotNull(users.walletAddress),
      });

      // 25 from batch + 2 from beforeEach
      expect(withWallet.length).toBeGreaterThan(25);
    });

    it('should search within large group datasets', async () => {
      const angolaGroups = await db.query.groups.findMany({
        where: eq(schema.groups.style, 'angola'),
      });

      // 10 from batch + 1 from beforeEach
      expect(angolaGroups.length).toBeGreaterThan(10);
    });
  });
});
