/**
 * API Route Tests: GET /api/admin/claims
 * Tests listing pending claims with global admin authorization.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { createMockRequest, getResponseJson } from '../../../setup/api-helpers';

vi.mock('next-auth');
vi.mock('@/db');

describe('GET /api/admin/claims', () => {
  let GET: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let isGlobalAdmin: ReturnType<typeof vi.fn>;
  let getPendingGroupClaims: ReturnType<typeof vi.fn>;

  const testAdminId = 'admin-123';

  // New claim structure with type and groupProfile
  const mockClaims = [
    {
      id: 'claim-1',
      type: 'genealogy_group' as const,
      profileId: 'profile-1',
      proposedName: null,
      userId: 'user-1',
      userMessage: 'I am the founder',
      status: 'pending' as const,
      requestedAt: new Date(),
      groupProfile: { id: 'profile-1', name: 'Test Group 1' },
      user: { name: 'User One', email: 'user1@example.com' },
    },
    {
      id: 'claim-2',
      type: 'new_group' as const,
      profileId: null,
      proposedName: 'My New Group',
      userId: 'user-2',
      userMessage: 'I lead this group',
      status: 'pending' as const,
      requestedAt: new Date(),
      groupProfile: null,
      user: { name: null, email: 'user2@example.com' },
    },
  ];

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const db = await import('@/db');

    getServerSession = vi.fn();
    isGlobalAdmin = vi.fn();
    getPendingGroupClaims = vi.fn();

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.isGlobalAdmin as typeof isGlobalAdmin) = isGlobalAdmin;
    (db.getPendingGroupClaims as typeof getPendingGroupClaims) = getPendingGroupClaims;

    const routeModule = await import('@/app/api/admin/claims/route');
    GET = routeModule.GET;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  it('should return 401 when not authenticated', async () => {
    getServerSession.mockResolvedValue(null);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(401);
    expect(body).toEqual({ error: 'Unauthorized, try to login again' });
  });

  it('should return 403 when user is not global admin', async () => {
    getServerSession.mockResolvedValue({ user: { id: 'user-123' }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(false);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(403);
    expect(body).toEqual({ error: 'Missing permission. Global admin access required.' });
  });

  it('should return empty array when no pending claims', async () => {
    getServerSession.mockResolvedValue({ user: { id: testAdminId }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(true);
    getPendingGroupClaims.mockResolvedValue([]);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(200);
    expect(body).toEqual([]);
  });

  it('should return transformed pending claims', async () => {
    getServerSession.mockResolvedValue({ user: { id: testAdminId }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(true);
    getPendingGroupClaims.mockResolvedValue(mockClaims);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = (await getResponseJson(response)) as any[];

    expect(response.status).toBe(200);
    expect(body).toHaveLength(2);
    // First claim - genealogy_group type uses groupProfile.name
    expect(body[0]).toHaveProperty('id', 'claim-1');
    expect(body[0]).toHaveProperty('type', 'genealogy_group');
    expect(body[0]).toHaveProperty('groupName', 'Test Group 1');
    expect(body[0]).toHaveProperty('userName', 'User One');
    // Second claim - new_group type uses proposedName, user name fallback
    expect(body[1]).toHaveProperty('type', 'new_group');
    expect(body[1]).toHaveProperty('groupName', 'My New Group');
    expect(body[1]).toHaveProperty('userName', 'Unknown User'); // Fallback when name is null
  });

  it('should return 500 when getPendingGroupClaims throws error', async () => {
    getServerSession.mockResolvedValue({ user: { id: testAdminId }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(true);
    getPendingGroupClaims.mockRejectedValue(new Error('Database error'));

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(500);
    expect(body).toHaveProperty('error');
  });
});
