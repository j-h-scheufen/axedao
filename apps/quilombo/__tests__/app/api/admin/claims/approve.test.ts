/**
 * API Route Tests: PUT /api/admin/claims/[claimId]/approve
 *
 * Tests the admin claim approval endpoint with mocked authentication and database.
 * Verifies global admin authorization, multi-step approval workflow, and email notifications.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/email');

describe('PUT /api/admin/claims/[claimId]/approve', () => {
  let PUT: (request: Request, context: { params: Promise<{ claimId: string }> }) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let isGlobalAdmin: ReturnType<typeof vi.fn>;
  let getGroupClaim: ReturnType<typeof vi.fn>;
  let fetchUser: ReturnType<typeof vi.fn>;
  let fetchGroup: ReturnType<typeof vi.fn>;
  let approveClaim: ReturnType<typeof vi.fn>;
  let getEmailProvider: ReturnType<typeof vi.fn>;
  let NotFoundError: any;

  const testAdminId = 'admin-user-123';
  const testClaimId = 'claim-456';
  const testUserId = 'claimer-789';
  const testGroupId = 'group-101';

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
    nickname: 'claimer',
  };

  const mockGroup = {
    id: testGroupId,
    name: 'Test Capoeira Group',
    createdAt: new Date(),
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const db = await import('@/db');
    const emailUtils = await import('@/utils/email');
    const errors = await import('@/utils/errors');

    getServerSession = vi.fn();
    isGlobalAdmin = vi.fn();
    getGroupClaim = vi.fn();
    fetchUser = vi.fn();
    fetchGroup = vi.fn();
    approveClaim = vi.fn();
    getEmailProvider = vi.fn();
    NotFoundError = errors.NotFoundError;

    const mockEmailProvider = {
      sendClaimApprovedEmail: vi.fn().mockResolvedValue(undefined),
    };

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.isGlobalAdmin as typeof isGlobalAdmin) = isGlobalAdmin;
    (db.getGroupClaim as typeof getGroupClaim) = getGroupClaim;
    (db.fetchUser as typeof fetchUser) = fetchUser;
    (db.fetchGroup as typeof fetchGroup) = fetchGroup;
    (db.approveClaim as typeof approveClaim) = approveClaim;
    (emailUtils.getEmailProvider as typeof getEmailProvider) = getEmailProvider;

    getEmailProvider.mockReturnValue(mockEmailProvider);

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/admin/claims/[claimId]/approve/route');
    PUT = routeModule.PUT;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication & Authorization', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      expect(isGlobalAdmin).not.toHaveBeenCalled();
      expect(approveClaim).not.toHaveBeenCalled();
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({ user: {}, expires: '2025-12-31' });

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });

    it('should return 403 when user is not a global admin', async () => {
      getServerSession.mockResolvedValue({
        user: { id: 'regular-user-123', email: 'user@example.com' },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(false); // Not a global admin

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({ error: 'Missing permission. Global admin access required.' });
      expect(isGlobalAdmin).toHaveBeenCalledWith('regular-user-123');
      expect(approveClaim).not.toHaveBeenCalled();
    });

    it('should proceed when user is a global admin', async () => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com', isGlobalAdmin: true },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
      approveClaim.mockResolvedValue(undefined);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(response.status).toBe(200);
      expect(isGlobalAdmin).toHaveBeenCalledWith(testAdminId);
    });
  });

  describe('Claim Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com', isGlobalAdmin: true },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
    });

    it('should return 404 when claim does not exist', async () => {
      getGroupClaim.mockResolvedValue(null); // Claim not found

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Claim not found' });
      expect(getGroupClaim).toHaveBeenCalledWith(testClaimId);
      expect(approveClaim).not.toHaveBeenCalled();
    });

    it('should return 404 when user does not exist', async () => {
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(null); // User not found
      fetchGroup.mockResolvedValue(mockGroup);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User or group not found' });
      expect(fetchUser).toHaveBeenCalledWith(testUserId);
      expect(approveClaim).not.toHaveBeenCalled();
    });

    it('should return 404 when group does not exist', async () => {
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(null); // Group not found

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'User or group not found' });
      expect(fetchGroup).toHaveBeenCalledWith(testGroupId);
      expect(approveClaim).not.toHaveBeenCalled();
    });
  });

  describe('Approval Workflow', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com', isGlobalAdmin: true },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
      approveClaim.mockResolvedValue(undefined);
    });

    it('should call approveClaim with correct parameters', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(approveClaim).toHaveBeenCalledWith(testClaimId, testAdminId);
      expect(approveClaim).toHaveBeenCalledTimes(1);
    });

    it('should send approval email to claimer', async () => {
      const mockEmailProvider = {
        sendClaimApprovedEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(mockEmailProvider.sendClaimApprovedEmail).toHaveBeenCalledWith(
        'claimer@example.com',
        'Test Capoeira Group',
        testGroupId,
        'Claimer User'
      );
    });

    it('should use email as fallback when user has no name', async () => {
      fetchUser.mockResolvedValue({
        ...mockUser,
        name: null,
      });

      const mockEmailProvider = {
        sendClaimApprovedEmail: vi.fn().mockResolvedValue(undefined),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(mockEmailProvider.sendClaimApprovedEmail).toHaveBeenCalledWith(
        'claimer@example.com',
        'Test Capoeira Group',
        testGroupId,
        'claimer@example.com' // Falls back to email
      );
    });

    it('should return 200 with success message', async () => {
      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({
        message: 'Claim approved successfully. User has been added as group admin.',
      });
    });

    it('should not fail if email sending fails', async () => {
      const mockEmailProvider = {
        sendClaimApprovedEmail: vi.fn().mockRejectedValue(new Error('Email service down')),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      // Should still succeed even if email fails
      expect(response.status).toBe(200);
      expect(approveClaim).toHaveBeenCalled();
    });

    it('should skip email when user has no email address', async () => {
      fetchUser.mockResolvedValue({
        ...mockUser,
        email: null,
      });

      const mockEmailProvider = {
        sendClaimApprovedEmail: vi.fn(),
      };
      getEmailProvider.mockReturnValue(mockEmailProvider);

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });

      expect(response.status).toBe(200);
      expect(mockEmailProvider.sendClaimApprovedEmail).not.toHaveBeenCalled();
    });
  });

  describe('Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testAdminId, email: 'admin@example.com', isGlobalAdmin: true },
        expires: '2025-12-31',
      });
      isGlobalAdmin.mockResolvedValue(true);
      getGroupClaim.mockResolvedValue(mockClaim);
      fetchUser.mockResolvedValue(mockUser);
      fetchGroup.mockResolvedValue(mockGroup);
    });

    it('should return 404 when approveClaim throws NotFoundError', async () => {
      approveClaim.mockRejectedValue(new NotFoundError('Claim', testClaimId));

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: `Claim with id '${testClaimId}' not found` });
    });

    it('should return 500 when approveClaim throws generic error', async () => {
      approveClaim.mockRejectedValue(new Error('Database constraint violation'));

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Database constraint violation' });
    });

    it('should return 500 when getGroupClaim throws error', async () => {
      getGroupClaim.mockRejectedValue(new Error('Database connection failed'));

      const request = createMockRequest(`http://localhost/api/admin/claims/${testClaimId}/approve`, {
        method: 'PUT',
      });

      const response = await PUT(request, { params: Promise.resolve({ claimId: testClaimId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toEqual({ error: 'Database connection failed' });
    });
  });
});
