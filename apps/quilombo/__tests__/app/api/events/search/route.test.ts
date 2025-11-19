/**
 * API Route Tests: POST /api/events/search
 *
 * Tests event search with filters and pagination.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import type { Feature, Point } from 'geojson';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/events/search', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';

  const mockGeoJSONFeature: Feature<Point> = {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-73.935242, 40.73061],
    },
    properties: {},
  };

  const mockEvents = [
    {
      id: 'event-1',
      name: 'Batizado 2025',
      description: 'Annual batizado ceremony',
      start: new Date('2025-06-01T10:00:00.000Z'),
      end: new Date('2025-06-01T18:00:00.000Z'),
      isAllDay: false,
      type: 'batizado',
      feature: mockGeoJSONFeature,
      associatedGroups: [],
      associatedUsers: [],
      url: null,
      image: null,
      creatorId: testUserId,
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
      countryCode: 'BR',
      location: 'São Paulo, Brazil',
    },
    {
      id: 'event-2',
      name: 'Workshop NYC',
      description: 'Weekend workshop',
      start: new Date('2025-07-15T10:00:00.000Z'),
      end: new Date('2025-07-16T18:00:00.000Z'),
      isAllDay: false,
      type: 'workshop',
      feature: mockGeoJSONFeature,
      associatedGroups: [],
      associatedUsers: [],
      url: null,
      image: null,
      creatorId: testUserId,
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
      countryCode: 'US',
      location: 'New York, NY',
    },
  ];

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');

    getServerSession = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

    // Mock database functions
    mockDb = {
      searchEvents: vi.fn().mockResolvedValue({
        rows: mockEvents,
        totalCount: 2,
      }),
    };

    (dbModule.searchEvents as typeof mockDb.searchEvents) = mockDb.searchEvents;

    // Default: authenticated user
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/events/search/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Basic Search', () => {
    it('should search events without filters', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.searchEvents).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 25,
        searchTerm: undefined,
        countryCodes: undefined,
        eventTypes: undefined,
        startDate: undefined,
        endDate: undefined,
      });
      expect(body.totalCount).toBe(2);
      expect(body.nextOffset).toBe(2); // Returns totalCount when all results fit in one page
      expect(body.data).toHaveLength(2);
      expect(body.data[0]).toEqual(
        expect.objectContaining({
          id: 'event-1',
          name: 'Batizado 2025',
        })
      );
    });

    it('should search with search term', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { searchTerm: 'Batizado' },
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          searchTerm: 'Batizado',
        })
      );
    });

    it('should return empty results when no events found', async () => {
      mockDb.searchEvents.mockResolvedValue({
        rows: [],
        totalCount: 0,
      });

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { searchTerm: 'NonExistent' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.data).toEqual([]);
      expect(body.totalCount).toBe(0);
      expect(body.nextOffset).toBeNull();
    });
  });

  describe('Pagination', () => {
    it('should use default pagination values', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {},
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          offset: 0,
          pageSize: 25,
        })
      );
    });

    it('should accept custom offset and pageSize', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { offset: 10, pageSize: 50 },
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          offset: 10,
          pageSize: 50,
        })
      );
    });

    it('should calculate nextOffset when more results available', async () => {
      mockDb.searchEvents.mockResolvedValue({
        rows: mockEvents,
        totalCount: 50,
      });

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { offset: 0, pageSize: 25 },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBe(25);
    });

    it('should return totalCount as nextOffset when all results fit in one page', async () => {
      mockDb.searchEvents.mockResolvedValue({
        rows: mockEvents,
        totalCount: 2,
      });

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { offset: 0, pageSize: 25 },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBe(2); // Returns totalCount when all results fit in one page
    });

    it('should handle last page with partial results', async () => {
      mockDb.searchEvents.mockResolvedValue({
        rows: mockEvents,
        totalCount: 42,
      });

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { offset: 40, pageSize: 20 },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBe(42);
    });
  });

  describe('Filters', () => {
    it('should filter by country codes', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          filters: {
            countryCodes: ['BR', 'PT'],
          },
        },
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          countryCodes: ['BR', 'PT'],
        })
      );
    });

    it('should filter by event types', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          filters: {
            eventTypes: ['batizado', 'workshop'],
          },
        },
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          eventTypes: ['batizado', 'workshop'],
        })
      );
    });

    it('should filter by date range', async () => {
      const startDate = '2025-06-01T00:00:00.000Z';
      const endDate = '2025-12-31T23:59:59.999Z';

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          filters: {
            startDate,
            endDate,
          },
        },
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          startDate: new Date(startDate),
          endDate: new Date(endDate),
        })
      );
    });

    it('should combine multiple filters', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          searchTerm: 'Batizado',
          filters: {
            countryCodes: ['BR'],
            eventTypes: ['batizado'],
            startDate: '2025-06-01T00:00:00.000Z',
          },
        },
      });

      await POST(request);

      expect(mockDb.searchEvents).toHaveBeenCalledWith(
        expect.objectContaining({
          searchTerm: 'Batizado',
          countryCodes: ['BR'],
          eventTypes: ['batizado'],
          startDate: new Date('2025-06-01T00:00:00.000Z'),
        })
      );
    });

    it('should filter out undefined values from arrays', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          filters: {
            eventTypes: ['batizado', undefined, 'workshop'],
            countryCodes: ['BR', 'US'],
          },
        },
      });

      await POST(request);

      const call = mockDb.searchEvents.mock.calls[0][0];
      expect(call.eventTypes).toEqual(['batizado', 'workshop']);
      expect(call.countryCodes).toEqual(['BR', 'US']);
    });

    it('should pass undefined when filter arrays are empty', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {
          filters: {
            eventTypes: [],
            countryCodes: [],
          },
        },
      });

      await POST(request);

      const call = mockDb.searchEvents.mock.calls[0][0];
      expect(call.eventTypes).toBeUndefined();
      expect(call.countryCodes).toBeUndefined();
    });
  });

  describe('Input Validation', () => {
    it('should return 400 for invalid request body', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { offset: 'invalid' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should return validation error message', async () => {
      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: { pageSize: 'invalid' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(typeof body.error).toBe('string');
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.searchEvents.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/events/search', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Failed to search events' });
    });
  });
});
