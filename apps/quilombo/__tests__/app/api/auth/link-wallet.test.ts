/**
 * API Route Tests: POST /api/auth/link-wallet
 *
 * Tests linking wallet address to authenticated user account.
 * Verifies authentication, validation, duplicate checking, and wallet linking workflow.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/auth/link-wallet', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';
  const testWalletAddress = '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC';

  const mockUser = {
    id: testUserId,
    email: 'user@example.com',
    walletAddress: null,
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

    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUser),
        },
      },
      update: vi.fn().mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: mockUpdateResult,
        }),
      }),
    };

    (dbModule as any).db = mockDb;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: 'user@example.com' },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/auth/link-wallet/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when walletAddress is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should return 400 when walletAddress is invalid format', async () => {
      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: 'not-a-valid-address' },
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

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User not found' });
    });

    it('should return 400 when wallet already linked to this account', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUser,
        walletAddress: testWalletAddress,
      });

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Wallet already linked to your account' });
    });
  });

  describe('Successful Wallet Linking', () => {
    it('should return 200 with success message', async () => {
      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Wallet linked successfully' });
    });

    it('should update user with wallet address', async () => {
      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      await POST(request);

      expect(mockDb.update).toHaveBeenCalled();
      const setCall = mockDb.update.mock.results[0].value.set;
      expect(setCall).toHaveBeenCalledWith({ walletAddress: testWalletAddress });
    });

    it('should allow linking wallet to different account (no SIWE)', async () => {
      // Note: Route allows same wallet on multiple accounts because
      // real authentication requires SIWE signature, not just connection

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      // No check for duplicate wallet across users
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.update.mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: vi.fn().mockRejectedValue(new Error('Database error')),
        }),
      });

      const request = createMockRequest('http://localhost/api/auth/link-wallet', {
        method: 'POST',
        body: { walletAddress: testWalletAddress },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'An error occurred while linking wallet' });
    });
  });
});
