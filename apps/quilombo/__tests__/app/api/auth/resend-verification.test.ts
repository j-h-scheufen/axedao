/**
 * API Route Tests: POST /api/auth/resend-verification
 *
 * Tests the resend verification email endpoint with mocked database and email.
 * Verifies rate limiting, validation, user enumeration prevention, and token workflow.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('@/utils/auth/tokens');
vi.mock('@/utils/email');
vi.mock('@/utils/rate-limit');

describe('POST /api/auth/resend-verification', () => {
  let POST: (request: Request) => Promise<Response>;
  let generateToken: ReturnType<typeof vi.fn>;
  let hashToken: ReturnType<typeof vi.fn>;
  let getEmailProvider: ReturnType<typeof vi.fn>;
  let rateLimit: ReturnType<typeof vi.fn>;
  let getClientIp: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testEmail = 'user@example.com';

  const mockUser = {
    id: 'test-user-123',
    email: testEmail,
    name: 'Test User',
    emailVerifiedAt: null,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const dbModule = await import('@/db');
    const tokenUtils = await import('@/utils/auth/tokens');
    const emailUtils = await import('@/utils/email');
    const rateLimitUtils = await import('@/utils/rate-limit');

    // Setup function mocks
    generateToken = vi.fn();
    hashToken = vi.fn();
    getEmailProvider = vi.fn();
    rateLimit = vi.fn();
    getClientIp = vi.fn();

    (tokenUtils.generateToken as typeof generateToken) = generateToken;
    (tokenUtils.hashToken as typeof hashToken) = hashToken;
    (rateLimitUtils.rateLimit as typeof rateLimit) = rateLimit;
    (rateLimitUtils.getClientIp as typeof getClientIp) = getClientIp;

    // Mock email provider
    const mockEmailProvider = {
      sendVerificationEmail: vi.fn().mockResolvedValue(undefined),
    };
    getEmailProvider.mockReturnValue(mockEmailProvider);
    (emailUtils.getEmailProvider as typeof getEmailProvider) = getEmailProvider;

    // Mock database
    const mockDeleteResult = vi.fn().mockResolvedValue(undefined);
    const mockInsertValues = vi.fn().mockResolvedValue(undefined);

    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUser),
        },
      },
      delete: vi.fn().mockReturnValue({
        where: mockDeleteResult,
      }),
      insert: vi.fn().mockReturnValue({
        values: mockInsertValues,
      }),
    };

    (dbModule as any).db = mockDb;

    // Default mocks for successful flow
    getClientIp.mockReturnValue('127.0.0.1');
    rateLimit.mockReturnValue({ allowed: true });
    generateToken.mockReturnValue('verification-token-123');
    hashToken.mockReturnValue('hashed-token-123');

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/auth/resend-verification/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Rate Limiting', () => {
    it('should return 429 when rate limit is exceeded', async () => {
      rateLimit.mockReturnValue({
        allowed: false,
        retryAfter: 900000, // 15 minutes in ms
      });

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(429);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('Too many verification email requests');
      expect((body as { error: string }).error).toContain('15 minutes');
    });

    it('should apply rate limit per IP address', async () => {
      getClientIp.mockReturnValue('192.168.1.100');

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(rateLimit).toHaveBeenCalledWith('192.168.1.100', {
        maxRequests: 3,
        windowMs: 15 * 60 * 1000,
      });
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when email is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: {},
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should return 400 when email is invalid', async () => {
      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: 'not-an-email' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });
  });

  describe('Security - No User Enumeration', () => {
    it('should not send email when user does not exist', async () => {
      mockDb.query.users.findFirst.mockResolvedValue(null);
      const mockEmailProvider = {
        sendVerificationEmail: vi.fn(),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: 'nonexistent@example.com' },
      });

      await POST(request);

      expect(mockEmailProvider.sendVerificationEmail).not.toHaveBeenCalled();
    });

    it('should not send email when user is already verified', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUser,
        emailVerifiedAt: new Date(),
      });
      const mockEmailProvider = {
        sendVerificationEmail: vi.fn(),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(mockEmailProvider.sendVerificationEmail).not.toHaveBeenCalled();
    });
  });

  describe('Successful Resend Flow', () => {
    it('should delete existing unconsumed verification tokens', async () => {
      const mockWhere = vi.fn().mockResolvedValue(undefined);
      mockDb.delete.mockReturnValue({
        where: mockWhere,
      });

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(mockDb.delete).toHaveBeenCalled();
      expect(mockWhere).toHaveBeenCalled();
    });

    it('should generate and store new verification token', async () => {
      const mockValues = vi.fn().mockResolvedValue(undefined);
      mockDb.insert.mockReturnValue({
        values: mockValues,
      });

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(generateToken).toHaveBeenCalled();
      expect(hashToken).toHaveBeenCalledWith('verification-token-123');
      expect(mockDb.insert).toHaveBeenCalled();
      expect(mockValues).toHaveBeenCalledWith(
        expect.objectContaining({
          userId: 'test-user-123',
          tokenHash: 'hashed-token-123',
          type: 'email_verification',
          expiresAt: expect.any(Date),
        })
      );
    });

    it('should send verification email with token', async () => {
      const mockEmailProvider = {
        sendVerificationEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(mockEmailProvider.sendVerificationEmail).toHaveBeenCalledWith(
        testEmail.toLowerCase(),
        'verification-token-123',
        'Test User'
      );
    });

    it('should handle users without name in email', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        ...mockUser,
        name: null,
      });

      const mockEmailProvider = {
        sendVerificationEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      await POST(request);

      expect(mockEmailProvider.sendVerificationEmail).toHaveBeenCalledWith(
        testEmail.toLowerCase(),
        'verification-token-123',
        undefined
      );
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.query.users.findFirst.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/auth/resend-verification', {
        method: 'POST',
        body: { email: testEmail },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'An error occurred' });
    });
  });
});
