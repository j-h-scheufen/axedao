import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

import { fetchGroupProfile, fetchUserProfileByEmail, isGroupAdmin, removeGroupAdmin } from '@/db';
import { generateErrorMessage } from '@/utils';

export async function POST(request: NextRequest, { params }: { params: { groupId: string; adminId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }
  const { groupId, adminId } = params;

  // Check if user is the group's leader
  const user = await fetchUserProfileByEmail(session.user.email);
  const group = await fetchGroupProfile(groupId);

  if (user?.id !== group?.leader) {
    return Response.json(
      { error: true, message: "Only a leader of a group can demote it's admins to members" },
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
    await removeGroupAdmin({
      groupId,
      userId: adminId,
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
