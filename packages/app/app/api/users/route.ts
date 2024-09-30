import { isNil, omitBy } from 'lodash';
import { NextRequest, NextResponse } from 'next/server';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { searchParamsSchema } from '@/config/validation-schema';
import { searchUsers } from '@/db';
import { UserSearchResult } from '@/types/model';

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

  let searchOptions;
  try {
    searchOptions = searchParamsSchema.validateSync(omitBy({ pageSize: pageSize + 1, offset, searchTerm }, isNil));
  } catch (error) {
    console.error('Unable to validate input data', error);
    return NextResponse.json({ error: `Invalid input data` }, { status: 400 });
  }

  const users = await searchUsers(searchOptions);
  // we retrieve one more than the pageSize / limit to determine if there are more results
  if (users.length > pageSize) {
    nextOffset = offset + pageSize;
    users.pop();
  }

  const result: UserSearchResult = { data: users, nextOffset };
  return Response.json(result);
}
