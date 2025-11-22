/**
 * API Route Tests: GET /api/groups/[groupId]/members and DELETE /api/groups/[groupId]/members/[userId]
 *
 * Tests group member management operations.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');

describe('Group Members API Routes', () => {
  const testGroupId = 'group-123';
  const testUserId = 'user-123';
  const testMemberId = 'member-456';

  const mockMembers = [
    {
      id: testMemberId,
      email: 'member@example.com',
      name: 'Member User',
      nickname: 'Member',
      title: null,
      phone: null,
      avatar: null,
      groupId: testGroupId,
      links: [],
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    },
    {
      id: 'member-789',
      email: 'member2@example.com',
      name: 'Member User 2',
      nickname: 'Member2',
      title: null,
      phone: null,
      avatar: null,
      groupId: testGroupId,
      links: [],
      createdAt: new Date('2025-01-01T00:00:00.000Z'),
      updatedAt: new Date('2025-01-01T00:00:00.000Z'),
    },
  ];

  describe('GET /api/groups/[groupId]/members', () => {
    let GET: (request: Request, context: { params: Promise<{ groupId: string }> }) => Promise<Response>;
    let mockDb: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const dbModule = await import('@/db');

      // Mock database functions
      mockDb = {
        fetchPublicGroupMembers: vi.fn().mockResolvedValue(mockMembers),
      };

      (dbModule.fetchPublicGroupMembers as typeof mockDb.fetchPublicGroupMembers) = mockDb.fetchPublicGroupMembers;

      const routeModule = await import('@/app/api/groups/[groupId]/members/route');
      GET = routeModule.GET;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Successful Retrieval', () => {
      it('should return list of group members', async () => {
        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.fetchPublicGroupMembers).toHaveBeenCalledWith(testGroupId);
        expect(body).toHaveLength(2);
        expect(body[0]).toEqual(
          expect.objectContaining({
            id: testMemberId,
            email: 'member@example.com',
            groupId: testGroupId,
          })
        );
      });

      it('should return empty array when no members', async () => {
        mockDb.fetchPublicGroupMembers.mockResolvedValue([]);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual([]);
      });

      it('should handle different group IDs', async () => {
        const differentGroupId = 'group-999';

        const request = new Request(`http://localhost/api/groups/${differentGroupId}/members`, {
          method: 'GET',
        });

        await GET(request, { params: Promise.resolve({ groupId: differentGroupId }) });

        expect(mockDb.fetchPublicGroupMembers).toHaveBeenCalledWith(differentGroupId);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.fetchPublicGroupMembers.mockRejectedValue(new Error('Database error'));

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve({ groupId: testGroupId }) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });

  describe('DELETE /api/groups/[groupId]/members/[userId]', () => {
    let DELETE: (
      request: Request,
      context: { params: Promise<{ groupId: string; userId: string }> }
    ) => Promise<Response>;
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
        isGroupAdmin: vi.fn().mockResolvedValue(true),
        isGroupMember: vi.fn().mockResolvedValue(true),
        removeGroupMember: vi.fn().mockResolvedValue(undefined),
        fetchPublicGroupMembers: vi.fn().mockResolvedValue([mockMembers[1]]), // After removal
      };

      (dbModule.isGroupAdmin as typeof mockDb.isGroupAdmin) = mockDb.isGroupAdmin;
      (dbModule.isGroupMember as typeof mockDb.isGroupMember) = mockDb.isGroupMember;
      (dbModule.removeGroupMember as typeof mockDb.removeGroupMember) = mockDb.removeGroupMember;
      (dbModule.fetchPublicGroupMembers as typeof mockDb.fetchPublicGroupMembers) = mockDb.fetchPublicGroupMembers;

      // Default: authenticated admin user
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'admin@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/members/[userId]/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });

      it('should return 401 when session has no user ID', async () => {
        getServerSession.mockResolvedValue({
          user: {},
          expires: '2025-12-31',
        });

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 403 when user is not a group admin', async () => {
        mockDb.isGroupAdmin.mockResolvedValue(false);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({ error: 'Missing permissions' });
        expect(mockDb.isGroupAdmin).toHaveBeenCalledWith(testGroupId, testUserId);
      });
    });

    describe('Validation', () => {
      it('should return 400 when user is not a group member', async () => {
        mockDb.isGroupMember.mockResolvedValue(false);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({
          error: 'Only group members can be removed from a group, this user might be a group admin or leader',
        });
        expect(mockDb.isGroupMember).toHaveBeenCalledWith(testGroupId, testMemberId);
      });
    });

    describe('Successful Removal', () => {
      it('should remove member and return updated member list', async () => {
        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.isGroupAdmin).toHaveBeenCalledWith(testGroupId, testUserId);
        expect(mockDb.isGroupMember).toHaveBeenCalledWith(testGroupId, testMemberId);
        expect(mockDb.removeGroupMember).toHaveBeenCalledWith(testMemberId);
        expect(mockDb.fetchPublicGroupMembers).toHaveBeenCalledWith(testGroupId);
        expect(body).toEqual([mockMembers[1]]);
        expect(body).toHaveLength(1);
      });

      it('should handle removing last member', async () => {
        mockDb.fetchPublicGroupMembers.mockResolvedValue([]);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual([]);
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when removeGroupMember throws error', async () => {
        mockDb.removeGroupMember.mockRejectedValue(new Error('Database error'));

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({
          error: 'An internal server error occurred while removing group member',
        });
      });

      it('should return 500 when fetchGroupMembers throws error after removal', async () => {
        mockDb.fetchPublicGroupMembers.mockRejectedValue(new Error('Database error'));

        const request = new Request(`http://localhost/api/groups/${testGroupId}/members/${testMemberId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, {
          params: Promise.resolve({ groupId: testGroupId, userId: testMemberId }),
        });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({
          error: 'An internal server error occurred while removing group member',
        });
      });
    });
  });
});
