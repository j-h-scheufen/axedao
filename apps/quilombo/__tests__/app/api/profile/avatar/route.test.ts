/**
 * API Route Tests: POST/DELETE /api/profile/avatar
 *
 * Tests avatar upload to IPFS and deletion.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handlers
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(),
}));
vi.mock('@/utils/pinata', () => ({
  pinToGroup: vi.fn(),
  unpin: vi.fn(),
}));
vi.mock('@/utils/images', () => ({
  createImageBuffer: vi.fn(),
}));

describe('Avatar API Routes', () => {
  const testUserId = 'user-123';

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

  describe('POST /api/profile/avatar', () => {
    let POST: (request: Request) => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;
    let mockImages: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const navigationModule = await import('next/navigation');
      const pinataModule = await import('@/utils/pinata');
      const imagesModule = await import('@/utils/images');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      notFound = vi.fn();
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchUser: vi.fn().mockResolvedValue(mockUser),
        updateUser: vi.fn().mockResolvedValue({ ...mockUser, avatar: 'cid123' }),
      };

      (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;
      (dbModule.updateUser as typeof mockDb.updateUser) = mockDb.updateUser;

      // Mock IPFS/Pinata functions
      mockPinata = {
        pinToGroup: vi.fn().mockResolvedValue({ cid: 'cid123', error: null, errorStatus: null }),
      };

      (pinataModule.pinToGroup as typeof mockPinata.pinToGroup) = mockPinata.pinToGroup;

      // Mock image processing
      mockImages = {
        createImageBuffer: vi.fn().mockResolvedValue(Buffer.from('fake-image-data')),
      };

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

      const routeModule = await import('@/app/api/profile/avatar/route');
      POST = routeModule.POST;
    });

    afterEach(() => {
      vi.clearAllMocks();
    });

    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
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
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      });
    });

    describe('File Validation', () => {
      it('should return 400 when no file provided', async () => {
        const formData = new FormData();

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid input data. No file found.' });
      });
    });

    describe('User Not Found', () => {
      it('should return 500 when user does not exist (notFound caught by try-catch)', async () => {
        mockDb.fetchUser.mockResolvedValue(null);

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
        expect(notFound).toHaveBeenCalled();
      });
    });

    describe('Successful Upload', () => {
      it('should upload avatar and return updated user', async () => {
        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockImages.createImageBuffer).toHaveBeenCalled();
        expect(mockPinata.pinToGroup).toHaveBeenCalledWith(
          Buffer.from('fake-image-data'),
          'user-avatar-user-123',
          null
        );
        expect(mockDb.updateUser).toHaveBeenCalledWith(
          expect.objectContaining({
            id: testUserId,
            avatar: 'cid123',
          })
        );
        expect(body.avatar).toBe('cid123');
      });

      it('should replace existing avatar when user already has one', async () => {
        const userWithAvatar = { ...mockUser, avatar: 'old-cid' };
        mockDb.fetchUser.mockResolvedValue(userWithAvatar);

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);

        expect(response.status).toBe(200);
        expect(mockPinata.pinToGroup).toHaveBeenCalledWith(
          Buffer.from('fake-image-data'),
          'user-avatar-user-123',
          'old-cid'
        );
      });

      it('should process image buffer before uploading', async () => {
        const formData = new FormData();
        const testFile = new File(['test'], 'test.jpg', { type: 'image/jpeg' });
        formData.append('file', testFile);

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        await POST(request);

        expect(mockImages.createImageBuffer).toHaveBeenCalledWith(expect.any(File), 'userAvatar');
      });
    });

    describe('Error Handling', () => {
      it('should return error status when pinToGroup fails', async () => {
        mockPinata.pinToGroup.mockResolvedValue({
          cid: null,
          error: 'Failed to pin to IPFS',
          errorStatus: 503,
        });

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(503);
        expect(body).toEqual({ error: 'Failed to pin to IPFS' });
        expect(mockDb.updateUser).not.toHaveBeenCalled();
      });

      it('should return 500 when pinToGroup fails without status', async () => {
        mockPinata.pinToGroup.mockResolvedValue({
          cid: null,
          error: 'Unknown IPFS error',
          errorStatus: null,
        });

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Unknown IPFS error' });
      });

      it('should return 500 when image processing throws error', async () => {
        mockImages.createImageBuffer.mockRejectedValue(new Error('Invalid image format'));

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
          method: 'POST',
          body: formData,
        });

        const response = await POST(request);
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });

      it('should return 500 when database throws error', async () => {
        mockDb.updateUser.mockRejectedValue(new Error('Database error'));

        const formData = new FormData();
        formData.append('file', new File(['test'], 'test.jpg', { type: 'image/jpeg' }));

        const request = new Request('http://localhost/api/profile/avatar', {
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

  describe('DELETE /api/profile/avatar', () => {
    let DELETE: () => Promise<Response>;
    let getServerSession: ReturnType<typeof vi.fn>;
    let notFound: ReturnType<typeof vi.fn>;
    let mockDb: any;
    let mockPinata: any;

    beforeEach(async () => {
      vi.resetModules();
      vi.clearAllMocks();

      const nextAuth = await import('next-auth');
      const dbModule = await import('@/db');
      const navigationModule = await import('next/navigation');
      const pinataModule = await import('@/utils/pinata');

      getServerSession = vi.fn();
      (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

      notFound = vi.fn();
      (navigationModule.notFound as typeof notFound) = notFound;

      // Mock database functions
      mockDb = {
        fetchUser: vi.fn().mockResolvedValue({ ...mockUser, avatar: 'cid123' }),
        updateUser: vi.fn().mockResolvedValue({ ...mockUser, avatar: null }),
      };

      (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;
      (dbModule.updateUser as typeof mockDb.updateUser) = mockDb.updateUser;

      // Mock IPFS/Pinata functions
      mockPinata = {
        unpin: vi.fn().mockResolvedValue(undefined),
      };

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

      const routeModule = await import('@/app/api/profile/avatar/route');
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

    describe('User Not Found', () => {
      it('should return 500 when user does not exist (notFound caught by try-catch)', async () => {
        mockDb.fetchUser.mockResolvedValue(null);

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
        expect(notFound).toHaveBeenCalled();
      });
    });

    describe('Successful Deletion', () => {
      it('should delete avatar and unpin from IPFS', async () => {
        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockPinata.unpin).toHaveBeenCalledWith('cid123');
        expect(mockDb.updateUser).toHaveBeenCalledWith(
          expect.objectContaining({
            id: testUserId,
            avatar: null,
          })
        );
        expect(body.avatar).toBeNull();
      });

      it('should return user without updating when no avatar exists', async () => {
        mockDb.fetchUser.mockResolvedValue(mockUser); // No avatar

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(mockPinata.unpin).not.toHaveBeenCalled();
        expect(mockDb.updateUser).not.toHaveBeenCalled();
        expect(body.avatar).toBeNull();
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when unpin throws error', async () => {
        mockPinata.unpin.mockRejectedValue(new Error('IPFS error'));

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });

      it('should return 500 when database throws error', async () => {
        mockDb.updateUser.mockRejectedValue(new Error('Database error'));

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toHaveProperty('error', true);
        expect(body).toHaveProperty('message');
      });
    });
  });
});
