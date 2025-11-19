/**
 * API Route Tests: GET /api/locations
 *
 * Tests retrieving group locations as GeoJSON FeatureCollection.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');

describe('GET /api/locations', () => {
  let GET: (request: Request) => Promise<Response>;
  let mockDb: any;

  const mockLocationWithGroup = {
    id: 'location-1',
    name: 'Test Location',
    description: 'A test location',
    countryCode: 'US',
    feature: {
      type: 'Feature' as const,
      geometry: {
        type: 'Point' as const,
        coordinates: [-73.935242, 40.73061],
      },
      properties: {},
    },
    group: {
      id: 'group-1',
      name: 'Test Group',
      description: 'A test group',
      logo: 'https://example.com/logo.png',
      style: 'angola',
    },
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const dbModule = await import('@/db');

    // Mock database functions
    mockDb = {
      fetchAllGroupLocationsWithGroups: vi.fn().mockResolvedValue([mockLocationWithGroup]),
    };

    (dbModule.fetchAllGroupLocationsWithGroups as typeof mockDb.fetchAllGroupLocationsWithGroups) =
      mockDb.fetchAllGroupLocationsWithGroups;

    const routeModule = await import('@/app/api/locations/route');
    GET = routeModule.GET;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Successful Retrieval', () => {
    it('should return GeoJSON FeatureCollection with locations', async () => {
      const request = new Request('http://localhost/api/locations', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.fetchAllGroupLocationsWithGroups).toHaveBeenCalled();
      expect(body.type).toBe('FeatureCollection');
      expect(body.features).toHaveLength(1);
      expect(body.features[0]).toEqual({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [-73.935242, 40.73061],
        },
        properties: {
          locationId: 'location-1',
          locationName: 'Test Location',
          locationDescription: 'A test location',
          countryCode: 'US',
          groupId: 'group-1',
          groupName: 'Test Group',
          groupDescription: 'A test group',
          groupLogo: 'https://example.com/logo.png',
          groupStyle: 'angola',
        },
      });
    });

    it('should return empty FeatureCollection when no locations', async () => {
      mockDb.fetchAllGroupLocationsWithGroups.mockResolvedValue([]);

      const request = new Request('http://localhost/api/locations', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        type: 'FeatureCollection',
        features: [],
      });
    });

    it('should handle multiple locations', async () => {
      const locations = [
        mockLocationWithGroup,
        {
          ...mockLocationWithGroup,
          id: 'location-2',
          name: 'Second Location',
        },
      ];
      mockDb.fetchAllGroupLocationsWithGroups.mockResolvedValue(locations);

      const request = new Request('http://localhost/api/locations', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.features).toHaveLength(2);
    });

    it('should omit undefined optional properties', async () => {
      mockDb.fetchAllGroupLocationsWithGroups.mockResolvedValue([
        {
          ...mockLocationWithGroup,
          description: null,
          countryCode: null,
          group: {
            ...mockLocationWithGroup.group,
            description: null,
            logo: null,
            style: null,
          },
        },
      ]);

      const request = new Request('http://localhost/api/locations', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.features[0].properties).toEqual({
        locationId: 'location-1',
        locationName: 'Test Location',
        groupId: 'group-1',
        groupName: 'Test Group',
      });
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.fetchAllGroupLocationsWithGroups.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/locations', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Database connection failed');
      expect(body.details).toBe('Database error');
    });
  });
});
