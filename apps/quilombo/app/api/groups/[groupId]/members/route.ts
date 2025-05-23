import type { NextRequest } from 'next/server';

import { fetchGroupMembers } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Returns the members of the specified group
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns the members of the group as User[]
 */
export async function GET(_: NextRequest, { params }: RouteParamsGroup) {
  try {
    const { groupId } = await params;
    const members = await fetchGroupMembers(groupId);
    return Response.json(members);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
