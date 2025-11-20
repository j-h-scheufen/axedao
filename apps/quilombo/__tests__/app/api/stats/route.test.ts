/**
 * API Route Tests: GET /api/stats
 *
 * Tests retrieving public platform statistics with rate limiting.
 */

import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { getResponseJson } from '../../../setup/api-helpers';

// Mock dependencies BEFORE importing the route handler
vi.mock('@/db');
vi.mock('@/utils/rate-limit');

describe('GET /api/stats', () => {
  let GET: (request: Request) => Promise<Response>;
  let mockDb: any;
  let mockRateLimit: any;

  const mockStats = {
    activeUsers: 150,
    totalGroups: 75,
    verifiedGroups: 45,
    upcomingEvents: 12,
  };

  const mockRateLimitAllowed = {
    allowed: true,
    remaining: 9,
    resetAt: Date.now() + 60000,
    retryAfter: 0,
  };

  const mockRateLimitExceeded = {
    allowed: false,
    remaining: 0,
    resetAt: Date.now() + 30000,
    retryAfter: 30,
  };

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();

    const dbModule = await import('@/db');
    const rateLimitModule = await import('@/utils/rate-limit');

    // Mock database functions
    mockDb = {
      fetchPublicStats: vi.fn().mockResolvedValue(mockStats),
    };

    (dbModule.fetchPublicStats as typeof mockDb.fetchPublicStats) = mockDb.fetchPublicStats;

    // Mock rate limit functions
    mockRateLimit = {
      rateLimit: vi.fn().mockReturnValue(mockRateLimitAllowed),
      getClientIp: vi.fn().mockReturnValue('127.0.0.1'),
    };

    (rateLimitModule.rateLimit as typeof mockRateLimit.rateLimit) = mockRateLimit.rateLimit;
    (rateLimitModule.getClientIp as typeof mockRateLimit.getClientIp) = mockRateLimit.getClientIp;

    const routeModule = await import('@/app/api/stats/route');
    GET = routeModule.GET;
  });

  afterEach(() => {
    vi.clearAllMocks();
  });

  describe('Successful Retrieval', () => {
    it('should return statistics with rate limit headers', async () => {
      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(200);
      expect(mockDb.fetchPublicStats).toHaveBeenCalled();
      expect(body).toEqual(mockStats);

      // Check rate limit headers
      expect(response.headers.get('x-ratelimit-limit')).toBe('10');
      expect(response.headers.get('x-ratelimit-remaining')).toBe('9');
      expect(response.headers.get('x-ratelimit-reset')).toBeTruthy();
    });

    it('should call rate limit with client IP', async () => {
      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      await GET(request);

      expect(mockRateLimit.getClientIp).toHaveBeenCalledWith(request);
      expect(mockRateLimit.rateLimit).toHaveBeenCalledWith('127.0.0.1', {
        maxRequests: 10,
        windowMs: 60000,
      });
    });

    it('should return correct statistics structure', async () => {
      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(body).toHaveProperty('activeUsers');
      expect(body).toHaveProperty('totalGroups');
      expect(body).toHaveProperty('verifiedGroups');
      expect(body).toHaveProperty('upcomingEvents');
      expect(typeof body.activeUsers).toBe('number');
      expect(typeof body.totalGroups).toBe('number');
      expect(typeof body.verifiedGroups).toBe('number');
      expect(typeof body.upcomingEvents).toBe('number');
    });
  });

  describe('Rate Limiting', () => {
    it('should return 429 when rate limit exceeded', async () => {
      mockRateLimit.rateLimit.mockReturnValue(mockRateLimitExceeded);

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(429);
      expect(body).toEqual({
        error: 'Too many requests. Please try again later.',
        retryAfter: 30,
      });
      expect(mockDb.fetchPublicStats).not.toHaveBeenCalled();
    });

    it('should include retry headers when rate limited', async () => {
      mockRateLimit.rateLimit.mockReturnValue(mockRateLimitExceeded);

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);

      expect(response.headers.get('retry-after')).toBe('30');
      expect(response.headers.get('x-ratelimit-limit')).toBe('10');
      expect(response.headers.get('x-ratelimit-remaining')).toBe('0');
      expect(response.headers.get('x-ratelimit-reset')).toBeTruthy();
    });

    it('should track different IPs separately', async () => {
      mockRateLimit.getClientIp.mockReturnValue('192.168.1.1');

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      await GET(request);

      expect(mockRateLimit.rateLimit).toHaveBeenCalledWith('192.168.1.1', expect.any(Object));
    });

    it('should update remaining count correctly', async () => {
      mockRateLimit.rateLimit.mockReturnValue({
        ...mockRateLimitAllowed,
        remaining: 5,
      });

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);

      expect(response.headers.get('x-ratelimit-remaining')).toBe('5');
    });
  });

  describe('Error Handling', () => {
    it('should return 500 when database throws error', async () => {
      mockDb.fetchPublicStats.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      const response = await GET(request);
      const body = await getResponseJson(response);

      expect(response.status).toBe(500);
      expect(body).toHaveProperty('error');
      expect(body.error).toBe('Failed to fetch statistics');
    });

    it('should apply rate limit even when database fails', async () => {
      mockDb.fetchPublicStats.mockRejectedValue(new Error('Database error'));

      const request = new Request('http://localhost/api/stats', {
        method: 'GET',
      });

      await GET(request);

      expect(mockRateLimit.rateLimit).toHaveBeenCalled();
    });
  });
});
