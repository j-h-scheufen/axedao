import { type NextRequest, NextResponse } from 'next/server';

import { entityTypes } from '@/config/constants';
import { fetchStatementsByEntity } from '@/db';
import type { EntityType } from '@/db/schema/genealogy';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/genealogy/{entityType}/{entityId}/relationships:
 *   get:
 *     summary: Get relationships for an entity
 *     description: Retrieves all statements (relationships) for a person or group, both outgoing and incoming
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: entityType
 *         required: true
 *         schema:
 *           type: string
 *           enum: [person, group]
 *         description: The entity type
 *       - in: path
 *         name: entityId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The entity ID
 *     responses:
 *       200:
 *         description: Relationships found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 outgoing:
 *                   type: array
 *                   description: Statements where this entity is the subject
 *                   items:
 *                     $ref: '#/components/schemas/Statement'
 *                 incoming:
 *                   type: array
 *                   description: Statements where this entity is the object
 *                   items:
 *                     $ref: '#/components/schemas/Statement'
 *       400:
 *         description: Invalid entity type
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
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ entityType: string; entityId: string }> }
) {
  // Rate limit: 60 requests per minute
  const RATE_LIMIT_MAX = 60;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const { entityType, entityId } = await params;

    // Validate entity type
    if (!entityTypes.includes(entityType as EntityType)) {
      return NextResponse.json(
        { error: `Invalid entity type. Must be one of: ${entityTypes.join(', ')}` },
        { status: 400 }
      );
    }

    const relationships = await fetchStatementsByEntity(entityType as EntityType, entityId);

    return Response.json(relationships, {
      headers: createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX),
    });
  } catch (error) {
    console.error('Error fetching relationships:', error);
    return NextResponse.json({ error: 'Failed to fetch relationships' }, { status: 500 });
  }
}
