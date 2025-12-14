/**
 * Integration tests for searchGroups pagination and totalCount correctness
 *
 * CRITICAL: These tests prevent regressions in pagination logic, specifically:
 * - Bug: totalCount was returning pageSize instead of actual total when using GROUP BY
 * - Fix: Moved to subquery approach without GROUP BY to make count(*) over() work correctly
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../../setup/db-container';
import { searchGroups } from '@/db/queries/groups';
import * as schema from '@/db/schema';
import * as genealogySchema from '@/db/schema/genealogy';
import { v4 as uuidv4 } from 'uuid';

/**
 * Helper function to create groups with their required genealogy profiles.
 * Since searchGroups now requires groups to have a linked genealogy profile,
 * all test groups must be created with this helper.
 */
async function createGroupsWithProfiles(
  db: Awaited<ReturnType<typeof setupTestDatabase>>['db'],
  groupDefs: Array<{
    id: string;
    name: string;
    createdBy: string;
    style?: schema.SelectGroup['style'];
  }>
) {
  // First create genealogy profiles
  const profiles = groupDefs.map((g) => ({
    id: uuidv4(),
    name: g.name,
    style: g.style || null,
    descriptionEn: `Description for ${g.name}`,
  }));
  await db.insert(genealogySchema.groupProfiles).values(profiles);

  // Then create groups that reference the profiles
  const groups = groupDefs.map((g, i) => ({
    id: g.id,
    name: g.name,
    style: g.style || null,
    profileId: profiles[i].id,
    createdBy: g.createdBy,
    createdAt: new Date(),
  }));
  await db.insert(schema.groups).values(groups);
}

