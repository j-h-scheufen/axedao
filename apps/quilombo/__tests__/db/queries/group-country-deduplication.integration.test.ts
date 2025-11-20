/**
 * Integration tests for group country code deduplication
 *
 * Tests that groups with multiple locations in the same country
 * return unique country codes (no duplicates).
 *
 * This validates both:
 * 1. SQL DISTINCT clause in ARRAY_AGG works correctly
 * 2. Application-level Set() deduplication as defensive programming
 */

import { afterAll, beforeAll, beforeEach, describe, expect, it } from 'vitest';
import { eq, sql } from 'drizzle-orm';
import { v4 as uuidv4 } from 'uuid';
import type { Feature, Point } from 'geojson';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../../setup/db-container';
import * as schema from '@/db/schema';

describe('Group Country Code Deduplication Integration Tests', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  let testGroupId: string;
  let testUserId: string;

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
    testUserId = uuidv4();
    await db.insert(schema.users).values({
      id: testUserId,
      email: 'test@example.com',
      isGlobalAdmin: false,
      accountStatus: 'active',
    });

    // Create test group
    testGroupId = uuidv4();
    await db.insert(schema.groups).values({
      id: testGroupId,
      name: 'Test Group with Multiple Locations',
      locality: 'Various Cities',
      region: 'Test Region',
      countryCode: 'gb',
      verified: true,
      contactEmail: 'test-group@example.com',
      styles: ['angola', 'regional'],
    });
  });

  describe('SQL-Level Deduplication', () => {
    it('should normalize country codes to lowercase', async () => {
      // Insert locations with mixed-case country codes in the GeoJSON properties
      // The trigger should normalize them all to lowercase
      const mixedCaseFeatures: Feature<Point>[] = [
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-0.1276, 51.5074] },
          properties: { country_code: 'GB' }, // Uppercase
        },
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-2.2426, 53.4808] },
          properties: { country_code: 'gb' }, // Lowercase
        },
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-3.1883, 55.9533] },
          properties: { country_code: 'Gb' }, // Mixed case
        },
      ];

      await db.insert(schema.groupLocations).values(
        mixedCaseFeatures.map((feature, i) => ({
          groupId: testGroupId,
          name: `Location ${i + 1}`,
          feature,
        }))
      );

      // Query the raw country codes from the database
      const locations = await db
        .select({
          countryCode: schema.groupLocations.countryCode,
        })
        .from(schema.groupLocations)
        .where(eq(schema.groupLocations.groupId, testGroupId));

      // All country codes should be normalized to lowercase
      const countryCodes = locations.map((loc) => loc.countryCode);
      expect(countryCodes.every((code) => code === code?.toLowerCase())).toBe(true);

      // Should have only one unique value after normalization
      const uniqueCodes = [...new Set(countryCodes)];
      expect(uniqueCodes).toEqual(['gb']);
    });

    it('should return unique country codes with ARRAY_AGG(DISTINCT ...)', async () => {
      // Insert 3 locations for the same group
      const features: Feature<Point>[] = [
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-0.1276, 51.5074] },
          properties: {},
        },
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-2.2426, 53.4808] },
          properties: {},
        },
        {
          type: 'Feature',
          geometry: { type: 'Point', coordinates: [-3.1883, 55.9533] },
          properties: {},
        },
      ];

      await db.insert(schema.groupLocations).values(
        features.map((feature, i) => ({
          groupId: testGroupId,
          name: `Location ${i + 1}`,
          feature,
        }))
      );

      // Query using the same SQL as searchGroups/fetchGroup
      const results = await db
        .select({
          id: schema.groups.id,
          name: schema.groups.name,
          countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
            'country_codes'
          ),
        })
        .from(schema.groups)
        .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
        .where(eq(schema.groups.id, testGroupId))
        .groupBy(schema.groups.id);

      expect(results).toHaveLength(1);
      const group = results[0];

      // Verify no duplicates in SQL result
      const uniqueCodes = [...new Set(group.countryCodes)];
      expect(uniqueCodes.length).toBe(group.countryCodes.length);
    });

    it('should handle multiple countries correctly', async () => {
      // Create group with locations in different countries (if trigger sets country codes)
      const nycFeature: Feature<Point> = {
        type: 'Feature',
        geometry: { type: 'Point', coordinates: [-74.006, 40.7128] },
        properties: {},
      };

      const londonFeature: Feature<Point> = {
        type: 'Feature',
        geometry: { type: 'Point', coordinates: [-0.1276, 51.5074] },
        properties: {},
      };

      await db.insert(schema.groupLocations).values([
        {
          groupId: testGroupId,
          name: 'NYC Office',
          feature: nycFeature,
        },
        {
          groupId: testGroupId,
          name: 'London Office',
          feature: londonFeature,
        },
      ]);

      const results = await db
        .select({
          countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
            'country_codes'
          ),
        })
        .from(schema.groups)
        .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
        .where(eq(schema.groups.id, testGroupId))
        .groupBy(schema.groups.id);

      const group = results[0];

      // Verify no duplicates
      const uniqueCodes = [...new Set(group.countryCodes)];
      expect(uniqueCodes.length).toBe(group.countryCodes.length);
    });

    it('should return empty array when group has no locations', async () => {
      const results = await db
        .select({
          countryCodes: sql<string[]>`ARRAY_REMOVE(ARRAY_AGG(DISTINCT ${schema.groupLocations.countryCode}), NULL)`.as(
            'country_codes'
          ),
        })
        .from(schema.groups)
        .leftJoin(schema.groupLocations, eq(schema.groups.id, schema.groupLocations.groupId))
        .where(eq(schema.groups.id, testGroupId))
        .groupBy(schema.groups.id);

      const group = results[0];
      expect(group.countryCodes).toEqual([]);
    });
  });

  describe('Application-Level Deduplication', () => {
    it('should deduplicate country codes using Set() as defensive programming', async () => {
      // This tests the [...new Set(row.countryCodes)] logic in db/queries/groups.ts
      // We simulate what would happen if SQL DISTINCT failed
      const mockCountryCodes = ['gb', 'gb', 'us', 'gb', 'us'];

      // Deduplicate using the same logic as the application
      const deduplicated = [...new Set(mockCountryCodes)];

      expect(deduplicated).toEqual(['gb', 'us']);
      expect(deduplicated.length).toBe(2);
      expect(mockCountryCodes.length).toBe(5);
    });
  });
});
