/**
 * API Route Tests: GET/PATCH/DELETE /api/events/[eventId]
 *
 * Tests event retrieval, updating, and deletion.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import type { Feature, Point } from 'geojson';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/pinata');
vi.mock('@/utils/images');

describe('Event CRUD API Routes', () => {
  const testEventId = 'event-123';
  const testUserId = 'user-123';
  const _testOtherUserId = 'user-456';
  const testCID = 'QmTest123CID';

  const mockGeoJSONFeature: Feature<Point> = {
    type: 'Feature',
    geometry: {
      type: 'Point',
      coordinates: [-73.935242, 40.73061],
    },
    properties: {},
  };

  const mockImageBuffer = Buffer.from('fake image data');

  const mockEvent = {
    id: testEventId,
    name: 'Test Event',
    description: 'Test description',
    start: new Date('2025-06-01T10:00:00.000Z'),
    end: new Date('2025-06-01T18:00:00.000Z'),
    isAllDay: false,
    type: 'workshop',
    feature: mockGeoJSONFeature,
    associatedGroups: [],
    associatedUsers: [],
    url: 'https://example.com/event',
    image: null,
    creatorId: testUserId,
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
    updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    countryCode: 'US',
    location: 'New York, NY',
  };

  describe('GET /api/events/[eventId]', () => {
    let GET: (request: Request, context: any) => Promise<Response>;
    let mockDb: any;

    const mockParams = { eventId: testEventId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const dbModule = await import('@/db');

      // Mock database functions
      mockDb = {
        fetchEvent: vi.fn().mockResolvedValue(mockEvent),
      };

      (dbModule.fetchEvent as typeof mockDb.fetchEvent) = mockDb.fetchEvent;

      const routeModule = await import('@/app/api/events/[eventId]/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Successful Retrieval', () => {
      it('should return event when it exists', async () => {
        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.fetchEvent).toHaveBeenCalledWith(testEventId);
        expect(body).toEqual(mockEvent);
      });

      it('should not require authentication', async () => {
        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
      });
    });

    describe('Event Not Found', () => {
      it('should return 404 when event does not exist', async () => {
        mockDb.fetchEvent.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'Event not found' });
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.fetchEvent.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
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

  describe('PATCH /api/events/[eventId]', () => {
    let PATCH: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;
    let mockImages: any;

    const mockParams = { eventId: testEventId };

    const baseUpdateData = {
      name: 'Updated Event',
      description: 'Updated description',
      start: '2025-07-01T10:00:00.000Z',
      end: '2025-07-01T18:00:00.000Z',
      isAllDay: 'false',
      type: 'batizado',
      feature: JSON.stringify(mockGeoJSONFeature),
      associatedGroups: JSON.stringify([]),
      associatedUsers: JSON.stringify([]),
    };

    const mockUpdatedEvent = {
      ...mockEvent,
      name: 'Updated Event',
      description: 'Updated description',
    };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const pinataModule = await import('@/utils/pinata');
      const imagesModule = await import('@/utils/images');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        fetchEvent: vi.fn().mockResolvedValue(mockEvent),
        isEventCreator: vi.fn().mockResolvedValue(true),
        updateEvent: vi.fn().mockResolvedValue(mockUpdatedEvent),
      };

      (dbModule.fetchEvent as typeof mockDb.fetchEvent) = mockDb.fetchEvent;
      (dbModule.isEventCreator as typeof mockDb.isEventCreator) = mockDb.isEventCreator;
      (dbModule.updateEvent as typeof mockDb.updateEvent) = mockDb.updateEvent;

      // Mock Pinata
      mockPinata = {
        pinToGroup: vi.fn().mockResolvedValue({ cid: testCID, error: null }),
      };
      (pinataModule.pinToGroup as typeof mockPinata.pinToGroup) = mockPinata.pinToGroup;

      // Mock image processing
      mockImages = {
        createImageBuffer: vi.fn().mockResolvedValue(mockImageBuffer),
      };
      (imagesModule.createImageBuffer as typeof mockImages.createImageBuffer) = mockImages.createImageBuffer;

      // Default: authenticated as creator
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/events/[eventId]/route');
      PATCH = routeModule.PATCH;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('name', 'Updated Event');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const formData = new FormData();
        formData.append('name', 'Updated Event');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Event Existence', () => {
      it('should return 404 when event does not exist', async () => {
        mockDb.fetchEvent.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('name', 'Updated Event');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'Event not found' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user is not the creator', async () => {
        mockDb.isEventCreator.mockResolvedValue(false);

        const formData = new FormData();
        formData.append('name', 'Updated Event');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Only the event creator can update this event' });
        expect(mockDb.isEventCreator).toHaveBeenCalledWith(testEventId, testUserId);
      });

      it('should allow update when user is the creator', async () => {
        const formData = new FormData();
        Object.entries(baseUpdateData).forEach(([key, value]) => {
          formData.append(key, value);
        });

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.isEventCreator).toHaveBeenCalledWith(testEventId, testUserId);
      });
    });

    describe('Successful Update', () => {
      it('should update event without image', async () => {
        const formData = new FormData();
        Object.entries(baseUpdateData).forEach(([key, value]) => {
          formData.append(key, value);
        });

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateEvent).toHaveBeenCalledWith(
          testEventId,
          expect.objectContaining({
            name: 'Updated Event',
            description: 'Updated description',
            type: 'batizado',
          })
        );
        expect(body).toEqual(mockUpdatedEvent);
      });

      it('should update event with new image', async () => {
        const mockFile = new File(['test content'], 'test.jpg', { type: 'image/jpeg' });

        const formData = new FormData();
        Object.entries(baseUpdateData).forEach(([key, value]) => {
          formData.append(key, value);
        });
        formData.append('image', mockFile);

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockImages.createImageBuffer).toHaveBeenCalledWith(expect.any(File), 'eventImage');
        expect(mockPinata.pinToGroup).toHaveBeenCalledWith(mockImageBuffer, expect.stringContaining(testEventId));
        expect(mockDb.updateEvent).toHaveBeenCalledWith(
          testEventId,
          expect.objectContaining({
            image: testCID,
          })
        );
      });

      it('should handle partial updates', async () => {
        const formData = new FormData();
        formData.append('name', 'Only Name Updated');
        formData.append('feature', JSON.stringify(mockGeoJSONFeature)); // Required by validation
        formData.append('start', '2025-06-01T10:00:00.000Z'); // Required by validation test

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        const updateCall = mockDb.updateEvent.mock.calls[0][1];
        expect(updateCall.name).toBe('Only Name Updated');
      });
    });

    describe('Input Validation', () => {
      it('should return 400 when type is invalid', async () => {
        const formData = new FormData();
        formData.append('type', 'invalid-type');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error', 'Invalid event data');
      });

      it('should return 400 when end date is before start date', async () => {
        const formData = new FormData();
        formData.append('start', '2025-06-01T10:00:00.000Z');
        formData.append('end', '2025-05-31T09:00:00.000Z');

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error', 'Invalid event data');
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when image upload fails', async () => {
        mockPinata.pinToGroup.mockResolvedValue({ cid: null, error: 'Upload failed', errorStatus: 500 });

        const mockFile = new File(['test content'], 'test.jpg', { type: 'image/jpeg' });

        const formData = new FormData();
        Object.entries(baseUpdateData).forEach(([key, value]) => {
          formData.append(key, value);
        });
        formData.append('image', mockFile);

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Upload failed' });
        expect(mockDb.updateEvent).not.toHaveBeenCalled();
      });

      it('should return 500 when database throws error', async () => {
        mockDb.updateEvent.mockRejectedValue(new Error('Database error'));

        const formData = new FormData();
        formData.append('name', 'Updated Event');
        formData.append('feature', JSON.stringify(mockGeoJSONFeature)); // Required by validation
        formData.append('start', '2025-06-01T10:00:00.000Z'); // Required by validation test

        const request = new Request(`http://localhost/api/events/${testEventId}`, {
          method: 'PATCH',
          body: formData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });

  describe('DELETE /api/events/[eventId]', () => {
    let DELETE: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { eventId: testEventId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        fetchEvent: vi.fn().mockResolvedValue(mockEvent),
        isEventCreator: vi.fn().mockResolvedValue(true),
        deleteEvent: vi.fn().mockResolvedValue(undefined),
      };

      (dbModule.fetchEvent as typeof mockDb.fetchEvent) = mockDb.fetchEvent;
      (dbModule.isEventCreator as typeof mockDb.isEventCreator) = mockDb.isEventCreator;
      (dbModule.deleteEvent as typeof mockDb.deleteEvent) = mockDb.deleteEvent;

      // Default: authenticated as creator
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/events/[eventId]/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Event Existence', () => {
      it('should return 404 when event does not exist', async () => {
        mockDb.fetchEvent.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'Event not found' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user is not the creator', async () => {
        mockDb.isEventCreator.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Only the event creator can delete this event' });
        expect(mockDb.isEventCreator).toHaveBeenCalledWith(testEventId, testUserId);
      });
    });

    describe('Successful Deletion', () => {
      it('should delete event and return success', async () => {
        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.deleteEvent).toHaveBeenCalledWith(testEventId);
        expect(body).toEqual({ success: true });
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.deleteEvent.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/events/${testEventId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });
});
