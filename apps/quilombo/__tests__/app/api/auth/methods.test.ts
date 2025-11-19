/**
 * API Route Tests: GET /api/auth/methods
 *
 * Tests retrieving user's configured authentication methods.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('GET /api/auth/methods', () => {
  let GET: () => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';
  const testEmail = 'user@example.com';

  const mockUserWithAllMethods = {
    id: testUserId,
    email: testEmail,
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
    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUserWithAllMethods),
        },
        oauthAccounts: {
          findFirst: vi.fn().mockResolvedValue(mockGoogleAccount),
        },
      },
    };

    (dbModule as any).db = mockDb;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: testEmail },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/auth/methods/route');
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
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('User Validation', () => {
    it('should return 404 when user not found', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User not found' });
    });
  });

  describe('Auth Methods Response', () => {
    it('should return all auth methods when user has all methods', async () => {
      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        notificationEmail: testEmail,
        hasPassword: true,
        hasGoogle: true,
        hasWallet: true,
        googleEmail: 'user@gmail.com',
        walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
        userEmail: testEmail,
      });
    });

    it('should return false for methods user does not have', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        id: testUserId,
        email: testEmail,
        passwordHash: 'hashed-password',
        walletAddress: null, // No wallet
      });
      mockDb.query.oauthAccounts.findFirst.mockResolvedValue(null); // No Google

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        notificationEmail: testEmail,
        hasPassword: true,
        hasGoogle: false,
        hasWallet: false,
        googleEmail: undefined,
        walletAddress: undefined,
        userEmail: testEmail,
      });
    });

    it('should use user email as notification email when available', async () => {
      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual(
        expect.objectContaining({
          notificationEmail: testEmail,
        })
      );
    });

    it('should fallback to Google email when user email is null', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        email: null,
      });

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual(
        expect.objectContaining({
          notificationEmail: 'user@gmail.com',
        })
      );
    });

    it('should return null notification email when no email available', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUserWithAllMethods,
        email: null,
      });
      mockDb.query.oauthAccounts.findFirst.mockResolvedValue(null);

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual(
        expect.objectContaining({
          notificationEmail: null,
        })
      );
    });

    it('should return undefined for optional fields when not present', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        id: testUserId,
        email: testEmail,
        passwordHash: null,
        walletAddress: null,
      });
      mockDb.query.oauthAccounts.findFirst.mockResolvedValue(null);

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        notificationEmail: testEmail,
        hasPassword: false,
        hasGoogle: false,
        hasWallet: false,
        googleEmail: undefined,
        walletAddress: undefined,
        userEmail: testEmail,
      });
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.query.users.findFirst.mockRejectedValue(new Error('Database error'));

      const response = await GET();
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Failed to fetch authentication methods' });
    });
  });
});
