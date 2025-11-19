/**
 * API Route Tests: POST /api/groups/[groupId]/claim
 *
 * Tests the group claim endpoint with mocked authentication and database.
 * Verifies authorization, claimability validation, input validation, and success responses.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/groups/[groupId]/claim', () => {
  let POST: (request: Request, context: { params: Promise<{ groupId: string }> }) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let isGroupClaimable: ReturnType<typeof vi.fn>;
  let createGroupClaim: ReturnType<typeof vi.fn>;
  let fetchGroup: ReturnType<typeof vi.fn>;

  const testGroupId = 'test-group-123';
  const testUserId = 'test-user-456';
  const testClaimId = 'claim-789';
  const validUserMessage = 'I am the founder of this group and would like to claim admin access.';

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const db = await import('@/db');

    getServerSession = vi.fn();
    isGroupClaimable = vi.fn();
    createGroupClaim = vi.fn();
    fetchGroup = vi.fn();

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.isGroupClaimable as typeof isGroupClaimable) = isGroupClaimable;
    (db.createGroupClaim as typeof createGroupClaim) = createGroupClaim;
    (db.fetchGroup as typeof fetchGroup) = fetchGroup;

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/groups/[groupId]/claim/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      expect(isGroupClaimable).not.toHaveBeenCalled();
      expect(createGroupClaim).not.toHaveBeenCalled();
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({ user: {}, expires: '2025-12-31' });

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });
  });

  describe('Group Existence Validation', () => {
    it('should return 404 when group does not exist', async () => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Group not found' });
      expect(fetchGroup).toHaveBeenCalledWith(testGroupId);
      expect(isGroupClaimable).not.toHaveBeenCalled();
      expect(createGroupClaim).not.toHaveBeenCalled();
    });
  });

  describe('Claimability Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
    });

    it('should return 403 when group is not claimable', async () => {
      isGroupClaimable.mockResolvedValue(false); // Group already claimed or has admins

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({
        error: 'This group is not claimable. It may already be claimed or have existing admins.',
      });
      expect(isGroupClaimable).toHaveBeenCalledWith(testGroupId);
      expect(createGroupClaim).not.toHaveBeenCalled();
    });

    it('should proceed when group is claimable', async () => {
      isGroupClaimable.mockResolvedValue(true);
      createGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(isGroupClaimable).toHaveBeenCalledWith(testGroupId);
      expect(createGroupClaim).toHaveBeenCalled();
    });
  });

  describe('Input Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      isGroupClaimable.mockResolvedValue(true);
    });

    it('should return 400 when userMessage is missing', async () => {
      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: {},
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('admin of this group');
      expect(createGroupClaim).not.toHaveBeenCalled();
    });

    it('should return 400 when userMessage is too short', async () => {
      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: 'Too short' }, // Less than 20 chars
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('at least 20 characters');
      expect(createGroupClaim).not.toHaveBeenCalled();
    });

    it('should accept userMessage with exactly 20 characters', async () => {
      createGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: '12345678901234567890' }, // Exactly 20 chars
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(createGroupClaim).toHaveBeenCalledWith(testUserId, testGroupId, '12345678901234567890');
    });

    it('should accept valid userMessage', async () => {
      createGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(createGroupClaim).toHaveBeenCalledWith(testUserId, testGroupId, validUserMessage);
    });
  });

  describe('Successful Claim Submission', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      isGroupClaimable.mockResolvedValue(true);
      createGroupClaim.mockResolvedValue(testClaimId);
    });

    it('should return 200 with claimId and success message', async () => {
      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = (await getResponseJson(response)) as {
        claimId: string;
        message: string;
      };

      expect(response.status).toBe(200);
      expect(body).toHaveProperty('claimId', testClaimId);
      expect(body).toHaveProperty('message');
      expect(body.message).toContain('submitted successfully');

      expect(createGroupClaim).toHaveBeenCalledWith(testUserId, testGroupId, validUserMessage);
    });

    it('should create claim with all required parameters', async () => {
      const customMessage = 'I have been leading this group for 5 years and would like admin access.';

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: customMessage },
      });

      await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(createGroupClaim).toHaveBeenCalledWith(testUserId, testGroupId, customMessage);
      expect(createGroupClaim).toHaveBeenCalledTimes(1);
    });
  });

  describe('Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      isGroupClaimable.mockResolvedValue(true);
    });

    it('should return 500 when createGroupClaim throws error', async () => {
      createGroupClaim.mockRejectedValue(new Error('Database connection failed'));

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toBe('Database connection failed');
    });

    it('should return 500 when isGroupClaimable throws error', async () => {
      isGroupClaimable.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/claim`, {
        method: 'POST',
        body: { userMessage: validUserMessage },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
    });
  });
});
