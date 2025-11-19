/**
 * API Route Tests: Logo and Banner image uploads for groups
 *   - POST/DELETE /api/groups/[groupId]/logo
 *   - POST/DELETE /api/groups/[groupId]/banner
 *
 * Tests image upload and deletion with IPFS storage.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/pinata');
vi.mock('@/utils/images');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(),
}));

describe('Group Images (Logo/Banner) API Routes', () => {
  const testGroupId = 'group-123';
  const testUserId = 'user-123';
  const testCID = 'QmTest123456789';

  const mockGroup = {
    id: testGroupId,
    name: 'Test Group',
    logo: null,
    banner: null,
  };

  const mockFile = new File(['test content'], 'test.jpg', { type: 'image/jpeg' });
  const mockImageBuffer = Buffer.from('test image data');

  describe('POST /api/groups/[groupId]/logo', () => {
    let POST: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;
    let mockImages: any;

    const mockParams = { groupId: testGroupId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const pinataModule = await import('@/utils/pinata');
      const imagesModule = await import('@/utils/images');
      const navigationModule = await import('next/navigation');

      getServerSession = vi.fn();
      notFound = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchGroup: vi.fn().mockResolvedValue(mockGroup),
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        updateGroup: vi.fn().mockResolvedValue({ ...mockGroup, logo: testCID }),
      };

      // Mock Pinata functions
      mockPinata = {
        pinToGroup: vi.fn().mockResolvedValue({ cid: testCID, error: null }),
        unpin: vi.fn().mockResolvedValue(undefined),
      };

      // Mock image processing
      mockImages = {
        createImageBuffer: vi.fn().mockResolvedValue(mockImageBuffer),
      };

      (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
      (pinataModule.pinToGroup as typeof mockPinata.pinToGroup) = mockPinata.pinToGroup;
      (pinataModule.unpin as typeof mockPinata.unpin) = mockPinata.unpin;
      (imagesModule.createImageBuffer as typeof mockImages.createImageBuffer) = mockImages.createImageBuffer;

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

      const routeModule = await import('@/app/api/groups/[groupId]/logo/route');
      POST = routeModule.POST;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 500 when group not found (notFound caught by try-catch)', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(notFound).toHaveBeenCalled();
        expect(body).toHaveProperty('error', true);
      });

      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update the group logo',
        });
      });
    });

    describe('File Validation', () => {
      it('should return 400 when no file provided', async () => {
        const formData = new FormData();

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid input data. No file found.' });
      });
    });

    describe('Successful Logo Upload', () => {
      it('should upload logo and return updated group', async () => {
        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockImages.createImageBuffer).toHaveBeenCalledWith(expect.any(File), 'groupLogo');
        expect(mockPinata.pinToGroup).toHaveBeenCalledWith(mockImageBuffer, expect.stringContaining(testGroupId), null);
        expect(mockDb.updateGroup).toHaveBeenCalledWith({
          ...mockGroup,
          logo: testCID,
        });
        expect(body).toEqual(
          expect.objectContaining({
            id: testGroupId,
            logo: testCID,
          })
        );
      });

      it('should replace existing logo', async () => {
        const existingCID = 'QmOldLogo123';
        mockDb.fetchGroup.mockResolvedValue({ ...mockGroup, logo: existingCID });

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        await POST(request, { params: Promise.resolve(mockParams) });

        expect(mockPinata.pinToGroup).toHaveBeenCalledWith(mockImageBuffer, expect.any(String), existingCID);
      });
    });

    describe('Error Handling', () => {
      it('should return error status from pinning service', async () => {
        mockPinata.pinToGroup.mockResolvedValue({
          cid: null,
          error: 'Pinning failed',
          errorStatus: 413,
        });

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(413);
        expect(body).toEqual({ error: 'Pinning failed' });
      });

      it('should return 500 when database throws error', async () => {
        mockDb.updateGroup.mockRejectedValue(new Error('Database error'));

        const formData = new FormData();
        formData.append('file', mockFile);

        const request = new Request(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });
    });
  });

  describe('DELETE /api/groups/[groupId]/logo', () => {
    let DELETE: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;

    const mockParams = { groupId: testGroupId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const pinataModule = await import('@/utils/pinata');
      const navigationModule = await import('next/navigation');

      getServerSession = vi.fn();
      notFound = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchGroup: vi.fn().mockResolvedValue({ ...mockGroup, logo: testCID }),
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        updateGroup: vi.fn().mockResolvedValue({ ...mockGroup, logo: null }),
      };

      // Mock Pinata functions
      mockPinata = {
        unpin: vi.fn().mockResolvedValue(undefined),
      };

      (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
      (pinataModule.unpin as typeof mockPinata.unpin) = mockPinata.unpin;

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

      const routeModule = await import('@/app/api/groups/[groupId]/logo/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('Authorization', () => {
      it('should return 500 when group not found (notFound caught by try-catch)', async () => {
        mockDb.fetchGroup.mockResolvedValue(null);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const _body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(notFound).toHaveBeenCalled();
      });

      it('should return 403 when user cannot manage group', async () => {
        mockDb.canUserManageGroup.mockResolvedValue(false);

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(403);
        expect(body).toEqual({
          error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can delete the group logo',
        });
      });
    });

    describe('Successful Logo Deletion', () => {
      it('should delete logo and return updated group', async () => {
        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockPinata.unpin).toHaveBeenCalledWith(testCID);
        expect(mockDb.updateGroup).toHaveBeenCalledWith({
          ...mockGroup,
          logo: null,
        });
        expect(body).toEqual(
          expect.objectContaining({
            id: testGroupId,
            logo: null,
          })
        );
      });

      it('should return group unchanged when no logo exists', async () => {
        mockDb.fetchGroup.mockResolvedValue({ ...mockGroup, logo: null });

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockPinata.unpin).not.toHaveBeenCalled();
        expect(mockDb.updateGroup).not.toHaveBeenCalled();
        expect(body).toEqual(expect.objectContaining({ id: testGroupId }));
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.updateGroup.mockRejectedValue(new Error('Database error'));

        const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/logo`, {
          method: 'DELETE',
        });

        const response = await DELETE(request, { params: Promise.resolve(mockParams) });
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
      });
    });
  });

  // Banner tests are nearly identical to logo tests, testing key differences
  describe('POST /api/groups/[groupId]/banner', () => {
    let POST: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;
    let mockImages: any;

    const mockParams = { groupId: testGroupId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const pinataModule = await import('@/utils/pinata');
      const imagesModule = await import('@/utils/images');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      mockDb = {
        fetchGroup: vi.fn().mockResolvedValue(mockGroup),
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        updateGroup: vi.fn().mockResolvedValue({ ...mockGroup, banner: testCID }),
      };

      mockPinata = {
        pinToGroup: vi.fn().mockResolvedValue({ cid: testCID, error: null }),
      };

      mockImages = {
        createImageBuffer: vi.fn().mockResolvedValue(mockImageBuffer),
      };

      (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
      (pinataModule.pinToGroup as typeof mockPinata.pinToGroup) = mockPinata.pinToGroup;
      (imagesModule.createImageBuffer as typeof mockImages.createImageBuffer) = mockImages.createImageBuffer;

      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/banner/route');
      POST = routeModule.POST;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    it('should upload banner with correct image type', async () => {
      const formData = new FormData();
      formData.append('file', mockFile);

      const request = new Request(`http://localhost/api/groups/${testGroupId}/banner`, {
        method: 'POST',
        body: formData,
      });

      await POST(request, { params: Promise.resolve(mockParams) });

      expect(mockImages.createImageBuffer).toHaveBeenCalledWith(expect.any(File), 'groupBanner');
    });

    it('should return 403 with banner-specific error message', async () => {
      mockDb.canUserManageGroup.mockResolvedValue(false);

      const formData = new FormData();
      formData.append('file', mockFile);

      const request = new Request(`http://localhost/api/groups/${testGroupId}/banner`, {
        method: 'POST',
        body: formData,
      });

      const response = await POST(request, { params: Promise.resolve(mockParams) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({
        error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update the group banner',
      });
    });
  });

  describe('DELETE /api/groups/[groupId]/banner', () => {
    let DELETE: (request: Request, context: any) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;

    const mockParams = { groupId: testGroupId };

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const pinataModule = await import('@/utils/pinata');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      mockDb = {
        fetchGroup: vi.fn().mockResolvedValue({ ...mockGroup, banner: testCID }),
        canUserManageGroup: vi.fn().mockResolvedValue(true),
        updateGroup: vi.fn().mockResolvedValue({ ...mockGroup, banner: null }),
      };

      mockPinata = {
        unpin: vi.fn().mockResolvedValue(undefined),
      };

      (dbModule.fetchGroup as typeof mockDb.fetchGroup) = mockDb.fetchGroup;
      (dbModule.canUserManageGroup as typeof mockDb.canUserManageGroup) = mockDb.canUserManageGroup;
      (dbModule.updateGroup as typeof mockDb.updateGroup) = mockDb.updateGroup;
      (pinataModule.unpin as typeof mockPinata.unpin) = mockPinata.unpin;

      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });

      const routeModule = await import('@/app/api/groups/[groupId]/banner/route');
      DELETE = routeModule.DELETE;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    it('should delete banner and update group', async () => {
      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/banner`, {
        method: 'DELETE',
      });

      const response = await DELETE(request, { params: Promise.resolve(mockParams) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.updateGroup).toHaveBeenCalledWith({
        ...mockGroup,
        banner: null,
      });
      expect(body).toEqual(
        expect.objectContaining({
          id: testGroupId,
          banner: null,
        })
      );
    });

    it('should return 403 with banner-specific error message', async () => {
      mockDb.canUserManageGroup.mockResolvedValue(false);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/banner`, {
        method: 'DELETE',
      });

      const response = await DELETE(request, { params: Promise.resolve(mockParams) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({
        error: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can delete the group banner',
      });
    });
  });
});
