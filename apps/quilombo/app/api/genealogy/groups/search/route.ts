import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { type GenealogyGroupSearchParams, genealogyGroupSearchParamsSchema } from '@/config/validation-schema';
import { searchGroupProfiles } from '@/db';

/**
 * @openapi
 * /api/genealogy/groups/search:
 *   get:
 *     summary: Quick search for group profiles (type-ahead)
 *     description: Lightweight search for use in dropdowns and autocomplete fields. Requires authentication.
 *     tags:
 *       - Genealogy
 *     security:
 *       - session: []
 *     parameters:
 *       - in: query
 *         name: q
 *         required: true
 *         schema:
 *           type: string
 *         description: Search term (minimum 3 characters)
 *     responses:
 *       200:
 *         description: Search results (max 10 items)
 *       400:
 *         description: Search term too short
 *       500:
 *         description: Server error
 *   post:
 *     summary: Search group profiles
 *     description: Search genealogy group profiles with filters and pagination. Requires authentication.
 *     tags:
 *       - Genealogy
 *     security:
 *       - session: []
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
 *                 description: Search term for description, philosophy, or history
 *                 example: "Angola"
 *               filters:
 *                 type: object
 *                 properties:
 *                   style:
 *                     type: string
 *                     enum: [angola, regional, contemporanea, mixed]
 *                     example: "angola"
 *                   isActive:
 *                     type: boolean
 *                     description: Filter by active status
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
 *                     $ref: '#/components/schemas/GroupProfile'
 *                 totalCount:
 *                   type: number
 *                   example: 7
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

/**
 * GET - Lightweight type-ahead search (for dropdowns/autocomplete)
 * Returns simplified results: id, name, style, logo, isActive
 *
 * Query params:
 * - q: search term (required, min 3 chars)
 * - activeOnly: if "true", only returns active groups (default: false)
 */
export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const searchTerm = searchParams.get('q');
    const activeOnly = searchParams.get('activeOnly') === 'true';

    if (!searchTerm || searchTerm.length < 3) {
      return NextResponse.json({ error: 'Search term must be at least 3 characters' }, { status: 400 });
    }

    const searchResults = await searchGroupProfiles({
      offset: 0,
      pageSize: 10, // Limit for type-ahead
      searchTerm,
      isActive: activeOnly ? true : undefined,
    });

    // Return simplified results for type-ahead
    const results = searchResults.rows.map((group) => ({
      id: group.id,
      name: group.name,
      style: group.style,
      logo: group.logo,
      isActive: group.isActive,
    }));

    return Response.json(results);
  } catch (error) {
    console.error('Error searching group profiles:', error);
    return NextResponse.json({ error: 'Failed to search group profiles' }, { status: 500 });
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();

    // Validate request body
    let searchParams: GenealogyGroupSearchParams;
    try {
      searchParams = await genealogyGroupSearchParamsSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      const message =
        error && typeof error === 'object' && 'errors' in error && Array.isArray(error.errors)
          ? error.errors[0]
          : 'Invalid search parameters';
      return NextResponse.json({ error: message }, { status: 400 });
    }

    const { offset = 0, pageSize = QUERY_DEFAULT_PAGE_SIZE, searchTerm, filters } = searchParams;

    const searchResults = await searchGroupProfiles({
      offset,
      pageSize,
      searchTerm,
      style: filters?.style,
      isActive: filters?.isActive,
    });

    // Calculate nextOffset
    let nextOffset: number | null = null;
    if (searchResults.totalCount > offset + pageSize) {
      nextOffset = offset + pageSize;
    }

    return Response.json({
      data: searchResults.rows,
      totalCount: searchResults.totalCount,
      nextOffset,
    });
  } catch (error) {
    console.error('Error searching group profiles:', error);
    return NextResponse.json({ error: 'Failed to search group profiles' }, { status: 500 });
  }
}
