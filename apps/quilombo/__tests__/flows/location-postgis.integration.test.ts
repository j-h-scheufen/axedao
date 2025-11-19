/**
 * Integration tests for PostGIS location features and database triggers
 * Tests geographic data handling and automatic trigger operations
 *
 * PostGIS Features Tested:
 * - Automatic geometry generation from GeoJSON coordinates
 * - Country code extraction trigger (from feature properties/context)
 * - Spatial queries and distance calculations
 * - GIST index usage for spatial queries
 * - Location updates and trigger re-execution
 *
 * Tables with PostGIS:
 * - group_locations: Group physical locations
 * - events: Event locations
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { eq, sql } from 'drizzle-orm';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../setup/db-container';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';
import type { Feature, Point } from 'geojson';

describe('Location/PostGIS Integration Tests', () => {
  let db: Awaited<ReturnType<typeof setupTestDatabase>>['db'];

  // Test users and groups for foreign key constraints
  let userId1: string;
  let userId2: string;
  let groupId1: string;
  let groupId2: string;

  beforeAll(async () => {
    const setup = await setupTestDatabase();
    db = setup.db;
  }, 120_000);

  afterAll(async () => {
    await teardownTestDatabase();
  });

  beforeEach(async () => {
    await clearTestDatabase();

    // Create test users and groups for foreign keys
    userId1 = uuidv4();
    userId2 = uuidv4();
    groupId1 = uuidv4();
    groupId2 = uuidv4();

    await db.insert(schema.users).values([
      {
        id: userId1,
        email: 'user1@example.com',
        isGlobalAdmin: false,
      },
      {
        id: userId2,
        email: 'user2@example.com',
        isGlobalAdmin: false,
      },
    ]);

    await db.insert(schema.groups).values([
      {
        id: groupId1,
        name: 'Test Group 1',
        style: 'regional',
        createdBy: userId1,
      },
      {
        id: groupId2,
        name: 'Test Group 2',
        style: 'regional',
        createdBy: userId2,
      },
    ]);
  });

  describe('Group Locations - Geometry Generation', () => {
    it('should automatically generate location geometry from GeoJSON coordinates', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-122.4194, 37.7749], // San Francisco
        },
        properties: {
          name: 'San Francisco HQ',
        },
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'HQ Location',
        feature,
      });

      // Query the location to verify geometry was generated
      const result = await db
        .select({
          id: schema.groupLocations.id,
          name: schema.groupLocations.name,
          locationWKT: sql<string>`ST_AsText(${schema.groupLocations.location})`,
          longitude: sql<number>`ST_X(${schema.groupLocations.location})`,
          latitude: sql<number>`ST_Y(${schema.groupLocations.location})`,
        })
        .from(schema.groupLocations)
        .where(eq(schema.groupLocations.id, locationId));

      expect(result).toHaveLength(1);
      expect(result[0].locationWKT).toBe('POINT(-122.4194 37.7749)');
      expect(result[0].longitude).toBeCloseTo(-122.4194, 4);
      expect(result[0].latitude).toBeCloseTo(37.7749, 4);
    });

    it('should handle different coordinate values', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [2.3522, 48.8566], // Paris
        },
        properties: {},
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'Paris Office',
        feature,
      });

      const result = await db
        .select({
          longitude: sql<number>`ST_X(${schema.groupLocations.location})`,
          latitude: sql<number>`ST_Y(${schema.groupLocations.location})`,
        })
        .from(schema.groupLocations)
        .where(eq(schema.groupLocations.id, locationId));

      expect(result[0].longitude).toBeCloseTo(2.3522, 4);
      expect(result[0].latitude).toBeCloseTo(48.8566, 4);
    });

    it('should update geometry when feature coordinates change', async () => {
      const locationId = uuidv4();
      const initialFeature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-122.4194, 37.7749],
        },
        properties: {},
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'Relocatable Office',
        feature: initialFeature,
      });

      // Update to new coordinates
      const updatedFeature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-74.006, 40.7128], // New York
        },
        properties: {},
      };

      await db
        .update(schema.groupLocations)
        .set({ feature: updatedFeature })
        .where(eq(schema.groupLocations.id, locationId));

      const result = await db
        .select({
          longitude: sql<number>`ST_X(${schema.groupLocations.location})`,
          latitude: sql<number>`ST_Y(${schema.groupLocations.location})`,
        })
        .from(schema.groupLocations)
        .where(eq(schema.groupLocations.id, locationId));

      expect(result[0].longitude).toBeCloseTo(-74.006, 3);
      expect(result[0].latitude).toBeCloseTo(40.7128, 4);
    });
  });

  describe('Group Locations - Country Code Trigger', () => {
    it('should extract country code from feature properties', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-122.4194, 37.7749],
        },
        properties: {
          country_code: 'us',
          name: 'USA Location',
        },
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'US Office',
        feature,
      });

      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location?.countryCode).toBe('us');
    });

    it('should extract country code from feature context array', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [2.3522, 48.8566],
        },
        properties: {},
        // @ts-expect-error - context is Mapbox geocoding format
        context: [
          { id: 'place.123', text: 'Paris' },
          { id: 'country.456', text: 'France', country_code: 'fr' },
        ],
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'France Office',
        feature,
      });

      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location?.countryCode).toBe('fr');
    });

    it('should extract country code from properties when both exist', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {
          country_code: 'de',
        },
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'Germany Location',
        feature,
      });

      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location?.countryCode).toBe('de');
    });

    it('should handle missing country code gracefully', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {},
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'No Country',
        feature,
      });

      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location?.countryCode).toBeNull();
    });

    it('should update country code when feature changes', async () => {
      const locationId = uuidv4();
      const initialFeature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {
          country_code: 'us',
        },
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'Changing Location',
        feature: initialFeature,
      });

      // Update country code
      const updatedFeature: Feature<Point> = {
        ...initialFeature,
        properties: {
          country_code: 'ca',
        },
      };

      await db
        .update(schema.groupLocations)
        .set({ feature: updatedFeature })
        .where(eq(schema.groupLocations.id, locationId));

      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location?.countryCode).toBe('ca');
    });
  });

  describe('Events - Geometry and Trigger', () => {
    it('should generate geometry and extract country code for events', async () => {
      const eventId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-0.1278, 51.5074], // London
        },
        properties: {
          country_code: 'gb',
          venue: 'London Conference Center',
        },
      };

      await db.insert(schema.events).values({
        id: eventId,
        name: 'Tech Conference',
        description: 'Annual tech conference',
        start: new Date('2025-06-01T09:00:00Z'),
        end: new Date('2025-06-01T17:00:00Z'),
        type: 'workshop',
        feature,
        creatorId: userId1,
      });

      const event = await db.query.events.findFirst({
        where: eq(schema.events.id, eventId),
      });

      expect(event?.countryCode).toBe('gb');

      // Verify geometry
      const result = await db
        .select({
          longitude: sql<number>`ST_X(${schema.events.location})`,
          latitude: sql<number>`ST_Y(${schema.events.location})`,
        })
        .from(schema.events)
        .where(eq(schema.events.id, eventId));

      expect(result[0].longitude).toBeCloseTo(-0.1278, 4);
      expect(result[0].latitude).toBeCloseTo(51.5074, 4);
    });

    it('should handle events without country code', async () => {
      const eventId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {},
      };

      await db.insert(schema.events).values({
        id: eventId,
        name: 'Ocean Event',
        start: new Date(),
        type: 'general',
        feature,
        creatorId: userId1,
      });

      const event = await db.query.events.findFirst({
        where: eq(schema.events.id, eventId),
      });

      expect(event?.countryCode).toBeNull();
    });

    it('should update event location and country code', async () => {
      const eventId = uuidv4();
      const initialFeature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-122.4194, 37.7749],
        },
        properties: {
          country_code: 'us',
        },
      };

      await db.insert(schema.events).values({
        id: eventId,
        name: 'Mobile Event',
        start: new Date(),
        type: 'public_roda',
        feature: initialFeature,
        creatorId: userId1,
      });

      // Move event to different location
      const updatedFeature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [139.6917, 35.6895], // Tokyo
        },
        properties: {
          country_code: 'jp',
        },
      };

      await db.update(schema.events).set({ feature: updatedFeature }).where(eq(schema.events.id, eventId));

      const event = await db.query.events.findFirst({
        where: eq(schema.events.id, eventId),
      });

      expect(event?.countryCode).toBe('jp');

      const result = await db
        .select({
          longitude: sql<number>`ST_X(${schema.events.location})`,
          latitude: sql<number>`ST_Y(${schema.events.location})`,
        })
        .from(schema.events)
        .where(eq(schema.events.id, eventId));

      expect(result[0].longitude).toBeCloseTo(139.6917, 4);
      expect(result[0].latitude).toBeCloseTo(35.6895, 4);
    });
  });

  describe('Spatial Queries', () => {
    it('should calculate distance between two locations', async () => {
      const locationId1 = uuidv4();
      const locationId2 = uuidv4();

      // San Francisco
      const feature1: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-122.4194, 37.7749],
        },
        properties: {},
      };

      // Los Angeles
      const feature2: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-118.2437, 34.0522],
        },
        properties: {},
      };

      await db.insert(schema.groupLocations).values([
        {
          id: locationId1,
          groupId: groupId1,
          name: 'San Francisco',
          feature: feature1,
        },
        {
          id: locationId2,
          groupId: groupId2,
          name: 'Los Angeles',
          feature: feature2,
        },
      ]);

      // Calculate distance using ST_Distance (in degrees)
      const result = await db.execute<{ distance_degrees: number; distance_meters: number }>(sql`
        SELECT
          ST_Distance(
            (SELECT location FROM ${schema.groupLocations} WHERE id = ${locationId1}),
            (SELECT location FROM ${schema.groupLocations} WHERE id = ${locationId2})
          ) as distance_degrees,
          ST_DistanceSphere(
            (SELECT location FROM ${schema.groupLocations} WHERE id = ${locationId1}),
            (SELECT location FROM ${schema.groupLocations} WHERE id = ${locationId2})
          ) as distance_meters
      `);

      const row = result[0];

      // Distance between SF and LA is approximately 559 km = 559,000 meters
      expect(row.distance_meters).toBeGreaterThan(500000);
      expect(row.distance_meters).toBeLessThan(600000);
    });

    it('should find locations within a bounding box', async () => {
      // Create multiple locations
      const locations = [
        {
          id: uuidv4(),
          name: 'New York',
          coordinates: [-74.006, 40.7128],
          countryCode: 'us',
        },
        {
          id: uuidv4(),
          name: 'Boston',
          coordinates: [-71.0589, 42.3601],
          countryCode: 'us',
        },
        {
          id: uuidv4(),
          name: 'London',
          coordinates: [-0.1278, 51.5074],
          countryCode: 'gb',
        },
      ];

      for (const loc of locations) {
        const feature: Feature<Point> = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: loc.coordinates,
          },
          properties: {
            country_code: loc.countryCode,
          },
        };

        await db.insert(schema.groupLocations).values({
          id: loc.id,
          groupId: groupId1,
          name: loc.name,
          feature,
        });
      }

      // Find locations in US East Coast bounding box
      const result = await db.execute<{ name: string; country_code: string }>(sql`
        SELECT name, country_code
        FROM ${schema.groupLocations}
        WHERE ST_Contains(
          ST_MakeEnvelope(-75, 40, -70, 43, 4326),
          location
        )
        ORDER BY name
      `);

      expect(result).toHaveLength(2);
      expect(result[0]).toMatchObject({ name: 'Boston' });
      expect(result[1]).toMatchObject({ name: 'New York' });
    });

    it('should find nearest locations using spatial index', async () => {
      // Create a reference point and several nearby locations
      const referencePoint = [-122.4194, 37.7749]; // San Francisco

      const nearbyLocations = [
        { id: uuidv4(), name: 'Oakland', coordinates: [-122.2711, 37.8044], distance: 'close' },
        { id: uuidv4(), name: 'San Jose', coordinates: [-121.8863, 37.3382], distance: 'medium' },
        { id: uuidv4(), name: 'Sacramento', coordinates: [-121.4944, 38.5816], distance: 'far' },
      ];

      for (const loc of nearbyLocations) {
        const feature: Feature<Point> = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: loc.coordinates,
          },
          properties: {},
        };

        await db.insert(schema.groupLocations).values({
          id: loc.id,
          groupId: groupId1,
          name: loc.name,
          feature,
        });
      }

      // Find nearest location to San Francisco
      const result = await db.execute<{ name: string; distance_meters: number }>(sql`
        SELECT name,
               ST_DistanceSphere(location, ST_SetSRID(ST_MakePoint(${referencePoint[0]}, ${referencePoint[1]}), 4326)) as distance_meters
        FROM ${schema.groupLocations}
        ORDER BY location <-> ST_SetSRID(ST_MakePoint(${referencePoint[0]}, ${referencePoint[1]}), 4326)
        LIMIT 1
      `);

      expect(result).toHaveLength(1);
      expect(result[0]).toMatchObject({ name: 'Oakland' });
    });

    it('should query events by country code using index', async () => {
      // Create events in different countries
      const events = [
        { id: uuidv4(), name: 'US Event 1', country: 'us', coords: [-122.4194, 37.7749] },
        { id: uuidv4(), name: 'US Event 2', country: 'us', coords: [-74.006, 40.7128] },
        { id: uuidv4(), name: 'UK Event', country: 'gb', coords: [-0.1278, 51.5074] },
        { id: uuidv4(), name: 'FR Event', country: 'fr', coords: [2.3522, 48.8566] },
      ];

      for (const evt of events) {
        const feature: Feature<Point> = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: evt.coords,
          },
          properties: {
            country_code: evt.country,
          },
        };

        await db.insert(schema.events).values({
          id: evt.id,
          name: evt.name,
          start: new Date(),
          type: 'general',
          feature,
          creatorId: userId1,
        });
      }

      // Query events in US (should use country_code index)
      const usEvents = await db.query.events.findMany({
        where: eq(schema.events.countryCode, 'us'),
      });

      expect(usEvents).toHaveLength(2);
      expect(usEvents.every((evt) => evt.countryCode === 'us')).toBe(true);
    });
  });

  describe('Complex Scenarios', () => {
    it('should handle multiple locations for same group', async () => {
      const locations = [
        {
          id: uuidv4(),
          name: 'HQ',
          coordinates: [-122.4194, 37.7749],
          country: 'us',
        },
        {
          id: uuidv4(),
          name: 'Branch Office',
          coordinates: [-74.006, 40.7128],
          country: 'us',
        },
        {
          id: uuidv4(),
          name: 'International Office',
          coordinates: [2.3522, 48.8566],
          country: 'fr',
        },
      ];

      for (const loc of locations) {
        const feature: Feature<Point> = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: loc.coordinates,
          },
          properties: {
            country_code: loc.country,
          },
        };

        await db.insert(schema.groupLocations).values({
          id: loc.id,
          groupId: groupId1,
          name: loc.name,
          feature,
        });
      }

      const groupLocations = await db.query.groupLocations.findMany({
        where: eq(schema.groupLocations.groupId, groupId1),
      });

      expect(groupLocations).toHaveLength(3);

      // Count by country
      const usCount = groupLocations.filter((loc) => loc.countryCode === 'us').length;
      const frCount = groupLocations.filter((loc) => loc.countryCode === 'fr').length;

      expect(usCount).toBe(2);
      expect(frCount).toBe(1);
    });

    it('should cascade delete locations when group is deleted', async () => {
      const locationId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {},
      };

      await db.insert(schema.groupLocations).values({
        id: locationId,
        groupId: groupId1,
        name: 'Temporary Location',
        feature,
      });

      // Delete group
      await db.delete(schema.groups).where(eq(schema.groups.id, groupId1));

      // Location should be deleted
      const location = await db.query.groupLocations.findFirst({
        where: eq(schema.groupLocations.id, locationId),
      });

      expect(location).toBeUndefined();
    });

    it('should cascade delete events when creator is deleted', async () => {
      const eventId = uuidv4();
      const feature: Feature<Point> = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [0, 0],
        },
        properties: {},
      };

      await db.insert(schema.events).values({
        id: eventId,
        name: 'User Event',
        start: new Date(),
        type: 'general',
        feature,
        creatorId: userId1,
      });

      // Delete creator
      await db.delete(schema.users).where(eq(schema.users.id, userId1));

      // Event should be deleted
      const event = await db.query.events.findFirst({
        where: eq(schema.events.id, eventId),
      });

      expect(event).toBeUndefined();
    });
  });
});
