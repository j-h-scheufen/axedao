import { NextRequest } from 'next/server';

import { fetchGroupMembers } from '@/db';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const searchParams = request.nextUrl.searchParams;
    const limit = searchParams.get('limit');
    const offset = searchParams.get('offset');
    const groups = await fetchGroupMembers(
      groupId,
      limit ? Number(limit) : undefined,
      offset ? Number(offset) : undefined,
    );
    return await Response.json(groups);
  } catch (error) {
    console.log(error);
    // handle error
  }
}
