import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { type UserSearchParamsWithFilters, userSearchParamsSchema } from '@/config/validation-schema';
import { searchPublicUsers } from '@/db';
import type { UserSearchResult } from '@/types/model';

/**
 * @openapi
 * /api/users/search:
 *   post:
 *     summary: Search users with filters
 *     description: POST endpoint for searching users with unified filters object
 *     tags:
 *       - Users
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
 *                 description: Search term for user name
 *                 example: "John Doe"
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
 *                   hasWallet:
 *                     type: boolean
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
 *                     $ref: '#/components/schemas/User'
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
    let searchParams: UserSearchParamsWithFilters;
    try {
      searchParams = await userSearchParamsSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      const message =
        error && typeof error === 'object' && 'errors' in error && Array.isArray(error.errors)
          ? error.errors[0]
          : 'Invalid search parameters';
      return NextResponse.json({ error: message }, { status: 400 });
    }

    const { offset = 0, pageSize = QUERY_DEFAULT_PAGE_SIZE, searchTerm, filters } = searchParams;

    const searchResults = await searchPublicUsers({
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

    // Convert SelectUser to User by excluding updatedAt
    const users = searchResults.rows.map(({ updatedAt, ...user }) => user);

    const result: UserSearchResult = {
      data: users,
      totalCount: searchResults.totalCount,
      nextOffset,
    };

    return Response.json(result);
  } catch (error) {
    console.error('Error searching users:', error);
    return NextResponse.json({ error: 'Failed to search users' }, { status: 500 });
  }
}
