/**
 * API Route Tests: Location management for groups
 *   - GET/POST /api/groups/[groupId]/locations
 *   - PATCH/DELETE /api/groups/[groupId]/locations/[locationId]
 *
 * Tests group location management with GeoJSON data.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';
import type { Feature, Point } from 'geojson';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');

describe('Group Locations API Routes', () => {
  const testGroupId = 'group-123';
  const testUserId = 'user-123';
  const testLocationId = 'location-456';

  // Mock GeoJSON Point feature
  const mockGeoJSONFeature: Feature<Point> = {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-73.935242, 40.73061], // NYC coordinates
    },
    properties: {},
  };

  const mockLocation = {
    id: testLocationId,
    groupId: testGroupId,
    name: 'Test Location',
    description: 'A test location',
    feature: mockGeoJSONFeature,
    createdAt: new Date('2025-01-01'),
  };

  describe('GET /api/groups/[groupId]/locations', () => {
    let GET: (request: Request, context: any) => Promise<Response>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId };
    const mockLocations = [mockLocation];

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const dbModule = await import('@/db');

      // Mock database functions
      mockDb = {
        fetchGroupLocations: vi.fn().mockResolvedValue(mockLocations),
      };

      (dbModule.fetchGroupLocations as typeof mockDb.fetchGroupLocations) = mockDb.fetchGroupLocations;

      const routeModule = await import('@/app/api/groups/[groupId]/locations/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Successful Retrieval', () => {
      it('should return locations array', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual(
          expect.arrayContaining([
            expect.objectContaining({
              id: testLocationId,
              name: 'Test Location',
            }),
          ])
        );
        expect(mockDb.fetchGroupLocations).toHaveBeenCalledWith(testGroupId);
      });

      it('should not require authentication', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
      });

      it('should return empty array when group has no locations', async () => {
        mockDb.fetchGroupLocations.mockResolvedValue([]);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual([]);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.fetchGroupLocations.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });

  describe('POST /api/groups/[groupId]/locations', () => {
    let POST: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId };
    const validLocationData = {
      name: 'New Location',
      description: 'A new test location',
      feature: mockGeoJSONFeature,
    };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        insertGroupLocation: vi.fn().mockResolvedValue(mockLocation),
        fetchGroupLocations: vi.fn().mockResolvedValue([mockLocation]),
      };

      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.insertGroupLocation as typeof mockDb.insertGroupLocation) = mockDb.insertGroupLocation;
      (dbModule.fetchGroupLocations as typeof mockDb.fetchGroupLocations) = mockDb.fetchGroupLocations;

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/locations/route');
      POST = routeModule.POST;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: validLocationData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: validLocationData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: true,
          message: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can add locations',
        });
        expect(mockDb.canUserManageGroup).toHaveBeenCalledWith(testGroupId, testUserId);
      });
    });

    describe('Input Validation', () => {
      it('should return 500 when name is missing (validation error caught by try-catch)', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: { feature: mockGeoJSONFeature },
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });

      it('should return 500 when feature is missing (validation error caught by try-catch)', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: { name: 'New Location' },
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });

      it('should accept location without description', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: {
            name: 'New Location',
            feature: mockGeoJSONFeature,
          },
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
      });
    });

    describe('Successful Location Creation', () => {
      it('should create location and return updated locations list', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: validLocationData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.insertGroupLocation).toHaveBeenCalledWith({
          name: 'New Location',
          description: 'A new test location',
          feature: mockGeoJSONFeature,
          groupId: testGroupId,
        });
        expect(body).toEqual(
          expect.arrayContaining([
            expect.objectContaining({
              id: testLocationId,
              name: 'Test Location',
            }),
          ])
        );
      });

      it('should handle GeoJSON Point feature', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: validLocationData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        const callArgs = mockDb.insertGroupLocation.mock.calls[0][0];
        expect(callArgs.feature.geometry.type).toBe('Point');
        expect(callArgs.feature.geometry.coordinates).toEqual([-73.935242, 40.73061]);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.insertGroupLocation.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations`, {
          method: 'POST',
          body: validLocationData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });
    });
  });

  describe('PATCH /api/groups/[groupId]/locations/[locationId]', () => {
    let PATCH: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId, locationId: testLocationId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        isLocationInGroup: vi.fn().mockResolvedValue(true),
        updateGroupLocation: vi.fn().mockResolvedValue(mockLocation),
        fetchGroupLocations: vi.fn().mockResolvedValue([mockLocation]),
      };

      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.isLocationInGroup as typeof mockDb.isLocationInGroup) = mockDb.isLocationInGroup;
      (dbModule.updateGroupLocation as typeof mockDb.updateGroupLocation) = mockDb.updateGroupLocation;
      (dbModule.fetchGroupLocations as typeof mockDb.fetchGroupLocations) = mockDb.fetchGroupLocations;

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/locations/[locationId]/route');
      PATCH = routeModule.PATCH;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: true,
          message: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update locations',
        });
      });

      it('should return 404 when location not in group', async () => {
        mockDb.isLocationInGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({
          error: true,
          message: 'Location not found in the specified group',
        });
        expect(mockDb.isLocationInGroup).toHaveBeenCalledWith(testLocationId, testGroupId);
      });
    });

    describe('Successful Location Update', () => {
      it('should update location and return locations list', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Location Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateGroupLocation).toHaveBeenCalledWith(testLocationId, {
          name: 'Updated Location Name',
        });
        expect(body).toEqual(
          expect.arrayContaining([
            expect.objectContaining({
              id: testLocationId,
              name: 'Test Location',
            }),
          ])
        );
      });

      it('should allow partial updates', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { description: 'Updated description only' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.updateGroupLocation).toHaveBeenCalledWith(testLocationId, {
          description: 'Updated description only',
        });
      });

      it('should return 404 when update returns null', async () => {
        mockDb.updateGroupLocation.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: true, message: 'Location not found' });
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.updateGroupLocation.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });
    });
  });

  describe('DELETE /api/groups/[groupId]/locations/[locationId]', () => {
    let DELETE: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId, locationId: testLocationId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        isLocationInGroup: vi.fn().mockResolvedValue(true),
        deleteGroupLocation: vi.fn().mockResolvedValue(undefined),
        fetchGroupLocations: vi.fn().mockResolvedValue([]),
      };

      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.isLocationInGroup as typeof mockDb.isLocationInGroup) = mockDb.isLocationInGroup;
      (dbModule.deleteGroupLocation as typeof mockDb.deleteGroupLocation) = mockDb.deleteGroupLocation;
      (dbModule.fetchGroupLocations as typeof mockDb.fetchGroupLocations) = mockDb.fetchGroupLocations;

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/locations/[locationId]/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: true,
          message: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can delete locations',
        });
      });

      it('should return 404 when location not in group', async () => {
        mockDb.isLocationInGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({
          error: true,
          message: 'Location not found in the specified group',
        });
      });
    });

    describe('Successful Location Deletion', () => {
      it('should delete location and return updated locations list', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.deleteGroupLocation).toHaveBeenCalledWith(testLocationId);
        expect(body).toEqual([]);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.deleteGroupLocation.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/locations/${testLocationId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });
    });
  });
});
