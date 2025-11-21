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
import { v4 as uuidv4 } from 'uuid';

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
      // Create 10 groups
      const groups = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      expect(result.rows).toHaveLength(10);
      expect(result.totalCount).toBe(10);
    });

    it('should return correct totalCount when results span multiple pages', async () => {
      // Create 50 groups
      const groups = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      // CRITICAL: totalCount should be 50, NOT 25 (the bug we're preventing)
      expect(result.rows).toHaveLength(25);
      expect(result.totalCount).toBe(50);
    });

    it('should return same totalCount across different pages', async () => {
      // Create 75 groups
      const groups = Array.from({ length: 75 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

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
      // Create 100 groups
      const groups = Array.from({ length: 100 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

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
      // Create groups with multiple locations (tests the subquery approach)
      const group1Id = uuidv4();
      const group2Id = uuidv4();
      const group3Id = uuidv4();

      await db.insert(schema.groups).values([
        { id: group1Id, name: 'Group 1', createdBy: userId, createdAt: new Date() },
        { id: group2Id, name: 'Group 2', createdBy: userId, createdAt: new Date() },
        { id: group3Id, name: 'Group 3', createdBy: userId, createdAt: new Date() },
      ]);

      // Add multiple locations to each group
      await db.insert(schema.groupLocations).values([
        {
          groupId: group1Id,
          name: 'Location 1A',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-122.4, 37.8] },
            properties: { country_code: 'US' },
          },
        },
        {
          groupId: group1Id,
          name: 'Location 1B',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-73.9, 40.7] },
            properties: { country_code: 'US' },
          },
        },
        {
          groupId: group2Id,
          name: 'Location 2A',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-43.2, -22.9] },
            properties: { country_code: 'BR' },
          },
        },
        {
          groupId: group2Id,
          name: 'Location 2B',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-46.6, -23.5] },
            properties: { country_code: 'BR' },
          },
        },
        {
          groupId: group3Id,
          name: 'Location 3A',
          feature: {
            type: 'Feature',
            geometry: { type: 'Point', coordinates: [-0.1, 51.5] },
            properties: { country_code: 'GB' },
          },
        },
      ]);

      const result = await searchGroups({ pageSize: 10, offset: 0 });

      // CRITICAL: Should count 3 groups, not 5 locations
      expect(result.totalCount).toBe(3);
      expect(result.rows).toHaveLength(3);

      // Verify countryCodes are properly aggregated (lowercase due to trigger normalization)
      const group1 = result.rows.find((g) => g.id === group1Id);
      const group2 = result.rows.find((g) => g.id === group2Id);
      expect(group1?.countryCodes).toEqual(['us']);
      expect(group2?.countryCodes).toEqual(['br']);
    });
  });

  describe('Pagination Consistency', () => {
    beforeEach(async () => {
      // Create 50 groups for pagination testing
      const groups = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${String(i + 1).padStart(3, '0')}`, // Padded for consistent ordering
        createdBy: userId,
        createdAt: new Date(Date.now() + i * 1000), // Different timestamps for ordering
      }));
      await db.insert(schema.groups).values(groups);
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
    beforeEach(async () => {
      const group1Id = uuidv4();
      const group2Id = uuidv4();
      const group3Id = uuidv4();
      const group4Id = uuidv4();

      await db.insert(schema.groups).values([
        { id: group1Id, name: 'Angola Group 1', style: 'angola', createdBy: userId, createdAt: new Date() },
        { id: group2Id, name: 'Angola Group 2', style: 'angola', createdBy: userId, createdAt: new Date() },
        { id: group3Id, name: 'Regional Group 1', style: 'regional', createdBy: userId, createdAt: new Date() },
        { id: group4Id, name: 'Regional Group 2', style: 'regional', createdBy: userId, createdAt: new Date() },
      ]);

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

      await db.insert(schema.groupVerifications).values([{ groupId: group1Id, userId, notes: 'Verified' }]);
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

    it('should return correct totalCount when filtering by verified status', async () => {
      const verifiedResult = await searchGroups({
        pageSize: 10,
        offset: 0,
        filters: { verified: true },
      });

      expect(verifiedResult.totalCount).toBe(1);
      expect(verifiedResult.rows).toHaveLength(1);
    });

    it('should return correct totalCount when combining filters', async () => {
      const result = await searchGroups({
        pageSize: 10,
        offset: 0,
        filters: { styles: ['angola'], verified: true },
      });

      expect(result.totalCount).toBe(1);
      expect(result.rows).toHaveLength(1);
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
      await db.insert(schema.groups).values({
        id: uuidv4(),
        name: 'Only Group',
        createdBy: userId,
        createdAt: new Date(),
      });

      const result = await searchGroups({ pageSize: 25, offset: 0 });

      expect(result.rows).toHaveLength(1);
      expect(result.totalCount).toBe(1);
    });

    it('should handle pageSize larger than total results', async () => {
      const groups = Array.from({ length: 10 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

      const result = await searchGroups({ pageSize: 100, offset: 0 });

      expect(result.rows).toHaveLength(10);
      expect(result.totalCount).toBe(10);
    });

    it('should handle very large page sizes', async () => {
      const groups = Array.from({ length: 5 }, (_, i) => ({
        id: uuidv4(),
        name: `Group ${i + 1}`,
        createdBy: userId,
        createdAt: new Date(),
      }));
      await db.insert(schema.groups).values(groups);

      const result = await searchGroups({ pageSize: 1000, offset: 0 });

      expect(result.rows).toHaveLength(5);
      expect(result.totalCount).toBe(5);
    });
  });
});
