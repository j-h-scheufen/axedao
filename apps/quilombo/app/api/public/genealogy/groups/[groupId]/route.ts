import { type NextRequest, NextResponse } from 'next/server';

import { fetchGroupProfile, fetchStatementsByEntity } from '@/db';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/public/genealogy/groups/{groupId}:
 *   get:
 *     summary: Get a group profile by ID
 *     description: Retrieves a single group profile from the genealogy schema with optional relationships
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: groupId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The group profile ID
 *       - in: query
 *         name: includeRelationships
 *         required: false
 *         schema:
 *           type: boolean
 *         description: Whether to include relationships (statements) for this group
 *     responses:
 *       200:
 *         description: Group profile found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   $ref: '#/components/schemas/GroupProfile'
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
 *         description: Group profile not found
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
export async function GET(request: NextRequest, { params }: { params: Promise<{ groupId: string }> }) {
  // Rate limit: 60 requests per minute
  const RATE_LIMIT_MAX = 60;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const { groupId } = await params;
    const { searchParams } = new URL(request.url);
    const includeRelationships = searchParams.get('includeRelationships') === 'true';

    const group = await fetchGroupProfile(groupId);

    if (!group) {
      return NextResponse.json({ error: 'Group profile not found' }, { status: 404 });
    }

    const headers = createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX);

    if (includeRelationships) {
      const relationships = await fetchStatementsByEntity('group', groupId);
      return Response.json({ data: group, relationships }, { headers });
    }

    return Response.json({ data: group }, { headers });
  } catch (error) {
    console.error('Error fetching group profile:', error);
    return NextResponse.json({ error: 'Failed to fetch group profile' }, { status: 500 });
  }
}
