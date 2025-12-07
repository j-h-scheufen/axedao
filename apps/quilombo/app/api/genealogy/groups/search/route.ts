import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { type GenealogyGroupSearchParams, genealogyGroupSearchParamsSchema } from '@/config/validation-schema';
import { searchGroupProfiles } from '@/db';

/**
 * @openapi
 * /api/genealogy/groups/search:
 *   post:
 *     summary: Search group profiles
 *     description: Search genealogy group profiles with filters and pagination
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
