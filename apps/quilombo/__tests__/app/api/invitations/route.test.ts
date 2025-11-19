/**
 * API Route Tests: POST /api/invitations
 *
 * Tests invitation creation for email-bound and open invitations.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/email');
vi.mock('@/config/environment', async () => {
  const actual = await vi.importActual('@/config/environment');
  return {
    ...actual,
    getBaseUrl: vi.fn(() => 'https://test.com'),
  };
});

describe('POST /api/invitations', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;
  let mockEmail: any;

  const testUserId = 'user-123';
  const testEmail = 'user@example.com';
  const invitedEmail = 'invited@example.com';
  const invitationCode = '550e8400-e29b-41d4-a716-446655440000';

  const mockInviter = {
    id: testUserId,
    email: testEmail,
    name: 'Test User',
  };

  const mockEmailBoundInvitation = {
    code: invitationCode,
    type: 'email_bound' as const,
    invitedEmail,
    expiresAt: new Date('2025-02-01T00:00:00.000Z'),
  };

  const mockOpenInvitation = {
    code: invitationCode,
    type: 'open' as const,
    invitedEmail: null,
    expiresAt: new Date('2025-01-02T00:00:00.000Z'),
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');
    const emailModule = await import('@/utils/email');

    getServerSession = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

    // Mock database functions
    mockDb = {
      createInvitation: vi.fn().mockResolvedValue(mockEmailBoundInvitation),
      fetchUser: vi.fn().mockResolvedValue(mockInviter),
    };

    (dbModule.createInvitation as typeof mockDb.createInvitation) = mockDb.createInvitation;
    (dbModule.fetchUser as typeof mockDb.fetchUser) = mockDb.fetchUser;

    // Mock email functions
    mockEmail = {
      sendInvitationEmail: vi.fn().mockResolvedValue(undefined),
    };

    (emailModule.sendInvitationEmail as typeof mockEmail.sendInvitationEmail) = mockEmail.sendInvitationEmail;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: testEmail },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/invitations/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail }),
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

      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Validation', () => {
    it('should return 400 when type is missing', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invitation type is required');
    });

    it('should return 400 when type is invalid', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'invalid_type' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invalid invitation type');
    });

    it('should return 400 when email_bound type missing invitedEmail', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Email is required for email-bound invitations');
    });

    it('should return 400 when invitedEmail is invalid', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail: 'invalid-email' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invalid email address');
    });
  });

  describe('Email-Bound Invitations', () => {
    it('should create email-bound invitation without sending email', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(mockDb.createInvitation).toHaveBeenCalledWith(testUserId, 'email_bound', invitedEmail);
      expect(mockEmail.sendInvitationEmail).not.toHaveBeenCalled();
      expect(body).toEqual({
        code: invitationCode,
        type: 'email_bound',
        invitedEmail,
        expiresAt: '2025-02-01T00:00:00.000Z',
        inviteLink: `https://test.com/auth/signup?code=${invitationCode}&email=${encodeURIComponent(invitedEmail)}`,
      });
    });

    it('should create email-bound invitation and send email when requested', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail, sendEmail: true }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(mockDb.fetchUser).toHaveBeenCalledWith(testUserId);
      expect(mockEmail.sendInvitationEmail).toHaveBeenCalledWith(
        invitedEmail,
        invitationCode,
        'Test User' // getUserDisplayName returns just name when no nickname
      );
      expect(body.code).toBe(invitationCode);
    });

    it('should succeed even if email sending fails', async () => {
      mockEmail.sendInvitationEmail.mockRejectedValue(new Error('Email service error'));

      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail, sendEmail: true }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(body.code).toBe(invitationCode);
    });

    it('should normalize email to lowercase', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail: 'INVITED@EXAMPLE.COM' }),
      });

      await POST(request);

      expect(mockDb.createInvitation).toHaveBeenCalledWith(testUserId, 'email_bound', 'invited@example.com');
    });
  });

  describe('Open Invitations', () => {
    beforeEach(() => {
      mockDb.createInvitation.mockResolvedValue(mockOpenInvitation);
    });

    it('should create open invitation', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'open' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(mockDb.createInvitation).toHaveBeenCalledWith(testUserId, 'open', undefined);
      expect(body).toEqual({
        code: invitationCode,
        type: 'open',
        expiresAt: '2025-01-02T00:00:00.000Z',
        inviteLink: `https://test.com/auth/signup?code=${invitationCode}`,
      });
    });

    it('should ignore invitedEmail for open type', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'open', invitedEmail: 'ignored@example.com' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(201);
      expect(body.invitedEmail).toBeUndefined();
      expect(body.inviteLink).not.toContain('email=');
    });

    it('should ignore sendEmail for open type', async () => {
      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'open', sendEmail: true }),
      });

      await POST(request);

      expect(mockEmail.sendInvitationEmail).not.toHaveBeenCalled();
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.createInvitation.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/invitations', {
        method: 'POST',
        body: JSON.stringify({ type: 'email_bound', invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Failed to create invitation');
    });
  });
});
