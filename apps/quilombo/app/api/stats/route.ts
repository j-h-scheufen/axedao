import { NextResponse } from 'next/server';

import { fetchPublicStats } from '@/db';
import { rateLimit, getClientIp } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/stats:
 *   get:
 *     summary: Get public platform statistics
 *     description: |
 *       Returns aggregated public statistics about the platform.
 *       Statistics are split into genealogy (capoeira lineage data) and platform (app usage) sections.
 *       No authentication required. Rate limited to 10 requests per minute per IP.
 *     tags:
 *       - Public
 *     responses:
 *       200:
 *         description: Statistics retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 genealogy:
 *                   type: object
 *                   description: Capoeira genealogy statistics
 *                   properties:
 *                     groups:
 *                       type: number
 *                       description: Number of group profiles in the genealogy
 *                     persons:
 *                       type: number
 *                       description: Number of person profiles in the genealogy
 *                 platform:
 *                   type: object
 *                   description: Platform usage statistics
 *                   properties:
 *                     users:
 *                       type: number
 *                       description: Number of active users
 *                     managedGroups:
 *                       type: number
 *                       description: Number of groups with at least one admin
 *                     upcomingEvents:
 *                       type: number
 *                       description: Number of upcoming events
 *                     groupLocations:
 *                       type: number
 *                       description: Number of registered group locations
 *       429:
 *         description: Too many requests - rate limit exceeded
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                 retryAfter:
 *                   type: number
 *                   description: Seconds until rate limit resets
 *       500:
 *         description: Server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */
export async function GET(request: Request) {
  try {
    // Apply rate limiting: 10 requests per minute per IP
    const clientIp = getClientIp(request);
    const rateLimitResult = rateLimit(clientIp, {
      maxRequests: 10,
      windowMs: 60 * 1000, // 1 minute
    });

    // Return 429 if rate limit exceeded
    if (!rateLimitResult.allowed) {
      return NextResponse.json(
        {
          error: 'Too many requests. Please try again later.',
          retryAfter: rateLimitResult.retryAfter,
        },
        {
          status: 429,
          headers: {
            'Retry-After': String(rateLimitResult.retryAfter),
            'X-RateLimit-Limit': '10',
            'X-RateLimit-Remaining': '0',
            'X-RateLimit-Reset': new Date(rateLimitResult.resetAt).toISOString(),
          },
        }
      );
    }

    // Fetch statistics
    const stats = await fetchPublicStats();

    // Return stats with rate limit headers
    return NextResponse.json(stats, {
      status: 200,
      headers: {
        'X-RateLimit-Limit': '10',
        'X-RateLimit-Remaining': String(rateLimitResult.remaining),
        'X-RateLimit-Reset': new Date(rateLimitResult.resetAt).toISOString(),
      },
    });
  } catch (error) {
    console.error('Failed to fetch public stats:', error);
    return NextResponse.json({ error: 'Failed to fetch statistics' }, { status: 500 });
  }
}
