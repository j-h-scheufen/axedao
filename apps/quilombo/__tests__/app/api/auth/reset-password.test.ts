/**
 * API Route Tests: POST /api/auth/reset-password
 *
 * Tests the password reset endpoint with mocked database and tokens.
 * Verifies validation, token validation, expiry checking, and password update workflow.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('@/utils/auth/password');
vi.mock('@/utils/auth/tokens');
vi.mock('@/utils/rate-limit');

describe('POST /api/auth/reset-password', () => {
  let POST: (request: Request) => Promise<Response>;
  let hashPassword: ReturnType<typeof vi.fn>;
  let hashToken: ReturnType<typeof vi.fn>;
  let rateLimit: ReturnType<typeof vi.fn>;
  let getClientIp: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testToken = 'reset-token-123';
  const newPassword = 'NewSecurePass123!@#';

  const validResetData = {
    token: testToken,
    newPassword,
  };

  const mockTokenRecord = {
    id: 'token-record-123',
    userId: 'user-123',
    tokenHash: 'hashed-token-123',
    type: 'password_reset' as const,
    expiresAt: new Date(Date.now() + 30 * 60 * 1000), // 30 min from now
    consumedAt: null,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const dbModule = await import('@/db');
    const passwordUtils = await import('@/utils/auth/password');
    const tokenUtils = await import('@/utils/auth/tokens');
    const rateLimitUtils = await import('@/utils/rate-limit');

    // Setup function mocks
    hashPassword = vi.fn();
    hashToken = vi.fn();
    rateLimit = vi.fn();
    getClientIp = vi.fn();

    (passwordUtils.hashPassword as typeof hashPassword) = hashPassword;
    (tokenUtils.hashToken as typeof hashToken) = hashToken;
    (rateLimitUtils.rateLimit as typeof rateLimit) = rateLimit;
    (rateLimitUtils.getClientIp as typeof getClientIp) = getClientIp;

    // Mock database
    const mockUpdateSet = vi.fn().mockResolvedValue(undefined);

    mockDb = {
      query: {
        verificationTokens: {
          findFirst: vi.fn().mockResolvedValue(mockTokenRecord),
        },
      },
      update: vi.fn().mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: mockUpdateSet,
        }),
      }),
    };

    (dbModule as any).db = mockDb;

    // Default mocks for successful flow
    getClientIp.mockReturnValue('127.0.0.1');
    rateLimit.mockReturnValue({ allowed: true });
    hashPassword.mockResolvedValue('hashed-new-password');
    hashToken.mockReturnValue('hashed-token-123');

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/auth/reset-password/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Rate Limiting', () => {
    it('should return 429 when rate limit is exceeded', async () => {
      rateLimit.mockReturnValue({
        allowed: false,
        retryAfter: 3600000, // 1 hour in ms
      });

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(429);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('Too many password reset attempts');
    });

    it('should apply rate limit per IP address', async () => {
      getClientIp.mockReturnValue('192.168.1.100');

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      await POST(request);

      expect(rateLimit).toHaveBeenCalledWith('192.168.1.100', {
        maxRequests: 5,
        windowMs: 60 * 60 * 1000,
      });
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when token is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: { newPassword },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Token is required' });
    });

    it('should return 400 when new password is too weak', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: { token: testToken, newPassword: 'weak' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Password must be at least 12 characters' });
    });
  });

  describe('Token Validation', () => {
    it('should return 400 when token not found', async () => {
      mockDb.query.verificationTokens.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid or expired reset link' });
    });

    it('should return 400 when token is expired', async () => {
      mockDb.query.verificationTokens.findFirst.mockResolvedValue({
        ...mockTokenRecord,
        expiresAt: new Date(Date.now() - 1000), // Expired 1 second ago
      });

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid or expired reset link' });
    });

    it('should hash token before querying database', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      await POST(request);

      expect(hashToken).toHaveBeenCalledWith(testToken);
    });
  });

  describe('Successful Password Reset', () => {
    it('should return 200 with success message', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Password updated successfully' });
    });

    it('should hash new password before storing', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      await POST(request);

      expect(hashPassword).toHaveBeenCalledWith(newPassword);
    });

    it('should update user password in database', async () => {
      const mockSet = vi.fn().mockReturnValue({
        where: vi.fn().mockResolvedValue(undefined),
      });
      mockDb.update.mockReturnValue({
        set: mockSet,
      });

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      await POST(request);

      expect(mockDb.update).toHaveBeenCalled();
      expect(mockSet).toHaveBeenCalledWith({ passwordHash: 'hashed-new-password' });
    });

    it('should mark token as consumed', async () => {
      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      await POST(request);

      // db.update called twice: once for user password, once for token consumed
      expect(mockDb.update).toHaveBeenCalledTimes(2);
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.query.verificationTokens.findFirst.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/auth/reset-password', {
        method: 'POST',
        body: validResetData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'An error occurred during password reset' });
    });
  });
});
