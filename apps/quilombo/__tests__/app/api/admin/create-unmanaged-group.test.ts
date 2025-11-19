/**
 * API Route Tests: POST /api/admin/groups
 * Tests creating unmanaged groups (admin-only feature).
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

vi.mock('next-auth');
vi.mock('@/db');
vi.mock('uuid', () => ({
  v4: () => 'test-group-uuid-123',
}));

describe('POST /api/admin/groups', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let insertGroup: ReturnType<typeof vi.fn>;

  const testAdminId = 'admin-123';
  const testGroupId = 'test-group-uuid-123';

  const validGroupData = {
    name: 'Test Unmanaged Group',
    description: 'A group created by admin',
    style: 'Angola' as const,
    email: 'group@example.com',
    founder: 'John Doe',
    links: [{ type: 'website', url: 'https://example.com' }],
  };

  const mockCreatedGroup = {
    id: testGroupId,
    ...validGroupData,
    createdBy: null,
    claimedBy: null,
    claimedAt: null,
    createdAt: new Date(),
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const db = await import('@/db');

    getServerSession = vi.fn();
    insertGroup = vi.fn();

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.insertGroup as typeof insertGroup) = insertGroup;

    // Default: global admin session
    getServerSession.mockResolvedValue({
      user: { id: testAdminId, isGlobalAdmin: true },
      expires: '2025-12-31',
    });

    insertGroup.mockResolvedValue(mockCreatedGroup);

    const routeModule = await import('@/app/api/admin/groups/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });
  });

  describe('Authorization', () => {
    it('should return 403 when user is not a global admin', async () => {
      getServerSession.mockResolvedValue({
        user: { id: 'regular-user-123', isGlobalAdmin: false },
        expires: '2025-12-31',
      });

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(403);
      expect(body).toEqual({ error: 'Forbidden. Only global admins can create unmanaged groups' });
    });
  });

  describe('Input Validation', () => {
    it('should return 500 when name is missing (validation error)', async () => {
      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: { description: 'Test' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
    });

    it('should accept optional fields without validation', async () => {
      const dataWithExtras = {
        ...validGroupData,
        email: 'any-string-works',
        style: 'anything',
        customField: 'extra data',
      };

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: dataWithExtras,
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
    });
  });

  describe('Successful Group Creation', () => {
    it('should return 200 with created group', async () => {
      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual(mockCreatedGroup);
    });

    it('should create group with null ownership fields (unmanaged)', async () => {
      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      await POST(request);

      expect(insertGroup).toHaveBeenCalledWith({
        ...validGroupData,
        id: testGroupId,
        createdBy: null,
        claimedBy: null,
      });
    });

    it('should generate UUID for new group', async () => {
      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      await POST(request);

      expect(insertGroup).toHaveBeenCalledWith(
        expect.objectContaining({
          id: testGroupId,
        })
      );
    });

    it('should handle optional fields', async () => {
      const minimalGroupData = {
        name: 'Minimal Group',
      };

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: minimalGroupData,
      });

      await POST(request);

      expect(insertGroup).toHaveBeenCalledWith(
        expect.objectContaining({
          name: 'Minimal Group',
          id: testGroupId,
          createdBy: null,
          claimedBy: null,
        })
      );
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when insertGroup fails', async () => {
      insertGroup.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
      expect(body).toHaveProperty('message');
    });

    it('should return 500 when database throws error', async () => {
      insertGroup.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/admin/groups', {
        method: 'POST',
        body: validGroupData,
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error', true);
    });
  });
});
