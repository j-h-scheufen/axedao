import { countUsers, fetchUsers } from '@/db';
import { NextRequest } from 'next/server';

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const limit = searchParams.get('limit');
  const offset = searchParams.get('offset');
  const searchTerm = searchParams.get('searchTerm');
  const searchBy = searchParams.get('searchBy') as unknown as 'name' | 'nickname' | null;
  const users = await fetchUsers(
    limit ? Number(limit) : undefined,
    offset ? Number(offset) : undefined,
    searchTerm || undefined,
    searchBy || undefined,
  );
  const count = await countUsers();
  return Response.json({ users, count });
}
