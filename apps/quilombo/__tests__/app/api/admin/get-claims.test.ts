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
  let getPendingClaims: ReturnType<typeof vi.fn>;

  const testAdminId = 'admin-123';
  const mockClaims = [
    {
      id: 'claim-1',
      groupId: 'group-1',
      userId: 'user-1',
      userMessage: 'I am the founder',
      createdAt: new Date(),
      group: { name: 'Test Group 1' },
      user: { name: 'User One', email: 'user1@example.com' },
    },
    {
      id: 'claim-2',
      groupId: 'group-2',
      userId: 'user-2',
      userMessage: 'I lead this group',
      createdAt: new Date(),
      group: { name: 'Test Group 2' },
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
    getPendingClaims = vi.fn();

    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;
    (db.isGlobalAdmin as typeof isGlobalAdmin) = isGlobalAdmin;
    (db.getPendingClaims as typeof getPendingClaims) = getPendingClaims;

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
    getPendingClaims.mockResolvedValue([]);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(200);
    expect(body).toEqual([]);
  });

  it('should return transformed pending claims', async () => {
    getServerSession.mockResolvedValue({ user: { id: testAdminId }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(true);
    getPendingClaims.mockResolvedValue(mockClaims);

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = (await getResponseJson(response)) as any[];

    expect(response.status).toBe(200);
    expect(body).toHaveLength(2);
    expect(body[0]).toHaveProperty('id', 'claim-1');
    expect(body[0]).toHaveProperty('groupName', 'Test Group 1');
    expect(body[0]).toHaveProperty('userName', 'User One');
    expect(body[1]).toHaveProperty('userName', 'Unknown User'); // Fallback when name is null
  });

  it('should return 500 when getPendingClaims throws error', async () => {
    getServerSession.mockResolvedValue({ user: { id: testAdminId }, expires: '2025-12-31' });
    isGlobalAdmin.mockResolvedValue(true);
    getPendingClaims.mockRejectedValue(new Error('Database error'));

    const request = createMockRequest('http://localhost/api/admin/claims', { method: 'GET' });
    const response = await GET(request);
    const body = await getResponseJson(response);

    expect(response.status).toBe(500);
    expect(body).toHaveProperty('error');
  });
});
