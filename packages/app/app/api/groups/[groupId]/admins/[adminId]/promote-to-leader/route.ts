import { NextRequest, NextResponse } from 'next/server';

import { addGroupAdmin, fetchGroupProfile, isGroupAdmin, updateGroup } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getToken } from 'next-auth/jwt';

export async function POST(req: NextRequest, { params }: { params: { groupId: string; adminId: string } }) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }
  const userId = token.sub;

  const { groupId, adminId } = params;

  const group = await fetchGroupProfile(groupId);

  if (userId !== group?.leader) {
    return Response.json(
      { error: true, message: "Only a leader of a group can promote it's admins to leader" },
      {
        status: 401,
      },
    );
  }

  const isAdmin = await isGroupAdmin(groupId, adminId);

  if (!isAdmin) {
    return Response.json(
      {
        error: true,
        message: 'Only group admins can be demoted to members, this user is not an admin of this group',
      },
      {
        status: 401,
      },
    );
  }

  try {
    // demote user to admin
    await addGroupAdmin({
      groupId,
      userId,
    });
    await updateGroup({ id: groupId, leader: adminId, name: group.name });
    return Response.json({ success: true });
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
