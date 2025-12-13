import { type NextRequest, NextResponse } from 'next/server';

import { fetchPersonProfile, fetchStatementsByEntity } from '@/db';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/genealogy/persons/{personId}:
 *   get:
 *     summary: Get a person profile by ID
 *     description: Retrieves a single person profile from the genealogy schema with optional relationships
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: personId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The person profile ID
 *       - in: query
 *         name: includeRelationships
 *         required: false
 *         schema:
 *           type: boolean
 *         description: Whether to include relationships (statements) for this person
 *     responses:
 *       200:
 *         description: Person profile found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   $ref: '#/components/schemas/PersonProfile'
 *                 relationships:
 *                   type: object
 *                   properties:
 *                     outgoing:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *                     incoming:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *       404:
 *         description: Person profile not found
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
  // Rate limit: 60 requests per minute
  const RATE_LIMIT_MAX = 60;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const { personId } = await params;
    const { searchParams } = new URL(request.url);
    const includeRelationships = searchParams.get('includeRelationships') === 'true';

    const person = await fetchPersonProfile(personId);

    if (!person) {
      return NextResponse.json({ error: 'Person profile not found' }, { status: 404 });
    }

    const headers = createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX);

    if (includeRelationships) {
      const relationships = await fetchStatementsByEntity('person', personId);
      return Response.json({ ...person, relationships }, { headers });
    }

    return Response.json(person, { headers });
  } catch (error) {
    console.error('Error fetching person profile:', error);
    return NextResponse.json({ error: 'Failed to fetch person profile' }, { status: 500 });
  }
}
