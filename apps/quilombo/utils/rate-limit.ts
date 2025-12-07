/**
 * Simple in-memory rate limiter for API endpoints.
 * For production with multiple instances, consider using Redis-based rate limiting.
 */

interface RateLimitEntry {
  count: number;
  resetAt: number;
}

const rateLimitStore = new Map<string, RateLimitEntry>();

// Clean up expired entries every 5 minutes
const CLEANUP_INTERVAL = 5 * 60 * 1000;
setInterval(() => {
  const now = Date.now();
  for (const [key, entry] of rateLimitStore.entries()) {
    if (entry.resetAt < now) {
      rateLimitStore.delete(key);
    }
  }
}, CLEANUP_INTERVAL);

export interface RateLimitConfig {
  /**
   * Maximum number of requests allowed in the time window
   * @default 10
   */
  maxRequests?: number;
  /**
   * Time window in milliseconds
   * @default 60000 (1 minute)
   */
  windowMs?: number;
}

export interface RateLimitResult {
  allowed: boolean;
  remaining: number;
  resetAt: number;
  retryAfter?: number; // seconds until can retry
}

/**
 * Rate limiter based on IP address or identifier
 * @param identifier - Unique identifier (e.g., IP address)
 * @param config - Rate limit configuration
 * @returns Rate limit result
 */
export function rateLimit(identifier: string, config: RateLimitConfig = {}): RateLimitResult {
  const { maxRequests = 10, windowMs = 60000 } = config;
  const now = Date.now();

  let entry = rateLimitStore.get(identifier);

  // Reset if window has passed
  if (!entry || entry.resetAt < now) {
    entry = {
      count: 1,
      resetAt: now + windowMs,
    };
    rateLimitStore.set(identifier, entry);

    return {
      allowed: true,
      remaining: maxRequests - 1,
      resetAt: entry.resetAt,
    };
  }

  // Increment count
  entry.count++;

  // Check if limit exceeded
  if (entry.count > maxRequests) {
    return {
      allowed: false,
      remaining: 0,
      resetAt: entry.resetAt,
      retryAfter: Math.ceil((entry.resetAt - now) / 1000),
    };
  }

  return {
    allowed: true,
    remaining: maxRequests - entry.count,
    resetAt: entry.resetAt,
  };
}

/**
 * Get client IP address from request headers
 * Handles various proxy configurations (Vercel, Cloudflare, etc.)
 * @param request - Next.js request object
 * @returns IP address or 'unknown'
 */
export function getClientIp(request: Request): string {
  // Try various headers in order of preference
  const forwarded = request.headers.get('x-forwarded-for');
  if (forwarded) {
    return forwarded.split(',')[0].trim();
  }

  const realIp = request.headers.get('x-real-ip');
  if (realIp) {
    return realIp;
  }

  const cfConnectingIp = request.headers.get('cf-connecting-ip');
  if (cfConnectingIp) {
    return cfConnectingIp;
  }

  return 'unknown';
}

/**
 * Creates rate limit headers for HTTP responses
 * @param result - Rate limit result from rateLimit()
 * @param maxRequests - Maximum requests for the X-RateLimit-Limit header
 * @returns Headers object
 */
export function createRateLimitHeaders(result: RateLimitResult, maxRequests: number): HeadersInit {
  const headers: HeadersInit = {
    'X-RateLimit-Limit': String(maxRequests),
    'X-RateLimit-Remaining': String(result.remaining),
    'X-RateLimit-Reset': new Date(result.resetAt).toISOString(),
  };

  if (result.retryAfter !== undefined) {
    headers['Retry-After'] = String(result.retryAfter);
  }

  return headers;
}

/**
 * Applies rate limiting to a request and returns a 429 response if exceeded.
 * Use at the start of API route handlers for consistent rate limiting.
 *
 * @param request - The incoming request
 * @param config - Rate limit configuration
 * @returns null if allowed, or a 429 Response if rate limited
 *
 * @example
 * ```ts
 * export async function GET(request: Request) {
 *   const rateLimited = applyRateLimit(request, { maxRequests: 30, windowMs: 60000 });
 *   if (rateLimited) return rateLimited;
 *   // ... handle request
 * }
 * ```
 */
export function applyRateLimit(
  request: Request,
  config: RateLimitConfig = {}
): { response: Response; result: RateLimitResult } | { response: null; result: RateLimitResult } {
  const { maxRequests = 10, windowMs = 60000 } = config;
  const clientIp = getClientIp(request);
  const result = rateLimit(clientIp, { maxRequests, windowMs });

  if (!result.allowed) {
    return {
      response: Response.json(
        {
          error: 'Too many requests. Please try again later.',
          retryAfter: result.retryAfter,
        },
        {
          status: 429,
          headers: createRateLimitHeaders(result, maxRequests),
        }
      ),
      result,
    };
  }

  return { response: null, result };
}
