/**
 * API Route Tests: POST /api/invitations/validate
 *
 * Tests invitation code validation.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');

describe('POST /api/invitations/validate', () => {
  let POST: (request: Request) => Promise<Response>;
  let mockDb: any;
  let mockDbQuery: any;

  const invitationCode = '550e8400-e29b-41d4-a716-446655440000';
  const invitedEmail = 'invited@example.com';
  const inviterId = 'inviter-123';

  const mockInviter = {
    id: inviterId,
    email: 'inviter@example.com',
    name: 'Inviter User',
    nickname: 'Inviter',
  };

  const mockEmailBoundInvitation = {
    code: invitationCode,
    type: 'email_bound' as const,
    invitedEmail,
    expiresAt: new Date('2025-02-01T00:00:00.000Z'),
    createdBy: inviterId,
  };

  const mockOpenInvitation = {
    code: invitationCode,
    type: 'open' as const,
    invitedEmail: null,
    expiresAt: new Date('2025-01-02T00:00:00.000Z'),
    createdBy: inviterId,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const dbModule = await import('@/db');

    // Mock database functions
    mockDb = {
      findValidInvitation: vi.fn().mockResolvedValue(mockEmailBoundInvitation),
      db: {
        query: {
          users: {
            findFirst: vi.fn().mockResolvedValue(mockInviter),
          },
        },
      },
    };

    mockDbQuery = mockDb.db.query.users.findFirst;

    (dbModule.findValidInvitation as typeof mockDb.findValidInvitation) = mockDb.findValidInvitation;
    (dbModule as any).db = mockDb.db;

    const routeModule = await import('@/app/api/public/invitations/validate/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Validation', () => {
    it('should return 400 when code is missing', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invitation code is required');
    });

    it('should return 400 when code is not a valid UUID', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: 'invalid-uuid' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invalid invitation code');
    });

    it('should return 400 when email format is invalid', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: 'invalid-email' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Invalid email address');
    });
  });

  describe('Email-Bound Invitations', () => {
    it('should validate email-bound invitation with matching email', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.findValidInvitation).toHaveBeenCalledWith(invitationCode, invitedEmail);
      expect(mockDbQuery).toHaveBeenCalled();
      expect(body).toEqual({
        valid: true,
        type: 'email_bound',
        inviterName: 'Inviter (Inviter User)',
        expiresAt: '2025-02-01T00:00:00.000Z',
        invitedEmail,
      });
    });

    it('should return 400 when invitation not found', async () => {
      mockDb.findValidInvitation.mockResolvedValue(null);

      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid or expired invitation' });
    });

    it('should normalize email to lowercase before validation', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: 'INVITED@EXAMPLE.COM' }),
      });

      await POST(request);

      expect(mockDb.findValidInvitation).toHaveBeenCalledWith(invitationCode, 'invited@example.com');
    });

    it('should use nickname as inviterName when available', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.inviterName).toBe('Inviter (Inviter User)');
    });

    it('should handle inviter with only email', async () => {
      mockDbQuery.mockResolvedValue({
        id: inviterId,
        email: 'inviter@example.com',
        name: null,
        nickname: null,
      });

      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.inviterName).toBe('inviter@example.com');
    });
  });

  describe('Open Invitations', () => {
    beforeEach(() => {
      mockDb.findValidInvitation.mockResolvedValue(mockOpenInvitation);
    });

    it('should validate open invitation without email', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.findValidInvitation).toHaveBeenCalledWith(invitationCode, undefined);
      expect(body).toEqual({
        valid: true,
        type: 'open',
        inviterName: 'Inviter (Inviter User)',
        expiresAt: '2025-01-02T00:00:00.000Z',
      });
      expect(body.invitedEmail).toBeUndefined();
    });

    it('should validate open invitation with email parameter (ignored)', async () => {
      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: 'any@example.com' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.type).toBe('open');
      expect(body.invitedEmail).toBeUndefined();
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.findValidInvitation.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Failed to validate invitation');
    });

    it('should return 500 when inviter lookup fails', async () => {
      mockDbQuery.mockRejectedValue(new Error('User lookup error'));

      const request = new Request('http://localhost/api/invitations/validate', {
        method: 'POST',
        body: JSON.stringify({ code: invitationCode, email: invitedEmail }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body.error).toBe('Failed to validate invitation');
    });
  });
});
