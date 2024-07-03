import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

import {
  addGroupAdmin,
  fetchGroupAdmins,
  fetchGroupProfile,
  fetchUserProfileByEmail,
  isGroupAdmin,
  updateGroup,
} from '@/db';
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

  const admins = await fetchGroupAdmins(groupId);
  console.log({ admins });

  // Check if user is the group's leader
  const user = await fetchUserProfileByEmail(session.user.email);
  const group = await fetchGroupProfile(groupId);

  if (user?.id !== group?.leader) {
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
      userId: user.id,
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
