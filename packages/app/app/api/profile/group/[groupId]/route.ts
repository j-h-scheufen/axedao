import { nextAuthOptions } from '@/config/next-auth-options';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { updateUser } from '@/db';

/**
 * Let's the current user join the specified group by setting the user's groupId to the specified groupId.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group to join
 * @returns the updated UserProfile of the logged-in user
 */
export async function PUT(request: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = params;
    const updatedUser = await updateUser({ id: session.user.id, groupId });
    return NextResponse.json(updatedUser);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while joining group';
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

/**
 * Let's the current user leave the specified group by setting the user's groupId to empty.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group to join
 * @returns the updated UserProfile of the logged-in user
 */
export async function DELETE() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const updatedUser = await updateUser({ id: session.user.id, groupId: null });
    return NextResponse.json(updatedUser);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while exiting group';
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
