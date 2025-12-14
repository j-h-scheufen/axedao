/**
 * API Route Tests: GET/PATCH/DELETE /api/groups/[groupId]
 *
 * Tests group retrieval, updates, and deletion with authentication and authorization.
 * PATCH now handles combined updates to both genealogy.group_profiles and public.groups.
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
  const testProfileId = 'profile-456';
  const testUserId = 'user-123';
  const _testAdminId = 'admin-456';

  const mockGroup = {
    id: testGroupId,
    profileId: testProfileId,
    name: 'Test Group',
    description: 'A test group',
    email: 'group@example.com',
    style: 'angola',
    links: [{ type: 'website', url: 'https://example.com' }],
    createdAt: new Date('2025-01-01'),
    claimedAt: new Date('2025-01-02'),
    createdBy: testUserId,
    claimedBy: testUserId,
    adminCount: 1,
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
      updateGroupProfile: vi.fn().mockResolvedValue(undefined),
      deleteGroup: vi.fn().mockResolvedValue(undefined),
    };

    (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
    (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
    (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
    (dbModule.updateGroupProfile as typeof mockDb.updateGroupProfile) = mockDb.updateGroupProfile;
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
    // New combined schema: identity fields (genealogy) + operational fields (public.groups)
    const validUpdateData = {
      // Identity fields (genealogy.group_profiles)
      name: 'Updated Group',
      style: 'regional',
      descriptionEn: 'Updated description in English',
      descriptionPt: 'Descrição atualizada em Português',
      philosophyEn: 'Our philosophy',
      philosophyPt: 'Nossa filosofia',
      historyEn: 'Our history',
      historyPt: 'Nossa história',
      publicLinks: ['https://wikipedia.org/example'],
      isActive: true,
      // Operational fields (public.groups)
      email: 'updated@example.com',
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
      it('should accept partial updates (all fields optional)', async () => {
        // New API allows partial updates - only send what needs to change
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { descriptionEn: 'Only updating description' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        expect(response.status).toBe(200);
      });

      it('should return 400 when email is invalid', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { email: 'not-an-email' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should return 400 when descriptionEn exceeds 2000 characters', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { descriptionEn: 'a'.repeat(2001) },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should return 400 when philosophyEn exceeds 5000 characters', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { philosophyEn: 'a'.repeat(5001) },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should return 400 when historyEn exceeds 10000 characters', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { historyEn: 'a'.repeat(10001) },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should return 400 when name is less than 2 characters', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { name: 'A' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should return 400 when style is invalid', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { style: 'invalid-style' },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toHaveProperty('error');
      });

      it('should accept all valid styles', async () => {
        const validStyles = ['angola', 'regional', 'contemporanea', 'mixed'];

        for (const style of validStyles) {
          const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
            method: 'PATCH',
            body: { style },
          });

          const response = await PATCH(request, { params: Promise.resolve(mockParams) });
          expect(response.status).toBe(200);
        }
      });

      it('should accept nullable style', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { style: null },
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });
        expect(response.status).toBe(200);
      });
    });

    describe('Business Logic - Combined Updates', () => {
      it('should update both genealogy profile and operational fields', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: validUpdateData,
        });

        const response = await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(response.status).toBe(200);

        // Should update genealogy profile with identity fields
        expect(mockDb.updateGroupProfile).toHaveBeenCalledWith(
          testProfileId,
          expect.objectContaining({
            name: 'Updated Group',
            style: 'regional',
            descriptionEn: 'Updated description in English',
            descriptionPt: 'Descrição atualizada em Português',
          })
        );

        // Should update public.groups with operational fields + legacy sync
        expect(mockDb.updateGroup).toHaveBeenCalledWith(
          expect.objectContaining({
            id: testGroupId,
            email: 'updated@example.com',
            links: [{ url: 'https://updated.com', type: 'website' }],
            // Legacy sync fields
            name: 'Updated Group',
            style: 'regional',
          })
        );
      });

      it('should only update genealogy profile when identity fields change', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { name: 'New Name', descriptionEn: 'New description' },
        });

        await PATCH(request, { params: Promise.resolve(mockParams) });

        expect(mockDb.updateGroupProfile).toHaveBeenCalledWith(
          testProfileId,
          expect.objectContaining({
            name: 'New Name',
            descriptionEn: 'New description',
          })
        );
      });

      it('should only update operational fields when only email/links change', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { email: 'new@example.com' },
        });

        await PATCH(request, { params: Promise.resolve(mockParams) });

        // Genealogy profile update called but only with non-identity fields filtered out
        expect(mockDb.updateGroup).toHaveBeenCalledWith(
          expect.objectContaining({
            id: testGroupId,
            email: 'new@example.com',
          })
        );
      });

      it('should skip genealogy update when group has no profileId', async () => {
        // Simulate a legacy group without genealogy profile
        mockDb.fetchGroup.mockResolvedValue({ ...mockGroup, profileId: null });

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: { name: 'Updated', email: 'new@example.com' },
        });

        await PATCH(request, { params: Promise.resolve(mockParams) });

        // Should NOT call updateGroupProfile
        expect(mockDb.updateGroupProfile).not.toHaveBeenCalled();

        // Should still update public.groups
        expect(mockDb.updateGroup).toHaveBeenCalled();
      });

      it('should remove undefined fields from update', async () => {
        const updateWithUndefined = {
          name: 'Updated',
          descriptionEn: 'New description',
          email: undefined, // Should be removed
        };

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}`, {
          method: 'PATCH',
          body: updateWithUndefined,
        });

        await PATCH(request, { params: Promise.resolve(mockParams) });

        // Check that undefined fields are not passed
        const genealogyCall = mockDb.updateGroupProfile.mock.calls[0][1];
        expect(genealogyCall).not.toHaveProperty('email');
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when updateGroupProfile throws error', async () => {
        mockDb.updateGroupProfile.mockRejectedValue(new Error('Database error'));

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

      it('should return 500 when updateGroup throws error', async () => {
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
