import { countUsers, fetchUsers, searchUsers } from '@/db';
import { isNil, omitBy } from 'lodash';
import { NextRequest } from 'next/server';

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const limit = Number(searchParams.get('limit'));
  const offset = Number(searchParams.get('offset'));
  const searchTerm = searchParams.get('searchTerm');
  const searchBy = searchParams.get('searchBy') as unknown as 'name' | 'nickname' | null;

  let users, count;
  // if any of the search params are present, use the search API
  if (limit || offset || searchTerm || searchBy) {
    users = await searchUsers(omitBy({ limit, offset, searchTerm, searchBy }, isNil));
    count = await countUsers();
  } else {
    users = await fetchUsers();
    count = users.length;
  }

  return Response.json({ users, count });
}