describe('searchGroups - Pagination and TotalCount (Integration)', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];
  let userId: string;

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create test user
    userId = uuidv4();
    await db.insert(schema.users).values({
      id: userId,
      email: 'test@example.com',
      name: 'Test User',
      isGlobalAdmin: false,
    });
  });

  describe('TotalCount Correctness', () => {
    it('should return correct totalCount when results fit in one page', async () => {
      // Create 10 groups with profiles
      const groupDefs = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      expect(result.rows).toHaveLength(10);
      expect(result.totalCount).toBe(10);
    });

    it('should return correct totalCount when results span multiple pages', async () => {
      // Create 50 groups with profiles
      const groupDefs = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      // CRITICAL: totalCount should be 50, NOT 25 (the bug we're preventing)
      expect(result.rows).toHaveLength(25);
      expect(result.totalCount).toBe(50);
    });

    it('should return same totalCount across different pages', async () => {
      // Create 75 groups with profiles
      const groupDefs = Array.from({ length: 75 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const page1 = await searchGroups({ pageSize: 25, offset: 0 });
      const page2 = await searchGroups({ pageSize: 25, offset: 25 });
      const page3 = await searchGroups({ pageSize: 25, offset: 50 });

      // All pages should report the same total count
      expect(page1.totalCount).toBe(75);
      expect(page2.totalCount).toBe(75);
      expect(page3.totalCount).toBe(75);

      // Verify correct page sizes
      expect(page1.rows).toHaveLength(25);
      expect(page2.rows).toHaveLength(25);
      expect(page3.rows).toHaveLength(25);
    });

    it('should return correct totalCount with different page sizes', async () => {
      // Create 100 groups with profiles
      const groupDefs = Array.from({ length: 100 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const result10 = await searchGroups({ pageSize: 10, offset: 0 });
      const result25 = await searchGroups({ pageSize: 25, offset: 0 });
      const result50 = await searchGroups({ pageSize: 50, offset: 0 });

      // Total count should be 100 regardless of page size
      expect(result10.totalCount).toBe(100);
      expect(result25.totalCount).toBe(100);
      expect(result50.totalCount).toBe(100);

      // But returned rows should match page size
      expect(result10.rows).toHaveLength(10);
      expect(result25.rows).toHaveLength(25);
      expect(result50.rows).toHaveLength(50);
    });

    it('should return correct totalCount with groups that have multiple locations', async () => {
      // Create 10 groups with multiple locations each
      // This tests the CRITICAL bug: GROUP BY + LEFT JOIN + window function
      // Bug: window function counts joined rows (20) instead of groups (10)
      const groupDefs = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);
      const groupIds = groupDefs.map((g) => g.id);

      // Give each group 2 locations (20 total location rows after JOIN)
      const locationData = groupIds.flatMap((groupId, i) => [
        {
          groupId,
          name: `Location ${i + 1}A`,
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-122.4 + i, 37.8] },
            properties: { country_code: i % 2 === 0 ? 'US' : 'BR' },
          },
        },
        {
          groupId,
          name: `Location ${i + 1}B`,
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-122.3 + i, 37.9] },
            properties: { country_code: i % 2 === 0 ? 'US' : 'BR' },
          },
        },
      ]);
      await db.insert(schema.groupLocations).values(locationData);

      // Query first page with pageSize < totalCount
      const page1 = await searchGroups({ pageSize: 3, offset: 0 });

      // CRITICAL: Should count 10 groups, NOT 20 locations (the bug)
      // With broken window function + GROUP BY: would return 20
      expect(page1.totalCount).toBe(10);
      expect(page1.rows).toHaveLength(3);

      // Verify second page reports same totalCount
      const page2 = await searchGroups({ pageSize: 3, offset: 3 });
      expect(page2.totalCount).toBe(10);
      expect(page2.rows).toHaveLength(3);

      // Verify countryCodes are properly aggregated (both locations have same country)
      const firstGroup = page1.rows[0];
      expect(firstGroup.countryCodes).toHaveLength(1);
      expect(['us', 'br']).toContain(firstGroup.countryCodes[0]);
    });
  });

  describe('Pagination Consistency', () => {
    beforeEach(async () => {
      // Create 50 groups with profiles for pagination testing
      const groupDefs = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${String(i + 1).padStart(3, '0')}`, // Padded for consistent ordering
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);
    });

    it('should not have overlapping results between pages', async () => {
      const page1 = await searchGroups({ pageSize: 20, offset: 0 });
      const page2 = await searchGroups({ pageSize: 20, offset: 20 });

      const page1Ids = page1.rows.map((g) => g.id);
      const page2Ids = page2.rows.map((g) => g.id);

      const intersection = page1Ids.filter((id) => page2Ids.includes(id));
      expect(intersection).toHaveLength(0);
    });

    it('should handle partial last page correctly', async () => {
      const page1 = await searchGroups({ pageSize: 30, offset: 0 });
      const page2 = await searchGroups({ pageSize: 30, offset: 30 });

      expect(page1.rows).toHaveLength(30);
      expect(page1.totalCount).toBe(50);

      expect(page2.rows).toHaveLength(20); // Only 20 remaining
      expect(page2.totalCount).toBe(50); // But total is still 50
    });

    it('should return empty array when offset exceeds total', async () => {
      const result = await searchGroups({ pageSize: 25, offset: 100 });

      expect(result.rows).toHaveLength(0);
      expect(result.totalCount).toBe(50); // Total count is still reported correctly
    });

    it('should handle offset at exact boundary', async () => {
      const result = await searchGroups({ pageSize: 25, offset: 50 });

      expect(result.rows).toHaveLength(0);
      expect(result.totalCount).toBe(50);
    });
  });

  describe('TotalCount with Filters', () => {
    let group1Id: string;
    let group2Id: string;

    beforeEach(async () => {
      group1Id = uuidv4();
      group2Id = uuidv4();
      const group3Id = uuidv4();
      const group4Id = uuidv4();

      // Create groups with profiles - need style on the profile
      const groupDefs = [
        { id: group1Id, name: 'Angola Group 1', style: 'angola' as const, createdBy: userId },
        { id: group2Id, name: 'Angola Group 2', style: 'angola' as const, createdBy: userId },
        { id: group3Id, name: 'Regional Group 1', style: 'regional' as const, createdBy: userId },
        { id: group4Id, name: 'Regional Group 2', style: 'regional' as const, createdBy: userId },
      ];
      await createGroupsWithProfiles(db, groupDefs);

      await db.insert(schema.groupLocations).values([
        {
          groupId: group1Id,
          name: 'Brazil Location',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-43.2, -22.9] },
            properties: { country_code: 'BR' },
          },
        },
        {
          groupId: group2Id,
          name: 'US Location',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-122.4, 37.8] },
            properties: { country_code: 'US' },
          },
        },
      ]);
    });

    it('should return correct totalCount when filtering by style', async () => {
      const angolaResult = await searchGroups({
        pageSize: 10,
        offset: 0,
        filters: { styles: ['angola'] },
      });

      expect(angolaResult.totalCount).toBe(2);
      expect(angolaResult.rows).toHaveLength(2);
    });

    it('should return correct totalCount when filtering by country code', async () => {
      const brResult = await searchGroups({
        pageSize: 10,
        offset: 0,
        filters: { countryCodes: ['BR'] },
      });

      expect(brResult.totalCount).toBe(1);
      expect(brResult.rows).toHaveLength(1);
    });

    it('should return correct totalCount with search term', async () => {
      const result = await searchGroups({
        pageSize: 10,
        offset: 0,
        searchTerm: 'Angola',
      });

      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });

    it('should return zero totalCount when no results match filters', async () => {
      const result = await searchGroups({
        pageSize: 10,
        offset: 0,
        filters: { countryCodes: ['FR'] }, // No French groups
      });

      expect(result.totalCount).toBe(0);
      expect(result.rows).toHaveLength(0);
    });
  });

  describe('Edge Cases', () => {
    it('should handle empty database correctly', async () => {
      const result = await searchGroups({ pageSize: 25, offset: 0 });

      expect(result.rows).toHaveLength(0);
      expect(result.totalCount).toBe(0);
    });

    it('should handle single group correctly', async () => {
      await createGroupsWithProfiles(db, [{ id: uuidv4(), name: 'Only Group', createdBy: userId }]);

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      expect(result.rows).toHaveLength(1);
      expect(result.totalCount).toBe(1);
    });

    it('should handle pageSize larger than total results', async () => {
      const groupDefs = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const result = await searchGroups({ pageSize: 100, offset: 0 });

      expect(result.rows).toHaveLength(10);
      expect(result.totalCount).toBe(10);
    });

    it('should handle very large page sizes', async () => {
      const groupDefs = Array.from({ length: 5 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
      }));
      await createGroupsWithProfiles(db, groupDefs);

      const result = await searchGroups({ pageSize: 1000, offset: 0 });

      expect(result.rows).toHaveLength(5);
      expect(result.totalCount).toBe(5);
    });
  });
});
