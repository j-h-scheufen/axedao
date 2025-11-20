/**
 * API Route Tests: /api/auth/oauth-link (GET, POST, DELETE)
 *
 * Tests OAuth account linking workflow with email update confirmation.
 * GET: Retrieve pending link data from cookie
 * POST: Confirm and complete linking
 * DELETE: Cancel pending link
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('next/headers', () => ({
  cookies: vi.fn(),
}));

describe('/api/auth/oauth-link', () => {
  let GET: () => Promise<Response>;
  let POST: () => Promise<Response>;
  let DELETE: () => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let cookies: ReturnType<typeof vi.fn>;
  let mockDb: any;
  let mockCookieStore: any;

  const testUserId = 'user-123';
  const currentEmail = 'current@example.com';
  const newEmail = 'new@example.com';
  const providerUserId = 'google-123';

  const mockPendingLinkData = {
    providerUserId,
    email: newEmail,
    providerEmail: newEmail,
    currentEmail,
    provider: 'google',
  };

  const mockUser = {
    id: testUserId,
    email: currentEmail,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');
    const headersModule = await import('next/headers');

    getServerSession = vi.fn();
    cookies = vi.fn();

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (headersModule.cookies as typeof cookies) = cookies;

    // Mock cookie store
    mockCookieStore = {
      get: vi.fn(),
      delete: vi.fn(),
    };
    cookies.mockResolvedValue(mockCookieStore);

    // Mock database
    const mockInsertValues = vi.fn().mockResolvedValue(undefined);
    const mockUpdateResult = vi.fn().mockResolvedValue(undefined);

    mockDb = {
      query: {
        users: {
          findFirst: vi.fn().mockResolvedValue(mockUser),
        },
        oauthAccounts: {
          findFirst: vi.fn().mockResolvedValue(null), // No existing link by default
        },
      },
      insert: vi.fn().mockReturnValue({
        values: mockInsertValues,
      }),
      update: vi.fn().mockReturnValue({
        set: vi.fn().mockReturnValue({
          where: mockUpdateResult,
        }),
      }),
    };

    (dbModule as any).db = mockDb;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: currentEmail },
      expires: '2025-12-31',
    });

    // Default: pending link cookie exists
    mockCookieStore.get.mockReturnValue({
      value: JSON.stringify(mockPendingLinkData),
    });

    const routeModule = await import('@/app/api/auth/oauth-link/route');
    GET = routeModule.GET;
    POST = routeModule.POST;
    DELETE = routeModule.DELETE;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('GET /api/auth/oauth-link', () => {
    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized' });
      });
    });

    describe('Pending Link Retrieval', () => {
      it('should return 404 when no pending link cookie', async () => {
        mockCookieStore.get.mockReturnValue(undefined);

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'No pending link data found' });
      });

      it('should return 200 with pending link data', async () => {
        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual({
          currentEmail,
          newEmail,
          provider: 'google',
        });
      });

      it('should default to google provider for backwards compatibility', async () => {
        mockCookieStore.get.mockReturnValue({
          value: JSON.stringify({
            ...mockPendingLinkData,
            provider: undefined,
          }),
        });

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual(
          expect.objectContaining({
            provider: 'google',
          })
        );
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when cookie parsing fails', async () => {
        mockCookieStore.get.mockReturnValue({
          value: 'invalid-json',
        });

        const response = await GET();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Failed to fetch pending link data' });
      });
    });
  });

  describe('POST /api/auth/oauth-link', () => {
    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized' });
      });
    });

    describe('Pending Link Validation', () => {
      it('should return 400 when no pending link cookie', async () => {
        mockCookieStore.get.mockReturnValue(undefined);

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'No pending link data found' });
      });

      it('should return 400 when pending link data is invalid', async () => {
        mockCookieStore.get.mockReturnValue({
          value: JSON.stringify({ email: newEmail }), // Missing required fields
        });

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(400);
        expect(body).toEqual({ error: 'Invalid pending link data' });
      });
    });

    describe('User Validation', () => {
      it('should return 404 when user not found', async () => {
        mockDb.query.users.findFirst.mockResolvedValue(null);

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(404);
        expect(body).toEqual({ error: 'User not found' });
      });

      it('should return 409 when email is taken by another user', async () => {
        mockDb.query.users.findFirst
          .mockResolvedValueOnce(mockUser) // Current user lookup
          .mockResolvedValueOnce({ id: 'other-user', email: newEmail }); // Email owner lookup

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(409);
        expect(body).toEqual({
          error: 'This email address is already registered to another user.',
        });
      });

      it('should return 409 when OAuth account is linked to another user', async () => {
        mockDb.query.oauthAccounts.findFirst.mockResolvedValue({
          userId: 'other-user',
          provider: 'google',
          providerUserId,
        });

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(409);
        expect(body).toEqual({
          error: 'This OAuth account is already linked to another user.',
        });
      });
    });

    describe('Successful OAuth Linking', () => {
      it('should return 200 on success', async () => {
        // Mock second findFirst call (email owner check) to return null
        mockDb.query.users.findFirst
          .mockResolvedValueOnce(mockUser) // Current user
          .mockResolvedValueOnce(null); // No other user with this email

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual({ success: true });
      });

      it('should link OAuth account', async () => {
        mockDb.query.users.findFirst.mockResolvedValueOnce(mockUser).mockResolvedValueOnce(null);

        const mockValues = vi.fn().mockResolvedValue(undefined);
        mockDb.insert.mockReturnValue({ values: mockValues });

        await POST();

        expect(mockDb.insert).toHaveBeenCalled();
        expect(mockValues).toHaveBeenCalledWith({
          userId: testUserId,
          provider: 'google',
          providerUserId,
          providerEmail: newEmail,
        });
      });

      it('should update user email and mark as verified', async () => {
        mockDb.query.users.findFirst.mockResolvedValueOnce(mockUser).mockResolvedValueOnce(null);

        await POST();

        expect(mockDb.update).toHaveBeenCalled();
        const setCall = mockDb.update.mock.results[0].value.set;
        expect(setCall).toHaveBeenCalledWith({
          email: newEmail.toLowerCase(),
          emailVerifiedAt: expect.any(Date),
        });
      });

      it('should clear pending link cookie', async () => {
        mockDb.query.users.findFirst.mockResolvedValueOnce(mockUser).mockResolvedValueOnce(null);

        await POST();

        expect(mockCookieStore.delete).toHaveBeenCalled();
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when database throws error', async () => {
        mockDb.query.users.findFirst.mockRejectedValue(new Error('Database error'));

        const response = await POST();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Failed to complete OAuth account linking' });
      });
    });
  });

  describe('DELETE /api/auth/oauth-link', () => {
    describe('Authentication', () => {
      it('should return 401 when not authenticated', async () => {
        getServerSession.mockResolvedValue(null);

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(401);
        expect(body).toEqual({ error: 'Unauthorized' });
      });
    });

    describe('Successful Cancellation', () => {
      it('should return 200 on success', async () => {
        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(200);
        expect(body).toEqual({ success: true });
      });

      it('should delete pending link cookie', async () => {
        await DELETE();

        expect(mockCookieStore.delete).toHaveBeenCalled();
      });
    });

    describe('Error Handling', () => {
      it('should return 500 when cookie deletion fails', async () => {
        mockCookieStore.delete.mockImplementation(() => {
          throw new Error('Cookie error');
        });

        const response = await DELETE();
        const body = await getResponseJson(response);

        expect(response.status).toBe(500);
        expect(body).toEqual({ error: 'Failed to cancel OAuth link' });
      });
    });
  });
});
