import { NextRequest } from 'next/server';

import { deleteGroup, fetchGroupProfile, fetchUserIdFromEmail, fetchUserProfileByEmail, isGroupAdmin } from '@/db';
import { Group } from '@/types/model';
import { generateErrorMessage } from '@/utils';
import { getServerSession } from 'next-auth';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }

  try {
    const userId = await fetchUserIdFromEmail(session.user.email);
    if (!userId) {
      return Response.json(
        { error: true, message: 'User not found' },
        {
          status: 400,
        },
      );
    }

    const { groupId } = params;
    const groupProfile: Group | null = await fetchGroupProfile(groupId);
    const isAdmin = await isGroupAdmin(groupId, userId);

    return Response.json({ groupProfile, isAdmin });
  } catch (error) {
    console.log(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      },
    );
  }
}

export async function DELETE(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authenticated' },
      {
        status: 401,
      },
    );
  }

  try {
    const user = await fetchUserProfileByEmail(session.user.email);
    if (!user) {
      return Response.json(
        { error: true, message: 'User not found' },
        {
          status: 400,
        },
      );
    }

    const { groupId } = params;
    const group = await fetchGroupProfile(groupId);
    if (group.leader !== user?.id) {
      return Response.json(
        { error: true, message: "Only a group's leader can delete it." },
        {
          status: 500,
        },
      );
    }

    await deleteGroup(groupId);

    return Response.json({ success: true });
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while deleting group') },
      {
        status: 500,
      },
    );
  }
}
