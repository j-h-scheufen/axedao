import { NextRequest } from 'next/server';

import { fetchGroupMembers } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 *
 * @param request
 * @param param1
 * @returns User[]
 */
export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const members = await fetchGroupMembers(groupId);
    return Response.json(members);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
