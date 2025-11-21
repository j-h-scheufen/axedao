/**
 * Integration tests for search pagination and totalCount correctness across all entity types
 *
 * CRITICAL: Validates that totalCount works correctly for users and events search
 * These entities don't use GROUP BY, but we test to prevent future regressions
 *
 * Run with: pnpm test:integration
 */

import { describe, it, expect, beforeAll, afterAll, beforeEach } from 'vitest';
import { setupTestDatabase, teardownTestDatabase, clearTestDatabase } from '../../setup/db-container';
import { searchUsers } from '@/db/queries/users';
import { searchEvents } from '@/db/queries/events';
import * as schema from '@/db/schema';
import { v4 as uuidv4 } from 'uuid';
import type { Feature, Point } from 'geojson';

// Default GeoJSON feature for test events
const defaultEventFeature: Feature<Point> = {
  type: 'Feature',
  geometry: {
    type: 'Point',
    coordinates: [-122.4, 37.8], // San Francisco
  },
  properties: {},
};

describe('Search Pagination - Users and Events (Integration)', () => {
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
      email: 'creator@example.com',
      name: 'Creator User',
      isGlobalAdmin: false,
    });
  });

  describe('searchUsers - TotalCount Correctness', () => {
    it('should return correct totalCount across multiple pages', async () => {
      // Create 75 users
      const users = Array.from({ length: 75 }, (_, i) => ({
        id: uuidv4(),
        email: `user${i}@example.com`,
        name: `User ${i + 1}`,
        isGlobalAdmin: false,
      }));
      await db.insert(schema.users).values(users);

      const page1 = await searchUsers({ pageSize: 25, offset: 0 });
      const page2 = await searchUsers({ pageSize: 25, offset: 25 });
      const page3 = await searchUsers({ pageSize: 25, offset: 50 });

      // All pages should report the same total count (75 + 1 creator)
      expect(page1.totalCount).toBe(76);
      expect(page2.totalCount).toBe(76);
      expect(page3.totalCount).toBe(76);

      expect(page1.rows).toHaveLength(25);
      expect(page2.rows).toHaveLength(25);
      expect(page3.rows).toHaveLength(25);
    });

    it('should return correct totalCount with different page sizes', async () => {
      // Create 100 users
      const users = Array.from({ length: 100 }, (_, i) => ({
        id: uuidv4(),
        email: `user${i}@example.com`,
        name: `User ${i + 1}`,
        isGlobalAdmin: false,
      }));
      await db.insert(schema.users).values(users);

      const result10 = await searchUsers({ pageSize: 10, offset: 0 });
      const result50 = await searchUsers({ pageSize: 50, offset: 0 });

      // Total count should be 101 regardless of page size (100 + 1 creator)
      expect(result10.totalCount).toBe(101);
      expect(result50.totalCount).toBe(101);

      expect(result10.rows).toHaveLength(10);
      expect(result50.rows).toHaveLength(50);
    });

    it('should return correct totalCount with filters', async () => {
      // Create users with and without wallets
      const usersWithWallet = Array.from({ length: 30 }, (_, i) => ({
        id: uuidv4(),
        email: `wallet${i}@example.com`,
        name: `Wallet User ${i + 1}`,
        walletAddress: `0x${i.toString().padStart(40, '0')}`,
        isGlobalAdmin: false,
      }));

      const usersWithoutWallet = Array.from({ length: 20 }, (_, i) => ({
        id: uuidv4(),
        email: `nowallet${i}@example.com`,
        name: `No Wallet User ${i + 1}`,
        isGlobalAdmin: false,
      }));

      await db.insert(schema.users).values([...usersWithWallet, ...usersWithoutWallet]);

      const resultWithWallet = await searchUsers({
        pageSize: 100,
        offset: 0,
        filters: { hasWallet: true },
      });

      expect(resultWithWallet.totalCount).toBe(30);
      expect(resultWithWallet.rows).toHaveLength(30);
    });

    it('should return correct totalCount with search term', async () => {
      await db.insert(schema.users).values([
        { id: uuidv4(), email: 'alice@example.com', name: 'Alice Smith', isGlobalAdmin: false },
        { id: uuidv4(), email: 'bob@example.com', name: 'Bob Smith', isGlobalAdmin: false },
        { id: uuidv4(), email: 'charlie@example.com', name: 'Charlie Brown', isGlobalAdmin: false },
      ]);

      const result = await searchUsers({
        pageSize: 100,
        offset: 0,
        searchTerm: 'Smith',
      });

      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });
  });

  describe('searchEvents - TotalCount Correctness', () => {
    it('should return correct totalCount across multiple pages', async () => {
      // Create 60 events
      const events = Array.from({ length: 60 }, (_, i) => ({
        id: uuidv4(),
        name: `Event ${i + 1}`,
        description: `Description for event ${i + 1}`,
        start: new Date(Date.now() + i * 86400000), // Future events
        creatorId: userId,
        type: 'batizado' as const,
        countryCode: 'US',
        feature: defaultEventFeature,
      }));
      await db.insert(schema.events).values(events);

      const page1 = await searchEvents({ pageSize: 20, offset: 0, pastEvents: true });
      const page2 = await searchEvents({ pageSize: 20, offset: 20, pastEvents: true });
      const page3 = await searchEvents({ pageSize: 20, offset: 40, pastEvents: true });

      // All pages should report the same total count
      expect(page1.totalCount).toBe(60);
      expect(page2.totalCount).toBe(60);
      expect(page3.totalCount).toBe(60);

      expect(page1.rows).toHaveLength(20);
      expect(page2.rows).toHaveLength(20);
      expect(page3.rows).toHaveLength(20);
    });

    it('should return correct totalCount with different page sizes', async () => {
      // Create 50 events
      const events = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Event ${i + 1}`,
        start: new Date(Date.now() + i * 86400000),
        creatorId: userId,
        type: 'workshop' as const,
        countryCode: 'BR',
        feature: defaultEventFeature,
      }));
      await db.insert(schema.events).values(events);

      const result10 = await searchEvents({ pageSize: 10, offset: 0, pastEvents: true });
      const result25 = await searchEvents({ pageSize: 25, offset: 0, pastEvents: true });

      expect(result10.totalCount).toBe(50);
      expect(result25.totalCount).toBe(50);

      expect(result10.rows).toHaveLength(10);
      expect(result25.rows).toHaveLength(25);
    });

    it('should return correct totalCount with event type filter', async () => {
      await db.insert(schema.events).values([
        {
          id: uuidv4(),
          name: 'Batizado 1',
          start: new Date(Date.now() + 86400000),
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
        {
          id: uuidv4(),
          name: 'Batizado 2',
          start: new Date(Date.now() + 172800000),
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
        {
          id: uuidv4(),
          name: 'Workshop 1',
          start: new Date(Date.now() + 259200000),
          creatorId: userId,
          type: 'workshop',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
      ]);

      const result = await searchEvents({
        pageSize: 100,
        offset: 0,
        eventTypes: ['batizado'],
      });

      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });

    it('should return correct totalCount with country filter', async () => {
      await db.insert(schema.events).values([
        {
          id: uuidv4(),
          name: 'Brazil Event 1',
          start: new Date(Date.now() + 86400000),
          creatorId: userId,
          type: 'batizado',
          feature: { ...defaultEventFeature, properties: { country_code: 'BR' } },
        },
        {
          id: uuidv4(),
          name: 'Brazil Event 2',
          start: new Date(Date.now() + 172800000),
          creatorId: userId,
          type: 'batizado',
          feature: { ...defaultEventFeature, properties: { country_code: 'BR' } },
        },
        {
          id: uuidv4(),
          name: 'US Event',
          start: new Date(Date.now() + 259200000),
          creatorId: userId,
          type: 'workshop',
          feature: { ...defaultEventFeature, properties: { country_code: 'US' } },
        },
      ]);

      const result = await searchEvents({
        pageSize: 100,
        offset: 0,
        countryCode: 'BR', // Search query normalizes to lowercase
      });

      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });

    it('should return correct totalCount excluding past events by default', async () => {
      const now = new Date();
      const pastDate = new Date(now.getTime() - 86400000); // Yesterday
      const futureDate = new Date(now.getTime() + 86400000); // Tomorrow

      await db.insert(schema.events).values([
        {
          id: uuidv4(),
          name: 'Past Event',
          start: pastDate,
          end: pastDate,
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
        {
          id: uuidv4(),
          name: 'Future Event 1',
          start: futureDate,
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
        {
          id: uuidv4(),
          name: 'Future Event 2',
          start: futureDate,
          creatorId: userId,
          type: 'workshop',
          countryCode: 'US',
          feature: defaultEventFeature,
        },
      ]);

      const result = await searchEvents({
        pageSize: 100,
        offset: 0,
        pastEvents: false, // Default behavior
      });

      // Should only count future events
      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });

    it('should return correct totalCount including past events when requested', async () => {
      const now = new Date();
      const pastDate = new Date(now.getTime() - 86400000);
      const futureDate = new Date(now.getTime() + 86400000);

      await db.insert(schema.events).values([
        {
          id: uuidv4(),
          name: 'Past Event',
          start: pastDate,
          end: pastDate,
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
        {
          id: uuidv4(),
          name: 'Future Event',
          start: futureDate,
          creatorId: userId,
          type: 'batizado',
          countryCode: 'BR',
          feature: defaultEventFeature,
        },
      ]);

      const result = await searchEvents({
        pageSize: 100,
        offset: 0,
        pastEvents: true,
      });

      // Should count all events
      expect(result.totalCount).toBe(2);
      expect(result.rows).toHaveLength(2);
    });
  });

  describe('Cross-Entity Pagination Consistency', () => {
    it('should maintain consistent pagination behavior across users and events', async () => {
      // Create identical dataset sizes for both
      const users = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        email: `user${i}@example.com`,
        name: `User ${i + 1}`,
        isGlobalAdmin: false,
      }));

      const events = Array.from({ length: 50 }, (_, i) => ({
        id: uuidv4(),
        name: `Event ${i + 1}`,
        start: new Date(Date.now() + i * 86400000),
        creatorId: userId,
        type: 'batizado' as const,
        countryCode: 'BR',
        feature: defaultEventFeature,
      }));

      await db.insert(schema.users).values(users);
      await db.insert(schema.events).values(events);

      const userPage1 = await searchUsers({ pageSize: 25, offset: 0 });
      const userPage2 = await searchUsers({ pageSize: 25, offset: 25 });

      const eventPage1 = await searchEvents({ pageSize: 25, offset: 0, pastEvents: true });
      const eventPage2 = await searchEvents({ pageSize: 25, offset: 25, pastEvents: true });

      // Both should have consistent pagination behavior
      expect(userPage1.rows).toHaveLength(25);
      expect(userPage2.rows).toHaveLength(25);
      expect(userPage1.totalCount).toBe(51); // 50 + 1 creator

      expect(eventPage1.rows).toHaveLength(25);
      expect(eventPage2.rows).toHaveLength(25);
      expect(eventPage1.totalCount).toBe(50);
    });
  });
});
