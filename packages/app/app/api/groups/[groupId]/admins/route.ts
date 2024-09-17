import { NextRequest, NextResponse } from 'next/server';

import { fetchGroup, fetchGroupAdminIds } from '@/db';
import { generateErrorMessage } from '@/utils';

export type GroupRolesResponse = {
  adminIds: string[];
  founder: string;
  leader: string;
};

/**
 * Returns the admin IDs, founder, and leader ID of a group
 * @returns GroupRolesResponse
 */
export async function GET(req: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const group = await fetchGroup(groupId);
    if (!group) return NextResponse.json({ error: `Group ID ${groupId} does not exist` }, { status: 404 });

    const adminIds = await fetchGroupAdminIds(groupId);
    return NextResponse.json({ adminIds, founder: group.founder, leader: group.leader });
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group admins');
    return Response.json(
      { error: true, message },
      {
        status: 400,
      },
    );
  }
}
