/**
 * API Route Tests: POST /api/groups/[groupId]/verify
 *
 * Tests the group verification endpoint with mocked authentication and database.
 * Verifies authorization, validation, cooldown logic, and success responses.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/groups/[groupId]/verify', () => {
  let POST: (request: Request, context: { params: Promise<{ groupId: string }> }) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let canVerifyGroup: ReturnType<typeof vi.fn>;
  let verifyGroup: ReturnType<typeof vi.fn>;
  let fetchGroup: ReturnType<typeof vi.fn>;

  const testGroupId = 'test-group-123';
  const testUserId = 'test-user-456';

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const db = await import('@/db');

    getServerSession = vi.fn();
    canVerifyGroup = vi.fn();
    verifyGroup = vi.fn();
    fetchGroup = vi.fn();

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.canVerifyGroup as typeof canVerifyGroup) = canVerifyGroup;
    (db.verifyGroup as typeof verifyGroup) = verifyGroup;
    (db.fetchGroup as typeof fetchGroup) = fetchGroup;

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/groups/[groupId]/verify/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      expect(canVerifyGroup).not.toHaveBeenCalled();
      expect(verifyGroup).not.toHaveBeenCalled();
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({ user: {}, expires: '2025-12-31' });

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
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

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(404);
      expect(body).toEqual({ error: 'Group not found' });
      expect(fetchGroup).toHaveBeenCalledWith(testGroupId);
      expect(canVerifyGroup).not.toHaveBeenCalled();
      expect(verifyGroup).not.toHaveBeenCalled();
    });
  });

  describe('Input Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      canVerifyGroup.mockResolvedValue(true); // Ensure validation runs, not cooldown check
    });

    it('should accept request without notes', async () => {
      canVerifyGroup.mockResolvedValue(true);
      verifyGroup.mockResolvedValue(undefined);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: {},
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(verifyGroup).toHaveBeenCalledWith(testUserId, testGroupId, undefined);
    });

    it('should accept request with valid notes', async () => {
      canVerifyGroup.mockResolvedValue(true);
      verifyGroup.mockResolvedValue(undefined);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Verified website is active' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(verifyGroup).toHaveBeenCalledWith(testUserId, testGroupId, 'Verified website is active');
    });
  });

  describe('Verification Cooldown (30-Day Rate Limit)', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
    });

    it('should return 429 when group was recently verified', async () => {
      canVerifyGroup.mockResolvedValue(false); // Still within cooldown

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(429);
      expect(body).toEqual({
        error: 'This group was recently verified. Groups can only be verified once every 30 days.',
      });
      expect(canVerifyGroup).toHaveBeenCalledWith(testGroupId);
      expect(verifyGroup).not.toHaveBeenCalled();
    });

    it('should allow verification when cooldown has expired', async () => {
      canVerifyGroup.mockResolvedValue(true); // Cooldown expired
      verifyGroup.mockResolvedValue(undefined);

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(canVerifyGroup).toHaveBeenCalledWith(testGroupId);
      expect(verifyGroup).toHaveBeenCalledWith(testUserId, testGroupId, 'Test verification');
    });
  });

  describe('Successful Verification', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      canVerifyGroup.mockResolvedValue(true);
      verifyGroup.mockResolvedValue(undefined);
    });

    it('should return 200 with success message and next verification date', async () => {
      const beforeRequest = new Date();

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Verified website is active' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = (await getResponseJson(response)) as {
        message: string;
        nextVerificationDate: string;
      };

      expect(response.status).toBe(200);
      expect(body).toHaveProperty('message', 'Group verified successfully. Thank you for contributing!');
      expect(body).toHaveProperty('nextVerificationDate');

      // Verify nextVerificationDate is ~30 days from now
      const nextVerification = new Date(body.nextVerificationDate);
      const expectedDate = new Date(beforeRequest);
      expectedDate.setDate(expectedDate.getDate() + 30);

      const timeDiff = Math.abs(nextVerification.getTime() - expectedDate.getTime());
      expect(timeDiff).toBeLessThan(5000); // Within 5 seconds

      expect(verifyGroup).toHaveBeenCalledWith(testUserId, testGroupId, 'Verified website is active');
    });

    it('should call verifyGroup with undefined when no notes provided', async () => {
      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: {},
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });

      expect(response.status).toBe(200);
      expect(verifyGroup).toHaveBeenCalledWith(testUserId, testGroupId, undefined);
    });
  });

  describe('Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group' });
      canVerifyGroup.mockResolvedValue(true);
    });

    it('should return 500 when verifyGroup throws unexpected error', async () => {
      verifyGroup.mockRejectedValue(new Error('Database connection failed'));

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      // generateErrorMessage returns the actual error message when it's an Error instance
      expect((body as { error: string }).error).toBe('Database connection failed');
    });

    it('should return 500 when canVerifyGroup throws error', async () => {
      canVerifyGroup.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest(`http://localhost/api/groups/${testGroupId}/verify`, {
        method: 'POST',
        body: { notes: 'Test verification' },
      });

      const response = await POST(request, { params: Promise.resolve({ groupId: testGroupId }) });
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
    });
  });
});
