import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

import { addGroupAdmin, fetchGroupProfile, fetchUserProfileByEmail, isGroupMember } from '@/db';
import { generateErrorMessage } from '@/utils';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function POST(request: NextRequest, { params }: { params: { groupId: string; memberId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }
  const { groupId, memberId } = params;

  // Check if user is the group's leader
  const user = await fetchUserProfileByEmail(session.user.email);
  const group = await fetchGroupProfile(groupId);

  if (user?.id !== group?.leader) {
    return Response.json(
      { error: true, message: "Only a leader of a group can promote it's members to admin" },
      {
        status: 401,
      },
    );
  }

  const isMember = await isGroupMember(groupId, memberId);

  if (!isMember) {
    return Response.json(
      {
        error: true,
        message: 'Only group members can be upgraded to admin, this user might be a group admin or leader',
      },
      {
        status: 401,
      },
    );
  }

  try {
    await addGroupAdmin({
      groupId,
      userId: memberId,
    });
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
