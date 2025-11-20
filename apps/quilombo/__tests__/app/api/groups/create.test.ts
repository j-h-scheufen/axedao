/**
 * API Route Tests: POST /api/groups
 *
 * Tests the create group endpoint with mocked authentication and database.
 * Verifies authorization, user group membership validation, and multi-step creation workflow.
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
  let updateUser: ReturnType<typeof vi.fn>;
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
    updateUser = vi.fn();
    addGroupAdmin = vi.fn();
    sendGroupRegisteredEmail = vi.fn();

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.fetchUser as typeof fetchUser) = fetchUser;
    (db.insertGroup as typeof insertGroup) = insertGroup;
    (db.updateUser as typeof updateUser) = updateUser;
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

    it('should throw error when user does not exist in database', async () => {
      fetchUser.mockResolvedValue(null); // User not found

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toContain('logged-in user');
      expect(fetchUser).toHaveBeenCalledWith(testUserId);
    });

    it('should return 403 when user is already member of a group', async () => {
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
        groupId: 'existing-group-123', // User already in a group
      });

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({
        error: 'You cannot create a new group while being a member of an existing group',
      });
      expect(insertGroup).not.toHaveBeenCalled();
    });

    it('should proceed when user exists and is not in a group', async () => {
      fetchUser.mockResolvedValue({
        id: testUserId,
        email: 'user@example.com',
        groupId: null, // Not in any group
      });
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      updateUser.mockResolvedValue(undefined);
      addGroupAdmin.mockResolvedValue(undefined);

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
      expect(fetchUser).toHaveBeenCalledWith(testUserId);
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
        groupId: null,
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
      updateUser.mockResolvedValue(undefined);
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
      updateUser.mockResolvedValue(undefined);
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
        groupId: null,
      });
    });

    it('should execute all creation steps in correct order', async () => {
      const createdGroup = {
        id: testGroupId,
        ...validGroupData,
        createdBy: testUserId,
      };

      insertGroup.mockResolvedValue(createdGroup);
      updateUser.mockResolvedValue(undefined);
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

      // Verify updateUser was called to set user's groupId
      expect(updateUser).toHaveBeenCalledWith({
        id: testUserId,
        groupId: testGroupId,
      });

      // Verify addGroupAdmin was called to make user admin
      expect(addGroupAdmin).toHaveBeenCalledWith({
        groupId: testGroupId,
        userId: testUserId,
      });

      // Verify call order
      expect(insertGroup).toHaveBeenCalledBefore(updateUser);
      expect(updateUser).toHaveBeenCalledBefore(addGroupAdmin);
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
      updateUser.mockResolvedValue(undefined);
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
      updateUser.mockResolvedValue(undefined);
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
      updateUser.mockResolvedValue(undefined);
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
      updateUser.mockResolvedValue(undefined);
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
        groupId: null,
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

    it('should return 500 when updateUser fails', async () => {
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      updateUser.mockRejectedValue(new Error('Failed to update user'));

      const request = createMockRequest('http://localhost/api/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
      expect((body as { message: string }).message).toBe('Failed to update user');
    });

    it('should return 500 when addGroupAdmin fails', async () => {
      insertGroup.mockResolvedValue({ id: testGroupId, ...validGroupData, createdBy: testUserId });
      updateUser.mockResolvedValue(undefined);
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
