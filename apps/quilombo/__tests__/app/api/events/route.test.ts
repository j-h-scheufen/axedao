/**
 * API Route Tests: POST /api/events
 *
 * Tests event creation with image upload.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import type { Feature, Point } from 'geojson';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/pinata');
vi.mock('@/utils/images');
vi.mock('uuid', () => ({
  v4: vi.fn(() => 'test-event-id-123'),
}));

describe('POST /api/events', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;
  let mockPinata: any;
  let mockImages: any;

  const testUserId = 'user-123';
  const testEventId = 'test-event-id-123';
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
  const mockFile = new File(['test content'], 'test.jpg', { type: 'image/jpeg' });

  const testGroupId1 = '550e8400-e29b-41d4-a716-446655440001';
  const testGroupId2 = '550e8400-e29b-41d4-a716-446655440002';
  const testUserId1 = '550e8400-e29b-41d4-a716-446655440011';
  const testUserId2 = '550e8400-e29b-41d4-a716-446655440012';

  const baseEventData = {
    name: 'Test Event',
    description: 'Test description',
    start: '2025-06-01T10:00:00.000Z',
    end: '2025-06-01T18:00:00.000Z',
    isAllDay: 'false',
    type: 'workshop',
    feature: JSON.stringify(mockGeoJSONFeature),
    associatedGroups: JSON.stringify([testGroupId1, testGroupId2]),
    associatedUsers: JSON.stringify([testUserId1, testUserId2]),
    url: 'https://example.com/event',
  };

  const mockCreatedEvent = {
    id: testEventId,
    name: 'Test Event',
    description: 'Test description',
    start: new Date('2025-06-01T10:00:00.000Z'),
    end: new Date('2025-06-01T18:00:00.000Z'),
    isAllDay: false,
    type: 'workshop',
    feature: mockGeoJSONFeature,
    associatedGroups: [testGroupId1, testGroupId2],
    associatedUsers: [testUserId1, testUserId2],
    url: 'https://example.com/event',
    image: testCID,
    creatorId: testUserId,
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
    updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    countryCode: 'US',
    location: 'New York, NY',
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
      fetchUser: vi.fn().mockResolvedValue({ id: testUserId, email: 'user@example.com' }),
      insertEvent: vi.fn().mockResolvedValue(mockCreatedEvent),
    };

    (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;
    (dbModule.insertEvent as typeof mockDb.insertEvent) = mockDb.insertEvent;

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

    // Default: authenticated user
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/events/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const formData = new FormData();
      formData.append('name', baseEventData.name);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
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
      formData.append('name', baseEventData.name);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });
  });

  describe('User Validation', () => {
    it('should return 500 when user not found in database', async () => {
      mockDb.fetchUser.mockResolvedValue(null);

      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when name is missing', async () => {
      const formData = new FormData();
      formData.append('start', baseEventData.start);
      formData.append('isAllDay', baseEventData.isAllDay);
      formData.append('type', baseEventData.type);
      formData.append('feature', baseEventData.feature);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when start date is missing', async () => {
      const formData = new FormData();
      formData.append('name', baseEventData.name);
      formData.append('isAllDay', baseEventData.isAllDay);
      formData.append('type', baseEventData.type);
      formData.append('feature', baseEventData.feature);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when isAllDay is missing', async () => {
      const formData = new FormData();
      formData.append('name', baseEventData.name);
      formData.append('start', baseEventData.start);
      formData.append('type', baseEventData.type);
      formData.append('feature', baseEventData.feature);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when feature (location) is missing', async () => {
      const formData = new FormData();
      formData.append('name', baseEventData.name);
      formData.append('start', baseEventData.start);
      formData.append('isAllDay', baseEventData.isAllDay);
      formData.append('type', baseEventData.type);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when type is missing', async () => {
      const formData = new FormData();
      formData.append('name', baseEventData.name);
      formData.append('start', baseEventData.start);
      formData.append('isAllDay', baseEventData.isAllDay);
      formData.append('feature', baseEventData.feature);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when type is invalid', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.set('type', 'invalid-type');

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when end date is before start date', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.set('end', '2025-05-31T09:00:00.000Z'); // Before start

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });

    it('should return 400 when URL is invalid', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.set('url', 'not-a-valid-url');

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error', 'Invalid event data');
    });
  });

  describe('Event Creation Without Image', () => {
    it('should create event successfully without image', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          id: testEventId,
          name: 'Test Event',
          creatorId: testUserId,
          type: 'workshop',
          isAllDay: false,
          image: undefined, // No image uploaded
        })
      );
      expect(body).toEqual(mockCreatedEvent);
    });

    it('should handle optional fields correctly', async () => {
      const minimalData = {
        name: 'Minimal Event',
        start: baseEventData.start,
        isAllDay: 'true',
        type: 'batizado',
        feature: baseEventData.feature,
        associatedGroups: JSON.stringify([]),
        associatedUsers: JSON.stringify([]),
      };

      const formData = new FormData();
      Object.entries(minimalData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          name: 'Minimal Event',
          isAllDay: true,
          type: 'batizado',
          end: undefined,
        })
      );
    });
  });

  describe('Event Creation With Image', () => {
    it('should create event with image upload', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.append('image', mockFile);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockImages.createImageBuffer).toHaveBeenCalledWith(expect.any(File), 'eventImage');
      expect(mockPinata.pinToGroup).toHaveBeenCalledWith(mockImageBuffer, expect.stringContaining(testEventId));
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          image: testCID,
        })
      );
      expect(body).toEqual(mockCreatedEvent);
    });

    it('should return error when image upload fails', async () => {
      mockPinata.pinToGroup.mockResolvedValue({ cid: null, error: 'Upload failed', errorStatus: 500 });

      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.append('image', mockFile);

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Upload failed' });
      expect(mockDb.insertEvent).not.toHaveBeenCalled();
    });
  });

  describe('FormData Parsing', () => {
    it('should parse JSON fields correctly', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          feature: mockGeoJSONFeature,
          associatedGroups: [testGroupId1, testGroupId2],
          associatedUsers: [testUserId1, testUserId2],
        })
      );
    });

    it('should convert boolean strings to booleans', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });
      formData.set('isAllDay', 'true');

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          isAllDay: true,
        })
      );
    });

    it('should convert date strings to Date objects', async () => {
      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockDb.insertEvent).toHaveBeenCalledWith(
        expect.objectContaining({
          start: new Date('2025-06-01T10:00:00.000Z'),
          end: new Date('2025-06-01T18:00:00.000Z'),
        })
      );
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.insertEvent.mockRejectedValue(new Error('Database error'));

      const formData = new FormData();
      Object.entries(baseEventData).forEach(([key, value]) => {
        formData.append(key, value);
      });

      const request = new Request('http://localhost/api/events', {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
    });
  });
});
