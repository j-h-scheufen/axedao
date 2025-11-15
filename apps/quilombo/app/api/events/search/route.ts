import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { type EventSearchParamsWithFilters, eventSearchParamsSchema } from '@/config/validation-schema';
import { searchEvents } from '@/db';

/**
 * @openapi
 * /api/events/search:
 *   post:
 *     summary: Search events with filters
 *     description: POST endpoint for searching events with unified filters object
 *     tags:
 *       - Events
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
 *                 description: Search term for event name
 *                 example: "Batizado"
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
 *                   eventTypes:
 *                     type: array
 *                     items:
 *                       type: string
 *                     example: ['batizado', 'workshop']
 *                   startDate:
 *                     type: string
 *                     format: date-time
 *                     example: "2025-01-01T00:00:00.000Z"
 *                   endDate:
 *                     type: string
 *                     format: date-time
 *                     example: "2025-12-31T23:59:59.999Z"
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
 *                     $ref: '#/components/schemas/Event'
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
    let searchParams: EventSearchParamsWithFilters;
    try {
      searchParams = await eventSearchParamsSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      return NextResponse.json({ error: 'Invalid search parameters' }, { status: 400 });
    }

    const { offset = 0, pageSize = QUERY_DEFAULT_PAGE_SIZE, searchTerm, filters } = searchParams;

    // Transform filters object to legacy format for database query
    const legacyParams = {
      offset,
      pageSize,
      searchTerm,
      countryCode: filters?.countryCodes?.[0], // TODO: Support multiple country codes in DB query
      startDate: filters?.startDate ? new Date(filters.startDate) : undefined,
      endDate: filters?.endDate ? new Date(filters.endDate) : undefined,
      // TODO: Add eventTypes filtering when database query supports it
    };

    const searchResults = await searchEvents(legacyParams);

    // Calculate nextOffset based on totalCount and offset
    let nextOffset: number | null = null;
    if (searchResults.totalCount > offset + pageSize) {
      nextOffset = offset + pageSize;
    } else if (searchResults.totalCount > offset) {
      nextOffset = searchResults.totalCount;
    }

    const result = {
      data: searchResults.rows,
      totalCount: searchResults.totalCount,
      nextOffset,
    };

    return Response.json(result);
  } catch (error) {
    console.error('Error searching events:', error);
    return NextResponse.json({ error: 'Failed to search events' }, { status: 500 });
  }
}
