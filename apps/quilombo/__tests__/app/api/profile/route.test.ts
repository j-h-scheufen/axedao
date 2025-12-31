/**
 * API Route Tests: GET/PATCH /api/profile
 *
 * Tests user profile retrieval and updates.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(),
}));

describe('Profile API Routes', () => {
  const testUserId = 'user-123';

  const mockUser = {
    id: testUserId,
    email: 'user@example.com',
    name: 'Test User',
    nickname: 'Tester',
    title: 'Professor',
    phone: '+1234567890',
    avatar: null,
    groupId: null,
    links: {},
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
    updatedAt: new Date('2025-01-01T00:00:00.000Z'),
  };

  describe('GET /api/profile', () => {
    let GET: () => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const navigationModule = await import('next/navigation');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      notFound = vi.fn();
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchUser: vi.fn().mockResolvedValue(mockUser),
      };

      (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;

      // Mock notFound() to throw error (simulating Next.js behavior)
      notFound.mockImplementation(() => {
        const error = new Error('NEXT_NOT_FOUND');
        (error as any).digest = 'NEXT_NOT_FOUND';
        throw error;
      });

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/profile/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Successful Retrieval', () => {
      it('should return user profile', async () => {
        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.fetchUser).toHaveBeenCalledWith(testUserId);
        expect(body).toEqual(
          expect.objectContaining({
            id: testUserId,
            email: 'user@example.com',
            name: 'Test User',
          })
        );
      });
    });

    describe('User Not Found', () => {
      it('should return 404 when user not found', async () => {
        mockDb.fetchUser.mockResolvedValue(null);

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'Profile not found' });
      });
    });
  });

  describe('PATCH /api/profile', () => {
    let PATCH: (request: Request) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockUpdatedUser = {
      ...mockUser,
      name: 'Updated Name',
      nickname: 'UpdatedNick',
    };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const navigationModule = await import('next/navigation');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      notFound = vi.fn();
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchUser: vi.fn().mockResolvedValue(mockUser),
        updateUser: vi.fn().mockResolvedValue(mockUpdatedUser),
      };

      (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;
      (dbModule.updateUser as typeof mockDb.updateUser) = mockDb.updateUser;

      // Mock notFound() to throw error
      notFound.mockImplementation(() => {
        const error = new Error('NEXT_NOT_FOUND');
        (error as any).digest = 'NEXT_NOT_FOUND';
        throw error;
      });

      // Default: authenticated user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/profile/route');
      PATCH = routeModule.PATCH;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { name: 'Updated Name' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Input Validation', () => {
      it('should return 400 for invalid email', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', email: 'not-an-email' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid input data' });
      });

      it('should return 400 for invalid title', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', title: 'InvalidTitle' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid input data' });
      });

      it('should return 400 for missing nickname', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { name: 'Test Name' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid input data' });
      });

      it('should accept valid titles', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', title: 'mestre' },
        });

        const response = await PATCH(request);

        expect(response.status).toBe(200);
      });

      it('should accept null values for optional fields', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', name: null, title: null },
        });

        const response = await PATCH(request);

        expect(response.status).toBe(200);
      });
    });

    describe('User Not Found', () => {
      it('should return 404 when user does not exist', async () => {
        mockDb.fetchUser.mockResolvedValue(null);

        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', name: 'Updated Name' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'Profile not found' });
      });
    });

    describe('Successful Update', () => {
      it('should update user profile', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: {
            name: 'Updated Name',
            nickname: 'UpdatedNick',
          },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith(
          expect.objectContaining({
            id: testUserId,
            name: 'Updated Name',
            nickname: 'UpdatedNick',
          })
        );
        expect(body).toEqual(
          expect.objectContaining({
            name: 'Updated Name',
            nickname: 'UpdatedNick',
          })
        );
      });

      it('should handle partial updates', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'OnlyNickname' },
        });

        const response = await PATCH(request);

        expect(response.status).toBe(200);
        const updateCall = mockDb.updateUser.mock.calls[0][0];
        expect(updateCall.nickname).toBe('OnlyNickname');
        expect(updateCall.id).toBe(testUserId);
      });

      it('should omit undefined values from update', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: {
            nickname: 'TestUser',
            name: 'NewName',
            title: undefined,
          },
        });

        const response = await PATCH(request);

        expect(response.status).toBe(200);
        const updateCall = mockDb.updateUser.mock.calls[0][0];
        expect(updateCall.name).toBe('NewName');
        expect(updateCall).not.toHaveProperty('title');
      });

      it('should update links object', async () => {
        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: {
            nickname: 'TestUser',
            links: [
              { type: 'website', url: 'https://example.com' },
              { type: 'instagram', url: 'https://instagram.com/user' },
            ],
          },
        });

        const response = await PATCH(request);

        expect(response.status).toBe(200);
        expect(mockDb.updateUser).toHaveBeenCalledWith(
          expect.objectContaining({
            links: expect.arrayContaining([
              expect.objectContaining({ type: 'website' }),
              expect.objectContaining({ type: 'instagram' }),
            ]),
          })
        );
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.updateUser.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest('http://localhost/api/profile', {
          method: 'PATCH',
          body: { nickname: 'TestUser', name: 'Updated Name' },
        });

        const response = await PATCH(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Error updating user profile' });
      });
    });
  });
});
