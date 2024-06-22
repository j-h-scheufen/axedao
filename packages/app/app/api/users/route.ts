import { NextRequest } from 'next/server';

import { countUsers, fetchUsers } from '@/db';

// TODO everything under the api/route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const limit = searchParams.get('limit');
  const offset = searchParams.get('offset');
  const users = await fetchUsers(limit ? Number(limit) : undefined, offset ? Number(offset) : undefined);
  const count = await countUsers();
  return Response.json({ users, count });
}
