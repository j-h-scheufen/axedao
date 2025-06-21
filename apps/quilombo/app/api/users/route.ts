import { isNil, omitBy } from 'lodash';
import { type NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { type SearchParams, searchParamsSchema } from '@/config/validation-schema';
import { searchUsers } from '@/db';
import type { UserSearchResult } from '@/types/model';

/**
 * Route handler for infinite (paginated) user search
 * @param request - The request object
 * @param URLparams - pageSize, offset, searchTerm
 * @returns { data: User[], nextOffset: number }
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const pageSize = Number(searchParams.get('pageSize') || QUERY_DEFAULT_PAGE_SIZE);
  const offset = Number(searchParams.get('offset'));
  const searchTerm = searchParams.get('searchTerm');
  let nextOffset = null;

  let searchOptions: SearchParams;
  try {
    searchOptions = searchParamsSchema.validateSync(omitBy({ pageSize, offset, searchTerm }, isNil));
  } catch (error) {
    console.error('Unable to validate input data', error);
    return NextResponse.json({ error: 'Invalid input data' }, { status: 400 });
  }

  const searchResults = await searchUsers(searchOptions);

  // Calculate nextOffset based on totalCount and offset
  if (searchResults.totalCount > offset + pageSize) {
    nextOffset = offset + pageSize;
  } else if (searchResults.totalCount > offset) {
    nextOffset = searchResults.totalCount;
  } else {
    nextOffset = null;
  }

  // Convert SelectUser to User by excluding updatedAt
  const users = searchResults.rows.map(({ updatedAt, ...user }) => user);

  const result: UserSearchResult = { data: users, totalCount: searchResults.totalCount, nextOffset };
  return Response.json(result);
}
