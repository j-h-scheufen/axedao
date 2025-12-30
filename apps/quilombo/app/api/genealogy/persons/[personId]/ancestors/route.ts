import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchAncestorIds, fetchPersonProfile } from '@/db';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/genealogy/persons/{personId}/ancestors:
 *   get:
 *     summary: Get ancestor IDs for a person
 *     description: |
 *       Retrieves all ancestor person IDs by traversing student_of and trained_under relationships
 *       using a recursive query. Useful for displaying lineage chains in the genealogy graph.
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: personId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The starting person's profile ID
 *       - in: query
 *         name: maxDepth
 *         required: false
 *         schema:
 *           type: integer
 *           default: 50
 *           minimum: 1
 *           maximum: 100
 *         description: Maximum depth to traverse the lineage chain
 *     responses:
 *       200:
 *         description: Ancestor IDs retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 ancestorIds:
 *                   type: array
 *                   items:
 *                     type: string
 *                     format: uuid
 *                   description: Array of unique ancestor person profile IDs
 *       401:
 *         description: Unauthorized - user must be logged in
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       404:
 *         description: Starting person profile not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
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
export async function GET(request: NextRequest, { params }: { params: Promise<{ personId: string }> }) {
  // Require authentication - this endpoint is only for logged-in users
  const session = await getServerSession(nextAuthOptions);
  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, please log in' }, { status: 401 });
  }

  // Rate limit: 30 requests per minute (ancestry queries can be expensive)
  const RATE_LIMIT_MAX = 30;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const { personId } = await params;
    const { searchParams } = new URL(request.url);

    // Parse and validate maxDepth parameter
    const maxDepthParam = searchParams.get('maxDepth');
    let maxDepth = 50; // Default
    if (maxDepthParam) {
      const parsed = Number.parseInt(maxDepthParam, 10);
      if (!Number.isNaN(parsed) && parsed >= 1 && parsed <= 100) {
        maxDepth = parsed;
      }
    }

    // Verify the person exists
    const person = await fetchPersonProfile(personId);
    if (!person) {
      return NextResponse.json({ error: 'Person profile not found' }, { status: 404 });
    }

    // Fetch ancestor IDs using recursive CTE
    const ancestorIds = await fetchAncestorIds(personId, { maxDepth });

    const headers = createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX);

    return Response.json({ ancestorIds }, { headers });
  } catch (error) {
    console.error('Error fetching ancestors:', error);
    return NextResponse.json({ error: 'Failed to fetch ancestors' }, { status: 500 });
  }
}
