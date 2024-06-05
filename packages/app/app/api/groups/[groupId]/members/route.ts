import { NextRequest } from 'next/server';

import { fetchGroupMembers } from '@/db';
import { generateErrorMessage } from '@/utils';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const searchParams = request.nextUrl.searchParams;
    const searchTerm = searchParams.get('searchTerm');
    const limit = searchParams.get('limit');
    const offset = searchParams.get('offset');
    const groupMembers = await fetchGroupMembers(
      groupId,
      limit ? Number(limit) : undefined,
      offset ? Number(offset) : undefined,
      searchTerm ? searchTerm : undefined,
    );
    return Response.json(groupMembers);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return Response.json(
      { error: true, message },
      {
        status: 400,
      },
    );
  }
}
