/**
 * API Route Tests: POST /api/groups
 *
 * Tests the create group endpoint with mocked authentication and database.
 * Verifies authorization and multi-step creation workflow.
 *
 * Note: Group membership is now handled via genealogy statements (member_of predicate),
 * not via users.groupId. Creating a group makes the user an admin but does NOT
 * automatically set membership.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');
vi.mock('@/utils/email');
vi.mock('uuid', () => ({
  v4: () => 'test-group-uuid-123',
}));

describe('POST /api/groups', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let fetchUser: ReturnType<typeof vi.fn>;
  let insertGroup: ReturnType<typeof vi.fn>;
  let addGroupAdmin: ReturnType<typeof vi.fn>;
  let sendGroupRegisteredEmail: ReturnType<typeof vi.fn>;

  const testUserId = 'test-user-456';
  const testGroupId = 'test-group-uuid-123'; // Matches mock uuid.v4()
  const validGroupData = {
    name: 'My New Capoeira Group',
    verified: false,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const db = await import('@/db');
    const emailUtils = await import('@/utils/email');

    getServerSession = vi.fn();
    fetchUser = vi.fn();
    insertGroup = vi.fn();
    addGroupAdmin = vi.fn();
    sendGroupRegisteredEmail = vi.fn();

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.fetchUser as typeof fetchUser) = fetchUser;
    (db.insertGroup as typeof insertGroup) = insertGroup;
    (db.addGroupAdmin as typeof addGroupAdmin) = addGroupAdmin;
    (emailUtils.sendGroupRegisteredEmail as typeof sendGroupRegisteredEmail) = sendGroupRegisteredEmail;

    // Make email sending return resolved promise (don't block)
    sendGroupRegisteredEmail.mockResolvedValue(undefined);

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/groups/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
      expect(fetchUser).not.toHaveBeenCalled();
      expect(insertGroup).not.toHaveBeenCalled();
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({ user: {}, expires: '2025-12-31' });

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });
  });

  describe('User Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
    });

    it('should send welcome email when user has email', async () => {
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
        name: 'Test User',
      });
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(fetchUser).toHaveBeenCalledWith(testUserId);
      expect(sendGroupRegisteredEmail).toHaveBeenCalled();
    });

    it('should proceed without welcome email when user has no email', async () => {
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: null,
        name: 'Test User',
      });
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(sendGroupRegisteredEmail).not.toHaveBeenCalled();
    });
  });

  describe('Input Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
      });
    });

    it('should return 500 when name is missing', async () => {
      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: { verified: false }, // Missing name
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toContain('Group name is required');
    });

    it('should accept valid group data with name only', async () => {
      insertGroup.mockResolvedValue({ id: testGroupId, name: 'Test Group', createdBy: testUserId });
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: { name: 'Test Group' },
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
    });

    it('should accept valid group data with name and verified flag', async () => {
      insertGroup.mockResolvedValue({
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      });
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
    });
  });

  describe('Group Creation Workflow', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com', name: 'Test User' },
        expires: '2025-12-31',
      });
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
        name: 'Test User',
      });
    });

    it('should execute all creation steps in correct order', async () => {
      const createdGroup = {
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      };

      insertGroup.mockResolvedValue(createdGroup);
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      await POST(request);

      // Verify insertGroup was called with correct data
      expect(insertGroup).toHaveBeenCalledWith({
        ...validGroupData,
        id: testGroupId,
        createdBy: testUserId,
      });

      // Verify addGroupAdmin was called to make user admin
      // Note: Membership is handled via genealogy statements, not users.groupId
      expect(addGroupAdmin).toHaveBeenCalledWith({
        groupId: testGroupId,
        userId: testUserId,
      });
    });

    it('should return created group data on success', async () => {
      const createdGroup = {
        id: testGroupId,
        name: 'My New Capoeira Group',
        verified: false,
        createdBy: testUserId,
        createdAt: new Date(),
      };

      insertGroup.mockResolvedValue(createdGroup);
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual(createdGroup);
    });

    it('should send welcome email after group creation', async () => {
      const createdGroup = {
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      };

      insertGroup.mockResolvedValue(createdGroup);
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      await POST(request);

      expect(sendGroupRegisteredEmail).toHaveBeenCalledWith(
        'user@example.com',
        'My New Capoeira Group',
        testGroupId,
        'Test User'
      );
    });

    it('should not fail if email sending fails', async () => {
      const createdGroup = {
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      };

      insertGroup.mockResolvedValue(createdGroup);
      addGroupAdmin.mockResolvedValue(undefined);
      sendGroupRegisteredEmail.mockRejectedValue(new Error('Email service down'));

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);

      // Should still succeed even if email fails
      expect(response.status).toBe(200);
    });

    it('should handle missing user name gracefully in email', async () => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' }, // No name
        expires: '2025-12-31',
      });
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
        name: null, // No name
        groupId: null,
      });

      const createdGroup = {
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      };

      insertGroup.mockResolvedValue(createdGroup);
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      await POST(request);

      expect(sendGroupRegisteredEmail).toHaveBeenCalledWith(
        'user@example.com',
        'My New Capoeira Group',
        testGroupId,
        'Member' // Fallback when no name
      );
    });
  });

  describe('Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId, email: 'user@example.com' },
        expires: '2025-12-31',
      });
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
      });
    });

    it('should return 500 when insertGroup fails', async () => {
      insertGroup.mockResolvedValue(null); // Insertion failed

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toContain('Unable to create the group');
    });

    it('should return 500 when insertGroup throws error', async () => {
      insertGroup.mockRejectedValue(new Error('Database constraint violation'));

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toBe('Database constraint violation');
    });

    it('should return 500 when addGroupAdmin fails', async () => {
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      addGroupAdmin.mockRejectedValue(new Error('Failed to add admin'));

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toBe('Failed to add admin');
    });
  });
});
