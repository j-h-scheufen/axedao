import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { type GroupSearchParamsWithFilters, groupSearchParamsSchema } from '@/config/validation-schema';
import { searchGroups } from '@/db';
import type { GroupSearchResult } from '@/types/model';

/**
 * @openapi
 * /api/groups/search:
 *   post:
 *     summary: Search groups with filters
 *     description: POST endpoint for searching groups with unified filters object
 *     tags:
 *       - Groups
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
 *                 example: 20
 *               searchTerm:
 *                 type: string
 *                 description: Search term for group name
 *                 example: "Capoeira Brasil"
 *               filters:
 *                 type: object
 *                 description: Search filters
 *                 properties:
 *                   countryCodes:
 *                     type: array
 *                     items:
 *                       type: string
 *                       pattern: ^[A-Z]{2}$
 *                     example: ['BR', 'US', 'PT']
 *                   verified:
 *                     type: boolean
 *                     example: true
 *                   styles:
 *                     type: array
 *                     items:
 *                       type: string
 *                     example: ['Angola', 'Regional']
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
 *                     $ref: '#/components/schemas/Group'
 *                 totalCount:
 *                   type: number
 *                   example: 42
 *                 nextOffset:
 *                   type: number
 *                   nullable: true
 *                   example: 20
 *       400:
 *         description: Invalid request body
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       401:
 *         description: Unauthorized - no active session
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
  // Check for active session
  const session = await getServerSession(nextAuthOptions);
  if (!session?.user?.id) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const body = await request.json();

    // Validate request body
    let searchParams: GroupSearchParamsWithFilters;
    try {
      searchParams = await groupSearchParamsSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      return NextResponse.json({ error: 'Invalid search parameters' }, { status: 400 });
    }

    const { offset = 0, pageSize = QUERY_DEFAULT_PAGE_SIZE, searchTerm, filters } = searchParams;

    const searchResults = await searchGroups({
      offset,
      pageSize,
      searchTerm,
      filters,
    });

    // Calculate nextOffset based on totalCount and offset
    let nextOffset: number | null = null;
    if (searchResults.totalCount > offset + pageSize) {
      nextOffset = offset + pageSize;
    } else if (searchResults.totalCount > offset) {
      nextOffset = searchResults.totalCount;
    }

    const result: GroupSearchResult = {
      data: searchResults.rows,
      totalCount: searchResults.totalCount,
      nextOffset,
    };

    return Response.json(result);
  } catch (error) {
    console.error('Error searching groups:', error);
    return NextResponse.json({ error: 'Failed to search groups' }, { status: 500 });
  }
}
