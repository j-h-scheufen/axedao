/**
 * API Route Tests: GET /api/groups/countries
 *
 * Tests retrieving distinct country codes where groups exist.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('GET /api/groups/countries', () => {
  let GET: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';
  const testEmail = 'user@example.com';

  const mockCountryCodes = ['US', 'BR', 'PT', 'ES'];

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');

    getServerSession = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

    // Mock database functions
    mockDb = {
      getDistinctCountryCodes: vi.fn().mockResolvedValue(mockCountryCodes),
    };

    (dbModule.getDistinctCountryCodes as typeof mockDb.getDistinctCountryCodes) = mockDb.getDistinctCountryCodes;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: testEmail },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/groups/countries/route');
    GET = routeModule.GET;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Successful Retrieval', () => {
    it('should return list of country codes', async () => {
      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.getDistinctCountryCodes).toHaveBeenCalled();
      expect(body).toEqual({ countryCodes: mockCountryCodes });
    });

    it('should return empty array when no groups exist', async () => {
      mockDb.getDistinctCountryCodes.mockResolvedValue([]);

      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toEqual({ countryCodes: [] });
    });

    it('should return distinct country codes only', async () => {
      const distinctCodes = ['US', 'BR', 'DE'];
      mockDb.getDistinctCountryCodes.mockResolvedValue(distinctCodes);

      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.countryCodes).toHaveLength(3);
      expect(body.countryCodes).toEqual(distinctCodes);
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.getDistinctCountryCodes.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/groups/countries', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Failed to fetch country codes');
    });
  });
});
