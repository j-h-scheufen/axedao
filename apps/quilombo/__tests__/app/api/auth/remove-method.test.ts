/**
 * API Route Tests: POST /api/auth/remove-method
 *
 * Tests removing authentication methods from user account.
 * Ensures users always have at least one auth method remaining.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/auth/remove-method', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';

  const mockUserWithAllMethods = {
    id: testUserId,
    email: 'user@example.com',
    passwordHash: 'hashed-password',
    walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
  };

  const mockGoogleAccount = {
    userId: testUserId,
    provider: 'google',
    providerUserId: 'google-123',
    providerEmail: 'user@gmail.com',
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');

    getServerSession = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

    // Mock database
    const mockUpdateResult = vi.fn().mockResolvedValue(undefined);
    const mockDeleteResult = vi.fn().mockResolvedValue(undefined);

    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUserWithAllMethods),
        },
        oauthAccounts: {
          findFirst: vi.fn().mockResolvedValue(mockGoogleAccount),
        },
      },
      update: vi.fn().mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: mockUpdateResult,
        }),
      }),
      delete: vi.fn().mockReturnValue({
        where: mockDeleteResult,
      }),
    };

    (dbModule as any).db = mockDb;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/auth/remove-method/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when method is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should return 400 when method is invalid', async () => {
      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'invalid-method' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });
  });

  describe('User Validation', () => {
    it('should return 404 when user not found', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User not found' });
    });
  });

  describe('Last Auth Method Protection', () => {
    it('should return 400 when trying to remove last auth method', async () => {
      // User with only password
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        walletAddress: null,
      });
      mockDb.query.oauthAccounts.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({
        error: 'Cannot remove your only authentication method. Add another method first.',
      });
    });

    it('should allow removing method when user has 2+ methods', async () => {
      // User with password + google (2 methods)
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        walletAddress: null, // No wallet
      });

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
    });
  });

  describe('Remove Password Method', () => {
    it('should return 404 when password method not found', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        passwordHash: null,
      });

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Password authentication not found' });
    });

    it('should successfully remove password method', async () => {
      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Authentication method removed successfully' });
      expect(mockDb.update).toHaveBeenCalled();
      const setCall = mockDb.update.mock.results[0].value.set;
      expect(setCall).toHaveBeenCalledWith({ passwordHash: null });
    });
  });

  describe('Remove Google Method', () => {
    it('should return 404 when Google method not found', async () => {
      mockDb.query.oauthAccounts.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'google' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Google authentication not found' });
    });

    it('should successfully remove Google method', async () => {
      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'google' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Authentication method removed successfully' });
      expect(mockDb.delete).toHaveBeenCalled();
    });
  });

  describe('Remove Wallet Method', () => {
    it('should return 404 when wallet method not found', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        walletAddress: null,
      });

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'wallet' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Wallet authentication not found' });
    });

    it('should successfully remove wallet method', async () => {
      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'wallet' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Authentication method removed successfully' });
      expect(mockDb.update).toHaveBeenCalled();
      const setCall = mockDb.update.mock.results[0].value.set;
      expect(setCall).toHaveBeenCalledWith({ walletAddress: null });
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.query.users.findFirst.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/auth/remove-method', {
        method: 'POST',
        body: { method: 'password' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({
        error: 'An error occurred while removing authentication method',
      });
    });
  });
});
