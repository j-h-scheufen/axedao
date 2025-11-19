/**
 * API Route Tests: PUT/DELETE /api/profile/group/[groupId]
 *
 * Tests group membership management (join/leave).
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');

describe('Group Membership API Routes', () => {
  const testUserId = 'user-123';
  const testGroupId = 'group-456';

  const mockUser = {
    id: testUserId,
    email: 'user@example.com',
    name: 'Test User',
    nickname: 'Tester',
    title: null,
    phone: null,
    avatar: null,
    groupId: null,
    links: [],
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
    updatedAt: new Date('2025-01-01T00:00:00.000Z'),
  };

  describe('PUT /api/profile/group/[groupId]', () => {
    let PUT: (request: Request, context: { params: Promise<{ groupId: string }> }) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        updateUser: vi.fn().mockResolvedValue({ ...mockUser, groupId: testGroupId }),
      };

      (dbModule.updateUser as typeof mockDb.updateUser) = mockDb.updateUser;

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/profile/group/[groupId]/route');
      PUT = routeModule.PUT;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = new Request('http://localhost/api/profile/group/group-456', {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const request = new Request('http://localhost/api/profile/group/group-456', {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Successful Join', () => {
      it('should join group and return updated user', async () => {
        const request = new Request('http://localhost/api/profile/group/group-456', {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith({
          id: testUserId,
          groupId: testGroupId,
        });
        expect(body.groupId).toBe(testGroupId);
      });

      it('should handle different group IDs', async () => {
        const differentGroupId = 'group-789';
        mockDb.updateUser.mockResolvedValue({ ...mockUser, groupId: differentGroupId });

        const request = new Request(`http://localhost/api/profile/group/${differentGroupId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: differentGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith({
          id: testUserId,
          groupId: differentGroupId,
        });
        expect(body.groupId).toBe(differentGroupId);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        const dbError = new Error('Database connection failed');
        mockDb.updateUser.mockRejectedValue(dbError);

        const request = new Request('http://localhost/api/profile/group/group-456', {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Database connection failed' });
      });

      it('should return 500 with generic message for non-Error throws', async () => {
        mockDb.updateUser.mockRejectedValue('string error');

        const request = new Request('http://localhost/api/profile/group/group-456', {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'An unexpected server error occurred while joining group' });
      });
    });
  });

  describe('DELETE /api/profile/group', () => {
    let DELETE: () => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        updateUser: vi.fn().mockResolvedValue({ ...mockUser, groupId: null }),
      };

      (dbModule.updateUser as typeof mockDb.updateUser) = mockDb.updateUser;

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/profile/group/[groupId]/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Successful Leave', () => {
      it('should leave group and return updated user', async () => {
        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith({
          id: testUserId,
          groupId: null,
        });
        expect(body.groupId).toBeNull();
      });

      it('should work even when user has no group', async () => {
        mockDb.updateUser.mockResolvedValue(mockUser); // Already has groupId: null

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith({
          id: testUserId,
          groupId: null,
        });
        expect(body.groupId).toBeNull();
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        const dbError = new Error('Database connection failed');
        mockDb.updateUser.mockRejectedValue(dbError);

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: true, message: 'Database connection failed' });
      });

      it('should return 500 with generic message for non-Error throws', async () => {
        mockDb.updateUser.mockRejectedValue('string error');

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({
          error: true,
          message: 'An unexpected server error occurred while exiting group',
        });
      });
    });
  });
});
