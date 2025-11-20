/**
 * API Route Tests: PUT /api/admin/claims/[claimId]/reject
 *
 * Tests the admin claim rejection endpoint with mocked authentication and database.
 * Verifies global admin authorization, notes validation, and email notifications.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/email');

describe('PUT /api/admin/claims/[claimId]/reject', () => {
  let PUT: (request: Request, context: { params: Promise<{ claimId: string }> }) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let isGlobalAdmin: ReturnType<typeof vi.fn>;
  let getGroupClaim: ReturnType<typeof vi.fn>;
  let fetchUser: ReturnType<typeof vi.fn>;
  let fetchGroup: ReturnType<typeof vi.fn>;
  let rejectClaim: ReturnType<typeof vi.fn>;
  let getEmailProvider: ReturnType<typeof vi.fn>;
  let NotFoundError: any;

  const testAdminId = 'admin-user-123';
  const testClaimId = 'claim-456';
  const testUserId = 'claimer-789';
  const testGroupId = 'group-101';
  const validNotes = 'Group information could not be verified';

  const mockClaim = {
    id: testClaimId,
    userId: testUserId,
    groupId: testGroupId,
    userMessage: 'I am the founder of this group',
    status: 'pending' as const,
    createdAt: new Date(),
  };

  const mockUser = {
    id: testUserId,
    email: 'claimer@example.com',
    name: 'Claimer User',
  };

  const mockGroup = {
    id: testGroupId,
    name: 'Test Capoeira Group',
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const db = await import('@/db');
    const emailUtils = await import('@/utils/email');
    const errors = await import('@/utils/errors');

    getServerSession = vi.fn();
    isGlobalAdmin = vi.fn();
    getGroupClaim = vi.fn();
    fetchUser = vi.fn();
    fetchGroup = vi.fn();
    rejectClaim = vi.fn();
    getEmailProvider = vi.fn();
    NotFoundError = errors.NotFoundError;

    const mockEmailProvider = {
      sendClaimRejectedEmail: vi.fn().mockResolvedValue(undefined),
    };

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.isGlobalAdmin as typeof isGlobalAdmin) = isGlobalAdmin;
    (db.getGroupClaim as typeof getGroupClaim) = getGroupClaim;
    (db.fetchUser as typeof fetchUser) = fetchUser;
    (db.fetchGroup as typeof fetchGroup) = fetchGroup;
    (db.rejectClaim as typeof rejectClaim) = rejectClaim;
    (emailUtils.getEmailProvider as typeof getEmailProvider) = getEmailProvider;

    getEmailProvider.mockReturnValue(mockEmailProvider);

    const routeModule = await import('@/app/api/admin/claims/[claimId]/reject/route');
    PUT = routeModule.PUT;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication & Authorization', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      expect(rejectClaim).not.toHaveBeenCalled();
    });

    it('should return 403 when user is not a global admin', async () => {
      getServerSession.mockResolvedValue({
        user: { id: 'regular-user-123' },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(false);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({ error: 'Missing permission. Global admin access required.' });
      expect(rejectClaim).not.toHaveBeenCalled();
    });
  });

  describe('Input Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
    });

    it('should return 400 when notes are missing', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: {},
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Rejection notes are required' });
      expect(rejectClaim).not.toHaveBeenCalled();
    });

    it('should return 400 when notes are empty string', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: '   ' },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Rejection notes are required' });
    });

    it('should return 400 when notes are not a string', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: 123 },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Rejection notes are required' });
    });

    it('should accept valid notes', async () => {
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
      rejectClaim.mockResolvedValue(undefined);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(response.status).toBe(200);
    });
  });

  describe('Claim Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
    });

    it('should return 404 when claim does not exist', async () => {
      getGroupClaim.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Claim not found' });
      expect(rejectClaim).not.toHaveBeenCalled();
    });

    it('should return 404 when user does not exist', async () => {
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(null);
      fetchGroup.mockResolvedValue(mockGroup);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User or group not found' });
      expect(rejectClaim).not.toHaveBeenCalled();
    });

    it('should return 404 when group does not exist', async () => {
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User or group not found' });
    });
  });

  describe('Rejection Workflow', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
      rejectClaim.mockResolvedValue(undefined);
    });

    it('should call rejectClaim with correct parameters', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(rejectClaim).toHaveBeenCalledWith(testClaimId, testAdminId, validNotes);
    });

    it('should send rejection email with notes', async () => {
      const mockEmailProvider = {
        sendClaimRejectedEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(mockEmailProvider.sendClaimRejectedEmail).toHaveBeenCalledWith(
        'claimer@example.com',
        'Test Capoeira Group',
        'Claimer User',
        validNotes
      );
    });

    it('should use email as fallback when user has no name', async () => {
      fetchUser.mockResolvedValue({ ...mockUser, name: null });

      const mockEmailProvider = {
        sendClaimRejectedEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(mockEmailProvider.sendClaimRejectedEmail).toHaveBeenCalledWith(
        'claimer@example.com',
        'Test Capoeira Group',
        'claimer@example.com',
        validNotes
      );
    });

    it('should return 200 with success message', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ message: 'Claim rejected successfully.' });
    });

    it('should not fail if email sending fails', async () => {
      const mockEmailProvider = {
        sendClaimRejectedEmail: vi.fn().mockRejectedValue(new Error('Email service down')),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(response.status).toBe(200);
      expect(rejectClaim).toHaveBeenCalled();
    });

    it('should skip email when user has no email address', async () => {
      fetchUser.mockResolvedValue({ ...mockUser, email: null });

      const mockEmailProvider = {
        sendClaimRejectedEmail: vi.fn(),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(response.status).toBe(200);
      expect(mockEmailProvider.sendClaimRejectedEmail).not.toHaveBeenCalled();
    });
  });

  describe('Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
    });

    it('should return 404 when rejectClaim throws NotFoundError', async () => {
      rejectClaim.mockRejectedValue(new NotFoundError('Claim', testClaimId));

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: `Claim with id '${testClaimId}' not found` });
    });

    it('should return 500 when rejectClaim throws generic error', async () => {
      rejectClaim.mockRejectedValue(new Error('Database constraint violation'));

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/reject`, {
        method: 'PUT',
        body: { notes: validNotes },
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Database constraint violation' });
    });
  });
});
