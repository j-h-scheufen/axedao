/**
 * API Route Tests: POST /api/groups/claims and GET /api/groups/claims
 *
 * Tests the group claim endpoints with mocked authentication and database.
 * Supports two claim types:
 *   - genealogy_group: Claim an existing genealogy group profile
 *   - new_group: Register a new group not in genealogy
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('Group Claims API', () => {
  let GET: (request: Request) => Promise<Response>;
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let getUserGroupClaims: ReturnType<typeof vi.fn>;
  let createGenealogyGroupClaim: ReturnType<typeof vi.fn>;
  let createNewGroupClaim: ReturnType<typeof vi.fn>;
  let isGroupAdminClaimable: ReturnType<typeof vi.fn>;
  let hasPendingGenealogyGroupClaim: ReturnType<typeof vi.fn>;

  const testUserId = 'test-user-456';
  const testProfileId = 'profile-123';
  const testClaimId = 'claim-789';
  const validUserMessage = 'I am the founder of this group and would like to claim admin access.';

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    // Import mocked modules
    const nextAuth = await import('next-auth');
    const db = await import('@/db');

    getServerSession = vi.fn();
    getUserGroupClaims = vi.fn();
    createGenealogyGroupClaim = vi.fn();
    createNewGroupClaim = vi.fn();
    isGroupAdminClaimable = vi.fn();
    hasPendingGenealogyGroupClaim = vi.fn();

    // Setup mocks
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.getUserGroupClaims as typeof getUserGroupClaims) = getUserGroupClaims;
    (db.createGenealogyGroupClaim as typeof createGenealogyGroupClaim) = createGenealogyGroupClaim;
    (db.createNewGroupClaim as typeof createNewGroupClaim) = createNewGroupClaim;
    (db.isGroupAdminClaimable as typeof isGroupAdminClaimable) = isGroupAdminClaimable;
    (db.hasPendingGenealogyGroupClaim as typeof hasPendingGenealogyGroupClaim) = hasPendingGenealogyGroupClaim;

    // Import route handler AFTER mocks are set up
    const routeModule = await import('@/app/api/groups/claims/route');
    GET = routeModule.GET;
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('GET /api/groups/claims', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/groups/claims', { method: 'GET' });
      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });

    it('should return user claims', async () => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId },
        expires: '2025-12-31',
      });
      getUserGroupClaims.mockResolvedValue([
        { id: 'claim-1', type: 'genealogy_group', status: 'pending' },
        { id: 'claim-2', type: 'new_group', status: 'approved' },
      ]);

      const request = createMockRequest('http://localhost/api/groups/claims', { method: 'GET' });
      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toHaveLength(2);
      expect(getUserGroupClaims).toHaveBeenCalledWith(testUserId);
    });
  });

  describe('POST /api/groups/claims - Authentication', () => {
    it('should return 401 when user is not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized, try to login again' });
    });
  });

  describe('POST /api/groups/claims - Type Validation', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId },
        expires: '2025-12-31',
      });
    });

    it('should return 400 when type is missing', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid claim type. Must be "genealogy_group" or "new_group"' });
    });

    it('should return 400 when type is invalid', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'invalid_type', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'Invalid claim type. Must be "genealogy_group" or "new_group"' });
    });
  });

  describe('POST /api/groups/claims - Genealogy Group Claims', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId },
        expires: '2025-12-31',
      });
    });

    it('should return 400 when profileId is missing', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toEqual({ error: 'profileId is required for genealogy group claims' });
    });

    it('should return 400 when userMessage is too short', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: 'Too short' },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect((body as { error: string }).error).toContain('at least 20 characters');
    });

    it('should return 409 when group is already claimed', async () => {
      isGroupAdminClaimable.mockResolvedValue(false);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(409);
      expect(body).toEqual({ error: 'This group has already been claimed' });
    });

    it('should return 409 when user already has pending claim', async () => {
      isGroupAdminClaimable.mockResolvedValue(true);
      hasPendingGenealogyGroupClaim.mockResolvedValue(true);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(409);
      expect(body).toEqual({ error: 'You already have a pending claim for this group' });
    });

    it('should create genealogy group claim successfully', async () => {
      isGroupAdminClaimable.mockResolvedValue(true);
      hasPendingGenealogyGroupClaim.mockResolvedValue(false);
      createGenealogyGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = (await getResponseJson(response)) as { claimId: string; message: string };

      expect(response.status).toBe(201);
      expect(body.claimId).toBe(testClaimId);
      expect(body.message).toContain('submitted successfully');
      expect(createGenealogyGroupClaim).toHaveBeenCalledWith(testUserId, testProfileId, validUserMessage);
    });
  });

  describe('POST /api/groups/claims - New Group Registration', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId },
        expires: '2025-12-31',
      });
    });

    it('should return 400 when proposedName is missing', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'new_group', userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should return 400 when proposedName is too short', async () => {
      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'new_group', proposedName: 'A', userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
    });

    it('should create new group claim successfully', async () => {
      createNewGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: {
          type: 'new_group',
          proposedName: 'My New Group',
          proposedStyle: 'angola',
          website: 'https://example.com',
          userMessage: validUserMessage,
        },
      });

      const response = await POST(request);
      const body = (await getResponseJson(response)) as { claimId: string; message: string };

      expect(response.status).toBe(201);
      expect(body.claimId).toBe(testClaimId);
      expect(body.message).toContain('submitted successfully');
      expect(createNewGroupClaim).toHaveBeenCalledWith(testUserId, {
        proposedName: 'My New Group',
        proposedStyle: 'angola',
        website: 'https://example.com',
        userMessage: validUserMessage,
      });
    });

    it('should create new group claim without optional fields', async () => {
      createNewGroupClaim.mockResolvedValue(testClaimId);

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: {
          type: 'new_group',
          proposedName: 'My New Group',
          userMessage: validUserMessage,
        },
      });

      const response = await POST(request);

      expect(response.status).toBe(201);
      expect(createNewGroupClaim).toHaveBeenCalledWith(testUserId, {
        proposedName: 'My New Group',
        proposedStyle: null,
        website: undefined,
        userMessage: validUserMessage,
      });
    });
  });

  describe('POST /api/groups/claims - Error Handling', () => {
    beforeEach(() => {
      getServerSession.mockResolvedValue({
        user: { id: testUserId },
        expires: '2025-12-31',
      });
      isGroupAdminClaimable.mockResolvedValue(true);
      hasPendingGenealogyGroupClaim.mockResolvedValue(false);
    });

    it('should return 500 when createGenealogyGroupClaim throws error', async () => {
      createGenealogyGroupClaim.mockRejectedValue(new Error('Database connection failed'));

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'genealogy_group', profileId: testProfileId, userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
    });

    it('should return 500 when createNewGroupClaim throws error', async () => {
      createNewGroupClaim.mockRejectedValue(new Error('Database error'));

      const request = createMockRequest('http://localhost/api/groups/claims', {
        method: 'POST',
        body: { type: 'new_group', proposedName: 'My New Group', userMessage: validUserMessage },
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
    });
  });
});
