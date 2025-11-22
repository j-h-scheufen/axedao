/**
 * API Route Tests: POST /api/users/search
 *
 * Tests user search with filters and pagination.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';
import type { User } from '@/types';

// Mock dependencies BEFORE importing the route handler
vi.mock('next-auth');
vi.mock('@/db');

describe('POST /api/users/search', () => {
  let POST: (request: Request) => Promise<Response>;
  let getServerSession: ReturnType<typeof vi.fn>;
  let mockDb: any;

  const testUserId = 'user-123';
  const testEmail = 'user@example.com';

  const mockUser: User & { updatedAt: Date } = {
    id: 'search-user-1',
    email: 'searchuser@example.com',
    name: 'Search User',
    nickname: 'SearchNick',
    avatar: null,
    walletAddress: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEbC',
    createdAt: new Date('2025-01-01T00:00:00.000Z'),
    updatedAt: new Date('2025-01-02T00:00:00.000Z'),
  };

  const mockSearchResults = {
    rows: [mockUser],
    totalCount: 1,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const nextAuth = await import('next-auth');
    const dbModule = await import('@/db');

    getServerSession = vi.fn();
    (nextAuth.getServerSession as typeof getServerSession) = getServerSession;

    // Mock database functions
    mockDb = {
      searchPublicUsers: vi.fn().mockResolvedValue(mockSearchResults),
    };

    (dbModule.searchPublicUsers as typeof mockDb.searchPublicUsers) = mockDb.searchPublicUsers;

    // Default: authenticated session
    getServerSession.mockResolvedValue({
      user: { id: testUserId, email: testEmail },
      expires: '2025-12-31',
    });

    const routeModule = await import('@/app/api/users/search/route');
    POST = routeModule.POST;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Authentication', () => {
    it('should return 401 when not authenticated', async () => {
      getServerSession.mockResolvedValue(null);

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });

    it('should return 401 when session has no user ID', async () => {
      getServerSession.mockResolvedValue({
        user: {},
        expires: '2025-12-31',
      });

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(401);
      expect(body).toEqual({ error: 'Unauthorized' });
    });
  });

  describe('Validation', () => {
    it('should return 400 when country code is invalid', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({
          filters: { countryCodes: ['USA'] }, // Should be 2 characters
        }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(400);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Country code must be 2 characters');
    });

    it('should accept valid search parameters', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({
          searchTerm: 'test',
          offset: 0,
          pageSize: 10,
        }),
      });

      const response = await POST(request);

      expect(response.status).toBe(200);
    });
  });

  describe('Search Functionality', () => {
    it('should return search results with default pagination', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 25,
        searchTerm: undefined,
        filters: {},
      });
      expect(body).toHaveProperty('data');
      expect(body).toHaveProperty('totalCount');
      expect(body).toHaveProperty('nextOffset');
    });

    it('should search with search term', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ searchTerm: 'john', pageSize: 10 }),
      });

      await POST(request);

      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 10,
        searchTerm: 'john',
        filters: {},
      });
    });

    it('should filter by country codes', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({
          pageSize: 10,
          filters: { countryCodes: ['US', 'BR'] },
        }),
      });

      await POST(request);

      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 10,
        searchTerm: undefined,
        filters: { countryCodes: ['US', 'BR'] },
      });
    });

    it('should filter by hasWallet', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({
          pageSize: 10,
          filters: { hasWallet: true },
        }),
      });

      await POST(request);

      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 10,
        searchTerm: undefined,
        filters: { hasWallet: true },
      });
    });

    it('should apply multiple filters', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({
          searchTerm: 'test',
          pageSize: 10,
          filters: {
            countryCodes: ['US'],
            hasWallet: true,
          },
        }),
      });

      await POST(request);

      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 0,
        pageSize: 10,
        searchTerm: 'test',
        filters: {
          countryCodes: ['US'],
          hasWallet: true,
        },
      });
    });

    it('should return empty results when no users match', async () => {
      mockDb.searchPublicUsers.mockResolvedValue({ rows: [], totalCount: 0 });

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ searchTerm: 'nonexistent' }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.data).toEqual([]);
      expect(body.totalCount).toBe(0);
      expect(body.nextOffset).toBeNull();
    });

    it('should exclude updatedAt from returned users', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body.data[0]).not.toHaveProperty('updatedAt');
      expect(body.data[0]).toHaveProperty('id');
      expect(body.data[0]).toHaveProperty('email');
    });
  });

  describe('Pagination', () => {
    it('should use custom offset and pageSize', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ offset: 20, pageSize: 5 }),
      });

      await POST(request);

      expect(mockDb.searchPublicUsers).toHaveBeenCalledWith({
        offset: 20,
        pageSize: 5,
        searchTerm: undefined,
        filters: {},
      });
    });

    it('should calculate nextOffset when more results exist', async () => {
      mockDb.searchPublicUsers.mockResolvedValue({
        rows: [mockUser],
        totalCount: 100,
      });

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ offset: 0, pageSize: 10 }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBe(10);
    });

    it('should return totalCount as nextOffset when on last partial page', async () => {
      mockDb.searchPublicUsers.mockResolvedValue({
        rows: [mockUser],
        totalCount: 1,
      });

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ offset: 0, pageSize: 10 }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBe(1);
    });

    it('should return null nextOffset when offset equals totalCount', async () => {
      mockDb.searchPublicUsers.mockResolvedValue({
        rows: [],
        totalCount: 10,
      });

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({ offset: 10, pageSize: 10 }),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.nextOffset).toBeNull();
    });
  });

  describe('Response Format', () => {
    it('should return data, totalCount, and nextOffset', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(body).toHaveProperty('data');
      expect(body).toHaveProperty('totalCount');
      expect(body).toHaveProperty('nextOffset');
      expect(Array.isArray(body.data)).toBe(true);
      expect(typeof body.totalCount).toBe('number');
    });

    it('should return user search results with correct fields', async () => {
      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(body.data[0]).toEqual(
        expect.objectContaining({
          id: mockUser.id,
          email: mockUser.email,
          name: mockUser.name,
          nickname: mockUser.nickname,
        })
      );
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.searchPublicUsers.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/users/search', {
        method: 'POST',
        body: JSON.stringify({}),
      });

      const response = await POST(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Failed to search users');
    });
  });
});
