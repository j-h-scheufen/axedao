/**
 * API Route Tests: POST /api/auth/signup
 *
 * Tests the user signup endpoint with mocked database and authentication.
 * Verifies validation, invitation-only registration, email verification workflow, and rate limiting.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('@/utils/auth/password');
vi.mock('@/utils/auth/tokens');
vi.mock('@/utils/email');
vi.mock('@/utils/rate-limit');
vi.mock('uuid', () => ({
  v4: () => 'test-user-uuid-123',
}));

describe('POST /api/auth/signup', () => {
  let POST: (request: Request) => Promise<Response>;
  let findValidInvitation: ReturnType<typeof vi.fn>;
  let markInvitationAccepted: ReturnType<typeof vi.fn>;
  let hashPassword: ReturnType<typeof vi.fn>;
  let generateToken: ReturnType<typeof vi.fn>;
  let hashToken: ReturnType<typeof vi.fn>;
  let getEmailProvider: ReturnType<typeof vi.fn>;
  let rateLimit: ReturnType<typeof vi.fn>;
  let getClientIp: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testEmail = 'newuser@example.com';
  const testPassword = 'SecurePass123!@#';
  const testInvitationCode = '550e8400-e29b-41d4-a716-446655440000'; // Valid UUID format

  const validSignupData = {
    email: testEmail,
    password: testPassword,
    invitationCode: testInvitationCode,
  };

  const mockInvitation = {
    id: testInvitationCode,
    type: 'email_bound' as const,
    invitedEmail: testEmail,
    status: 'pending' as const,
    expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const dbModule = await import('@/db');
    const passwordUtils = await import('@/utils/auth/password');
    const tokenUtils = await import('@/utils/auth/tokens');
    const emailUtils = await import('@/utils/email');
    const rateLimitUtils = await import('@/utils/rate-limit');

    // Setup function mocks
    findValidInvitation = vi.fn();
    markInvitationAccepted = vi.fn();
    hashPassword = vi.fn();
    generateToken = vi.fn();
    hashToken = vi.fn();
    getEmailProvider = vi.fn();
    rateLimit = vi.fn();
    getClientIp = vi.fn();

    (dbModule.findValidInvitation as typeof findValidInvitation) = findValidInvitation;
    (dbModule.markInvitationAccepted as typeof markInvitationAccepted) = markInvitationAccepted;
    (passwordUtils.hashPassword as typeof hashPassword) = hashPassword;
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
    const mockInsertResult = {
      values: vi.fn().mockResolvedValue(undefined),
    };

    mockDb = {
      insert: vi.fn().mockReturnValue(mockInsertResult),
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(null), // Default: user doesn't exist
        },
      },
    };

    (dbModule as any).db = mockDb;

    // Default mocks for successful flow
    getClientIp.mockReturnValue('127.0.0.1');
    rateLimit.mockReturnValue({ allowed: true });
    findValidInvitation.mockResolvedValue(mockInvitation);
    hashPassword.mockResolvedValue('hashed-password');
    generateToken.mockReturnValue('verification-token-123');
    hashToken.mockReturnValue('hashed-token-123');
    markInvitationAccepted.mockResolvedValue(undefined);

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/auth/signup/route');
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

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(429);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('Too many signup attempts');
      expect(findValidInvitation).not.toHaveBeenCalled();
    });
  });

  describe('Input Validation', () => {
    it('should return 400 when email is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: { password: testPassword, invitationCode: testInvitationCode },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Email is required' });
    });

    it('should return 400 when email is invalid', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: { email: 'not-an-email', password: testPassword, invitationCode: testInvitationCode },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid email address' });
    });

    it('should return 400 when password is too short', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: { email: testEmail, password: 'Short1!', invitationCode: testInvitationCode },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Password must be at least 12 characters' });
    });

    it('should return 400 when password lacks required characters', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: { email: testEmail, password: 'NoSpecialChar123', invitationCode: testInvitationCode },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Password must contain at least one special character' });
    });
  });

  describe('Invitation Validation', () => {
    it('should return 400 when invitation code is missing', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: { email: testEmail, password: testPassword },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invitation code is required' });
    });

    it('should return 400 when invitation is invalid or expired', async () => {
      findValidInvitation.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({
        error: 'Invalid or expired invitation code. Please request a new invitation.',
      });
    });
  });

  describe('User Existence Check', () => {
    it('should return 400 when user already exists', async () => {
      mockDb.query.users.findFirst.mockResolvedValue({
        id: 'existing-user-id',
        email: testEmail,
      });

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({
        error:
          'Unable to create account. If you already have an account, please sign in or use the forgot password link.',
      });
    });
  });

  describe('Successful Signup', () => {
    it('should return 201 with success message', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(body).toEqual({
        message: 'Account created. Check your email to verify.',
      });
    });

    it('should hash password before storing', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      await POST(request);

      expect(hashPassword).toHaveBeenCalledWith(testPassword);
    });

    it('should send verification email', async () => {
      const mockEmailProvider = {
        sendVerificationEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      await POST(request);

      expect(mockEmailProvider.sendVerificationEmail).toHaveBeenCalledWith(
        testEmail.toLowerCase(),
        'verification-token-123'
      );
    });

    it('should mark email-bound invitation as accepted', async () => {
      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      await POST(request);

      expect(markInvitationAccepted).toHaveBeenCalledWith(testInvitationCode, 'test-user-uuid-123');
    });

    it('should NOT mark open invitation as accepted', async () => {
      findValidInvitation.mockResolvedValue({
        ...mockInvitation,
        type: 'open',
      });

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      await POST(request);

      expect(markInvitationAccepted).not.toHaveBeenCalled();
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database insertion fails', async () => {
      mockDb.insert.mockReturnValue({
        values: vi.fn().mockRejectedValue(new Error('Database error')),
      });

      const request = createMockRequest('http://localhost/api/auth/signup', {
        method: 'POST',
        body: validSignupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({
        error: 'An error occurred during signup',
      });
    });
  });
});
