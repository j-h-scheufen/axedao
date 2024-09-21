import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { searchUsers } from '@/db';
import { UserSearchResult } from '@/types/model';
import { isNil, omitBy } from 'lodash';
import { NextRequest } from 'next/server';

/**
 * Route handler for inite user search
 * @param request
 * @returns { data: User[], nextOffset: number }
 */
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const limit = Number(searchParams.get('limit') || QUERY_DEFAULT_PAGE_SIZE);
  const offset = Number(searchParams.get('offset'));
  const searchTerm = searchParams.get('searchTerm');
  let nextOffset = null;

  const users = await searchUsers(omitBy({ limit: limit + 1, offset, searchTerm }, isNil));
  // we retrieve one more than the pageSize / limit to determine if there are more results
  if (users.length > limit) {
    nextOffset = offset + limit;
    users.pop();
  }

  const result: UserSearchResult = { data: users, nextOffset };
  return Response.json(result);
}
