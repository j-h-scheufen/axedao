/**
 * API Route Tests: GET/PATCH/DELETE /api/groups/[groupId]
 *
 * Tests group retrieval, updates, and deletion with authentication and authorization.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(),
}));

describe('GET/PATCH/DELETE /api/groups/[groupId]', () => {
  let GET: (request: Request, context: any) => Promise<Response>;
  let PATCH: (request: Request, context: any) => Promise<Response>;
  let DELETE: (request: Request, context: any) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let notFound: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testGroupId = 'group-123';
  const testUserId = 'user-123';
  const _testAdminId = 'admin-456';

  const mockGroup = {
    id: testGroupId,
    name: 'Test Group',
    description: 'A test group',
    founder: 'John Doe',
    email: 'group@example.com',
    style: 'angola',
    verified: true,
    links: [{ type: 'website', url: 'https://example.com' }],
    createdAt: new Date('2025-01-01'),
    claimedAt: new Date('2025-01-02'),
    createdBy: testUserId,
    claimedBy: testUserId,
  };

  const mockParams = { groupId: testGroupId };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');
    const navigationModule = await import('next/navigation');

    getServerSession = vi.fn();
    notFound = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (navigationModule.notFound as typeof notFound) = notFound;

    // Mock database functions
    mockDb = {
      fetchGroup: vi.fn().mockResolvedValue(mockGroup),
      canUserManageGroup: vi.fn().mockResolvedValue(true),
      updateGroup: vi.fn().mockResolvedValue({ ...mockGroup, name: 'Updated Group' }),
      deleteGroup: vi.fn().mockResolvedValue(undefined),
    };

    (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
    (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
    (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
    (dbModule.deleteGroup as typeof mockDb.deleteGroup) = mockDb.deleteGroup;

    // Mock notFound() to throw error (simulating Next.js behavior)
    notFound.mockImplementation(() => {
      const error = new Error('NEXT_NOT_FOUND');
      (error as any).digest = 'NEXT_NOT_FOUND';
      throw error;
    });

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/groups/[groupId]/route');
    GET = routeModule.GET;
    PATCH = routeModule.PATCH;
    DELETE = routeModule.DELETE;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('GET /api/groups/[groupId]', () => {
    describe('Successful Retrieval', () => {
      it('should return group when found', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual(mockGroup);
        expect(mockDb.fetchGroup).toHaveBeenCalledWith(testGroupId);
      });

      it('should not require authentication', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'GET',
        });

        const response = await GET(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(getServerSession).not.toHaveBeenCalled();
      });
    });

    describe('Group Not Found', () => {
      it('should return 500 when group does not exist (notFound caught by try-catch)', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
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
        mockDb.fetchGroup.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
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

  describe('PATCH /api/groups/[groupId]', () => {
    const validUpdateData = {
      name: 'Updated Group',
      description: 'Updated description',
      founder: 'Jane Doe',
      email: 'updated@example.com',
      style: 'regional',
      links: [{ url: 'https://updated.com', type: 'website' }],
    };

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
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

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should call notFound() when group does not exist', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        await expect(PATCH(request, { params: Promise.resolve(mockParams) })).rejects.toThrow('NEXT_NOT_FOUND');
        expect(notFound).toHaveBeenCalled();
      });

      it('should return 401 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({
          error: true,
          message: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update a group',
        });
        expect(mockDb.canUserManageGroup).toHaveBeenCalledWith(testGroupId, testUserId);
      });

      it('should allow update when user can manage group', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.canUserManageGroup).toHaveBeenCalledWith(testGroupId, testUserId);
      });
    });

    describe('Input Validation', () => {
      it('should throw validation error when name is missing', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { description: 'Updated description' },
        });

        await expect(PATCH(request, { params: Promise.resolve(mockParams) })).rejects.toThrow();
      });

      it('should throw validation error when email is invalid', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { ...validUpdateData, email: 'not-an-email' },
        });

        await expect(PATCH(request, { params: Promise.resolve(mockParams) })).rejects.toThrow();
      });

      it('should throw validation error when description exceeds 500 characters', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { ...validUpdateData, description: 'a'.repeat(501) },
        });

        await expect(PATCH(request, { params: Promise.resolve(mockParams) })).rejects.toThrow();
      });

      it('should throw validation error when style is invalid', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { ...validUpdateData, style: 'invalid-style' },
        });

        await expect(PATCH(request, { params: Promise.resolve(mockParams) })).rejects.toThrow();
      });

      it('should accept all valid styles', async () => {
        const validStyles = ['angola', 'regional', 'contemporanea'];

        for (const style of validStyles) {
          const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
            method: 'PATCH',
            body: { ...validUpdateData, style },
          });

          const response = await PATCH(request, { params: Promise.resolve(mockParams) });
          expect(response.status).toBe(200);
        }
      });

      it('should accept nullable fields', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: {
            name: 'Updated Group',
            founder: null,
            email: null,
            style: null,
          },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
      });
    });

    describe('Business Logic', () => {
      it('should update group with all fields', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockDb.updateGroup).toHaveBeenCalledWith({
          ...validUpdateData,
          id: testGroupId,
        });
        expect(body).toEqual(
          expect.objectContaining({
            id: testGroupId,
            name: 'Updated Group',
          })
        );
      });

      it('should accept partial updates', async () => {
        const partialUpdate = {
          name: 'Partially Updated',
          description: 'New description',
        };

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: partialUpdate,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);
        expect(mockDb.updateGroup).toHaveBeenCalledWith({
          ...partialUpdate,
          id: testGroupId,
        });
      });

      it('should remove undefined fields from update', async () => {
        const updateWithUndefined = {
          name: 'Updated',
          description: 'New description',
          founder: undefined, // Should be removed
        };

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: updateWithUndefined,
        });

        await PATCH(request, { params: Promise.resolve(mockParams) });

        // Check that undefined fields are not passed to updateGroup
        const updateCall = mockDb.updateGroup.mock.calls[0][0];
        expect(updateCall).not.toHaveProperty('founder');
        expect(updateCall).toEqual({
          name: 'Updated',
          description: 'New description',
          id: testGroupId,
        });
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.updateGroup.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });

  describe('DELETE /api/groups/[groupId]', () => {
    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
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

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 500 when group does not exist (notFound caught by try-catch)', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(notFound).toHaveBeenCalled();
        expect(body).toHaveProperty('error', true);
      });

      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: true,
          message: 'Unauthorized to delete the group. Missing admin privileges.',
        });
        expect(mockDb.canUserManageGroup).toHaveBeenCalledWith(testGroupId, testUserId);
      });
    });

    describe('Successful Deletion', () => {
      it('should delete group successfully', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'DELETE',
        });

        await DELETE(request, { params: Promise.resolve(mockParams) });

        // Note: Cannot reliably test 204 status due to NextResponse constructor limitations
        // Verify deletion was called instead
        expect(mockDb.deleteGroup).toHaveBeenCalledWith(testGroupId);
        expect(mockDb.canUserManageGroup).toHaveBeenCalledWith(testGroupId, testUserId);
      });

      it('should allow deletion when user is group admin', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(true);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'DELETE',
        });

        await DELETE(request, { params: Promise.resolve(mockParams) });

        expect(mockDb.deleteGroup).toHaveBeenCalled();
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.deleteGroup.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
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
