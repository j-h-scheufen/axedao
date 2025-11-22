/**
 * API Route Tests: GET /api/users/[userId]
 *
 * Tests retrieving a user by ID.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('next/navigation', () => ({
  notFound: vi.fn(() => {
    throw new Error('NEXT_NOT_FOUND');
  }),
}));

describe('GET /api/users/[userId]', () => {
  let GET: (request: Request, context: { params: Promise<{ userId: string }> }) => Promise<Response>;
  let mockDb: any;
  let notFound: ReturnType<typeof vi.fn>;

  const testUserId = 'user-123';

  const mockUser = {
    id: testUserId,
    email: 'user@example.com',
    name: 'Test User',
    nickname: 'TestNick',
    avatar: 'https://example.com/avatar.png',
    walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const dbModule = await import('@/db');
    const navModule = await import('next/navigation');

    // Mock database functions
    mockDb = {
      fetchPublicUser: vi.fn().mockResolvedValue(mockUser),
    };

    (dbModule.fetchPublicUser as typeof mockDb.fetchPublicUser) = mockDb.fetchPublicUser;

    notFound = vi.fn(() => {
      throw new Error('NEXT_NOT_FOUND');
    });
    (navModule.notFound as typeof notFound) = notFound;

    const routeModule = await import('@/app/api/users/[userId]/route');
    GET = routeModule.GET;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Successful Retrieval', () => {
    it('should return user when found', async () => {
      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.fetchPublicUser).toHaveBeenCalledWith(testUserId);
      expect(body).toEqual(
        expect.objectContaining({
          id: testUserId,
          email: 'user@example.com',
          name: 'Test User',
          nickname: 'TestNick',
        })
      );
    });

    it('should handle different user IDs', async () => {
      const differentUserId = 'user-456';
      mockDb.fetchPublicUser.mockResolvedValue({ ...mockUser, id: differentUserId });

      const request = new Request(`http://localhost/api/users/${differentUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: differentUserId }) });

      expect(mockDb.fetchPublicUser).toHaveBeenCalledWith(differentUserId);
      expect(response.status).toBe(200);
    });

    it('should return user with all fields', async () => {
      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(body).toHaveProperty('id');
      expect(body).toHaveProperty('email');
      expect(body).toHaveProperty('name');
      expect(body).toHaveProperty('nickname');
      expect(body).toHaveProperty('avatar');
      expect(body).toHaveProperty('walletAddress');
    });
  });

  describe('Not Found', () => {
    it('should call notFound when user not found', async () => {
      mockDb.fetchPublicUser.mockResolvedValue(null);

      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      // notFound() throws but gets caught by try-catch, resulting in 500
      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(mockDb.fetchPublicUser).toHaveBeenCalledWith(testUserId);
      expect(notFound).toHaveBeenCalled();
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message', 'NEXT_NOT_FOUND');
    });

    it('should call notFound for non-existent user', async () => {
      mockDb.fetchPublicUser.mockResolvedValue(null);

      const request = new Request('http://localhost/api/users/non-existent', {
        method: 'GET',
      });

      // notFound() throws but gets caught by try-catch, resulting in 500
      const response = await GET(request, { params: Promise.resolve({ userId: 'non-existent' }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(notFound).toHaveBeenCalled();
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message', 'NEXT_NOT_FOUND');
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.fetchPublicUser.mockRejectedValue(new Error('Database connection failed'));

      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect(body.message).toBe('Database connection failed');
    });

    it('should include error details in response', async () => {
      mockDb.fetchPublicUser.mockRejectedValue(new Error('Connection timeout'));

      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(body.error).toBe(true);
      expect(body.message).toBe('Connection timeout');
    });
  });

  describe('Email Privacy', () => {
    it('should return user with email when hideEmail is false', async () => {
      const userWithVisibleEmail = {
        ...mockUser,
        hideEmail: false,
        email: 'visible@example.com',
      };
      mockDb.fetchPublicUser.mockResolvedValue(userWithVisibleEmail);

      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.email).toBe('visible@example.com');
      expect(body.hideEmail).toBe(false);
    });

    it('should return user with null email when hideEmail is true', async () => {
      const userWithHiddenEmail = {
        ...mockUser,
        hideEmail: true,
        email: null, // Privacy filter sets to null
      };
      mockDb.fetchPublicUser.mockResolvedValue(userWithHiddenEmail);

      const request = new Request(`http://localhost/api/users/${testUserId}`, {
        method: 'GET',
      });

      const response = await GET(request, { params: Promise.resolve({ userId: testUserId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.email).toBeNull();
      expect(body.hideEmail).toBe(true);
    });
  });
});
