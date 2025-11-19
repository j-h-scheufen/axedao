/**
 * API Route Tests: POST /api/auth/verify-email
 *
 * Tests the email verification endpoint with mocked database and email.
 * Verifies token validation, expiry checking, account activation, and welcome email workflow.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('@/utils/auth/tokens');
vi.mock('@/utils/email');

describe('POST /api/auth/verify-email', () => {
  let POST: (request: Request) => Promise<Response>;
  let hashToken: ReturnType<typeof vi.fn>;
  let getEmailProvider: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testToken = 'verification-token-123';
  const testUserId = 'user-123';
  const testEmail = 'user@example.com';

  const mockTokenRecord = {
    id: 'token-record-123',
    userId: testUserId,
    tokenHash: 'hashed-token-123',
    type: 'email_verification' as const,
    expiresAt: new Date(Date.now() + 30 * 60 * 1000), // 30 min from now
    consumedAt: null,
  };

  const mockUser = {
    id: testUserId,
    email: testEmail,
    accountStatus: 'pending_verification',
    emailVerifiedAt: null,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const dbModule = await import('@/db');
    const tokenUtils = await import('@/utils/auth/tokens');
    const emailUtils = await import('@/utils/email');

    // Setup function mocks
    hashToken = vi.fn();
    getEmailProvider = vi.fn();

    (tokenUtils.hashToken as typeof hashToken) = hashToken;

    // Mock email provider
    const mockEmailProvider = {
      sendWelcomeEmail: vi.fn().mockResolvedValue(undefined),
    };
    getEmailProvider.mockReturnValue(mockEmailProvider);
    (emailUtils.getEmailProvider as typeof getEmailProvider) = getEmailProvider;

    // Mock database
    const mockUpdateResult = vi.fn().mockResolvedValue(undefined);

    mockDb = {
      query: {
        verificationTokens: {
          findFirst: vi.fn().mockResolvedValue(mockTokenRecord),
        },
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

    // Default mocks for successful flow
    hashToken.mockReturnValue('hashed-token-123');

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/auth/verify-email/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Input Validation', () => {
    it('should return 400 when token is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Token is required' });
    });
  });

  describe('Token Validation', () => {
    it('should hash token before querying database', async () => {
      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      await POST(request);

      expect(hashToken).toHaveBeenCalledWith(testToken);
    });

    it('should return 400 when token not found', async () => {
      mockDb.query.verificationTokens.findFirst.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid or expired verification link' });
    });

    it('should return 400 when token is expired', async () => {
      mockDb.query.verificationTokens.findFirst.mockResolvedValue({
        ...mockTokenRecord,
        expiresAt: new Date(Date.now() - 1000), // Expired 1 second ago
      });

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid or expired verification link' });
    });

    it('should return 410 when token was already consumed', async () => {
      mockDb.query.verificationTokens.findFirst.mockResolvedValue({
        ...mockTokenRecord,
        consumedAt: new Date(Date.now() - 1000), // Already consumed
      });

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(410);
      expect(body).toEqual({ error: 'This verification link has already been used' });
    });
  });

  describe('Successful Email Verification', () => {
    it('should return 200 with success message', async () => {
      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        message: 'Email verified successfully',
        userId: testUserId,
      });
    });

    it('should update user account status to active', async () => {
      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      await POST(request);

      expect(mockDb.update).toHaveBeenCalled();
      const setCall = mockDb.update.mock.results[0].value.set;
      expect(setCall).toHaveBeenCalledWith({
        accountStatus: 'active',
        emailVerifiedAt: expect.any(Date),
      });
    });

    it('should mark token as consumed', async () => {
      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      await POST(request);

      // db.update called twice: once for user, once for token
      expect(mockDb.update).toHaveBeenCalledTimes(2);
    });

    it('should send welcome email', async () => {
      const mockEmailProvider = {
        sendWelcomeEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      await POST(request);

      expect(mockEmailProvider.sendWelcomeEmail).toHaveBeenCalledWith(testEmail);
    });

    it('should still succeed when welcome email fails', async () => {
      const mockEmailProvider = {
        sendWelcomeEmail: vi.fn().mockRejectedValue(new Error('Email service down')),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(mockEmailProvider.sendWelcomeEmail).toHaveBeenCalled();
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.query.verificationTokens.findFirst.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/auth/verify-email', {
        method: 'POST',
        body: { token: testToken },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'An error occurred during email verification' });
    });
  });
});
