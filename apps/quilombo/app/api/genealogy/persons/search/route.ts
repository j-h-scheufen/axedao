import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { type GenealogyPersonSearchParams, genealogyPersonSearchParamsSchema } from '@/config/validation-schema';
import { searchPersonProfiles } from '@/db';
import { applyRateLimit, createRateLimitHeaders } from '@/utils/rate-limit';

/**
 * @openapi
 * /api/genealogy/persons/search:
 *   post:
 *     summary: Search person profiles
 *     description: Search genealogy person profiles with filters and pagination
 *     tags:
 *       - Genealogy
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               offset:
 *                 type: number
 *                 description: Pagination offset
 *                 example: 0
 *               pageSize:
 *                 type: number
 *                 description: Number of results per page
 *                 example: 25
 *               searchTerm:
 *                 type: string
 *                 description: Search term for name, apelido, or bio
 *                 example: "Pastinha"
 *               filters:
 *                 type: object
 *                 properties:
 *                   style:
 *                     type: string
 *                     enum: [angola, regional, contemporanea, mixed]
 *                     example: "angola"
 *                   title:
 *                     type: string
 *                     example: "mestre"
 *                   includeDeceased:
 *                     type: boolean
 *                     description: Include deceased persons (default true)
 *                     example: true
 *     responses:
 *       200:
 *         description: Search results
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/PersonProfile'
 *                 totalCount:
 *                   type: number
 *                   example: 14
 *                 nextOffset:
 *                   type: number
 *                   nullable: true
 *                   example: 25
 *       400:
 *         description: Invalid request body
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
export async function POST(request: NextRequest) {
  // Rate limit: 30 requests per minute
  const RATE_LIMIT_MAX = 30;
  const { response: rateLimitResponse, result: rateLimitResult } = applyRateLimit(request, {
    maxRequests: RATE_LIMIT_MAX,
    windowMs: 60 * 1000,
  });
  if (rateLimitResponse) return rateLimitResponse;

  try {
    const body = await request.json();

    // Validate request body
    let searchParams: GenealogyPersonSearchParams;
    try {
      searchParams = await genealogyPersonSearchParamsSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      const message =
        error && typeof error === 'object' && 'errors' in error && Array.isArray(error.errors)
          ? error.errors[0]
          : 'Invalid search parameters';
      return NextResponse.json({ error: message }, { status: 400 });
    }

    const { offset = 0, pageSize = QUERY_DEFAULT_PAGE_SIZE, searchTerm, filters } = searchParams;

    const searchResults = await searchPersonProfiles({
      offset,
      pageSize,
      searchTerm,
      style: filters?.style,
      title: filters?.title,
      includeDeceased: filters?.includeDeceased,
    });

    // Calculate nextOffset
    let nextOffset: number | null = null;
    if (searchResults.totalCount > offset + pageSize) {
      nextOffset = offset + pageSize;
    }

    return Response.json(
      {
        data: searchResults.rows,
        totalCount: searchResults.totalCount,
        nextOffset,
      },
      { headers: createRateLimitHeaders(rateLimitResult, RATE_LIMIT_MAX) }
    );
  } catch (error) {
    console.error('Error searching person profiles:', error);
    return NextResponse.json({ error: 'Failed to search person profiles' }, { status: 500 });
  }
}
