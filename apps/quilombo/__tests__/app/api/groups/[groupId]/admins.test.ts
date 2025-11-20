/**
 * API Route Tests: GET /api/groups/[groupId]/admins and PUT/DELETE /api/groups/[groupId]/admins/[userId]
 *
 * Tests group admin management: listing, adding, and removing admins.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(),
}));

describe('Group Admins API Routes', () => {
  const testGroupId = 'group-123';
  const testUserId = 'user-123';
  const testAdminId = 'admin-456';
  const testNewAdminId = 'newadmin-789';

  describe('GET /api/groups/[groupId]/admins', () => {
    let GET: (request: Request, context: any) => Promise<Response>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId };
    const mockAdminIds = [testAdminId, testUserId];

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const dbModule = await import('@/db');
      const navigationModule = await import('next/navigation');

      notFound = vi.fn();
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchGroup: vi.fn().mockResolvedValue({ id: testGroupId, name: 'Test Group' }),
        fetchGroupAdminIds: vi.fn().mockResolvedValue(mockAdminIds),
      };

      (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
      (dbModule.fetchGroupAdminIds as typeof mockDb.fetchGroupAdminIds) = mockDb.fetchGroupAdminIds;

      // Mock notFound() to throw error (simulating Next.js behavior)
      notFound.mockImplementation(() => {
        const error = new Error('NEXT_NOT_FOUND');
        (error as any).digest = 'NEXT_NOT_FOUND';
        throw error;
      });

      const routeModule = await import('@/app/api/groups/[groupId]/admins/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Successful Retrieval', () => {
      it('should return admin IDs array', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual(mockAdminIds);
        expect(mockDb.fetchGroup).toHaveBeenCalledWith(testGroupId);
        expect(mockDb.fetchGroupAdminIds).toHaveBeenCalledWith(testGroupId);
      });

      it('should not require authentication', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
      });

      it('should return empty array when group has no admins', async () => {
        mockDb.fetchGroupAdminIds.mockResolvedValue([]);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual([]);
      });
    });

    describe('Group Not Found', () => {
      it('should return 500 when group does not exist (notFound caught by try-catch)', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(notFound).toHaveBeenCalled();
        expect(body).toHaveProperty('error', true);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.fetchGroupAdminIds.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins`, {
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

  describe('PUT /api/groups/[groupId]/admins/[userId]', () => {
    let PUT: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId, userId: testNewAdminId };
    const mockUpdatedAdminIds = [testAdminId, testUserId, testNewAdminId];

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        isGroupAdmin: vi.fn().mockResolvedValue(true),
        addGroupAdmin: vi.fn().mockResolvedValue(undefined),
        fetchGroupAdminIds: vi.fn().mockResolvedValue(mockUpdatedAdminIds),
      };

      (dbModule.isGroupAdmin as typeof mockDb.isGroupAdmin) = mockDb.isGroupAdmin;
      (dbModule.addGroupAdmin as typeof mockDb.addGroupAdmin) = mockDb.addGroupAdmin;
      (dbModule.fetchGroupAdminIds as typeof mockDb.fetchGroupAdminIds) = mockDb.fetchGroupAdminIds;

      // Default: authenticated as admin
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/admins/[userId]/route');
      PUT = routeModule.PUT;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user is not a group admin', async () => {
        mockDb.isGroupAdmin.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Missing permissions' });
        expect(mockDb.isGroupAdmin).toHaveBeenCalledWith(testGroupId, testAdminId);
      });

      it('should allow adding admin when user is a group admin', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.isGroupAdmin).toHaveBeenCalledWith(testGroupId, testAdminId);
      });
    });

    describe('Successful Admin Addition', () => {
      it('should add user as admin and return updated admin list', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.addGroupAdmin).toHaveBeenCalledWith({
          groupId: testGroupId,
          userId: testNewAdminId,
        });
        expect(body).toEqual(mockUpdatedAdminIds);
      });

      it('should handle adding admin who is already an admin', async () => {
        // Database will handle duplicates, route just calls the function
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve({ ...mockParams, userId: testAdminId }) });

        expect(response.status).toBe(200);
        expect(mockDb.addGroupAdmin).toHaveBeenCalledWith({
          groupId: testGroupId,
          userId: testAdminId,
        });
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.addGroupAdmin.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testNewAdminId}`, {
          method: 'PUT',
        });

        const response = await PUT(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error');
      });
    });
  });

  describe('DELETE /api/groups/[groupId]/admins/[userId]', () => {
    let DELETE: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;

    const mockParams = { groupId: testGroupId, userId: testUserId };
    const mockRemainingAdminIds = [testAdminId];

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      // Mock database functions
      mockDb = {
        isGroupAdmin: vi.fn().mockResolvedValue(true),
        removeGroupAdmin: vi.fn().mockResolvedValue(undefined),
        fetchGroupAdminIds: vi
          .fn()
          .mockResolvedValueOnce([testAdminId, testUserId]) // First call: before removal
          .mockResolvedValue(mockRemainingAdminIds), // Subsequent calls: after removal
      };

      (dbModule.isGroupAdmin as typeof mockDb.isGroupAdmin) = mockDb.isGroupAdmin;
      (dbModule.removeGroupAdmin as typeof mockDb.removeGroupAdmin) = mockDb.removeGroupAdmin;
      (dbModule.fetchGroupAdminIds as typeof mockDb.fetchGroupAdminIds) = mockDb.fetchGroupAdminIds;

      // Default: authenticated as admin
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/admins/[userId]/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
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

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user is not a group admin', async () => {
        mockDb.isGroupAdmin.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Missing permissions' });
        expect(mockDb.isGroupAdmin).toHaveBeenCalledWith(testGroupId, testAdminId);
      });
    });

    describe('Last Admin Protection', () => {
      it('should return 403 when trying to remove the last admin', async () => {
        // Reset and reconfigure mock to return only one admin
        mockDb.fetchGroupAdminIds.mockReset().mockResolvedValue([testUserId]);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Cannot remove the last admin of the group' });
        expect(mockDb.removeGroupAdmin).not.toHaveBeenCalled();
      });

      it('should allow removing admin when there are multiple admins', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.removeGroupAdmin).toHaveBeenCalled();
      });
    });

    describe('Successful Admin Removal', () => {
      it('should remove admin and return updated admin list', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.removeGroupAdmin).toHaveBeenCalledWith(testGroupId, testUserId);
        expect(body).toEqual(mockRemainingAdminIds);
      });

      it('should fetch admin list before and after removal', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        await DELETE(request, { params: Promise.resolve(mockParams) });

        // Called twice: once before (to check last admin), once after (to return updated list)
        expect(mockDb.fetchGroupAdminIds).toHaveBeenCalledTimes(2);
        expect(mockDb.fetchGroupAdminIds).toHaveBeenNthCalledWith(1, testGroupId);
        expect(mockDb.fetchGroupAdminIds).toHaveBeenNthCalledWith(2, testGroupId);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.removeGroupAdmin.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/admins/${testUserId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error');
      });
    });
  });
});
