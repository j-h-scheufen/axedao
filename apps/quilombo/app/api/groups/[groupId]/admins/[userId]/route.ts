import { NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { addGroupAdmin, fetchGroupAdminIds, isGroupAdmin, removeGroupAdmin } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getServerSession } from 'next-auth';

/**
 * Adds the specified user as an admin of the group.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @param userId - PATH parameter. The id of the user to add as admin
 * @returns the updated list of group admin IDs as string[]
 */
export async function PUT(request: NextRequest, { params }: { params: { groupId: string; userId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId, userId } = params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Missing permissions' }, { status: 403 });
  }

  try {
    await addGroupAdmin({ groupId, userId });
    const adminIds = await fetchGroupAdminIds(groupId);
    return NextResponse.json(adminIds);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

/**
 * Removes the specified user as an admin of the group.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @param userId - PATH parameter. The id of the user to add as admin
 * @returns the updated list of group admin IDs as string[]
 */
export async function DELETE(request: NextRequest, { params }: { params: { groupId: string; userId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId, userId } = params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Missing permissions' }, { status: 403 });
  }

  const currentAdmins = await fetchGroupAdminIds(groupId);
  if (currentAdmins.length === 1 && currentAdmins.includes(userId)) {
    return NextResponse.json({ error: 'Cannot remove the last admin of the group' }, { status: 403 });
  }

  try {
    await removeGroupAdmin(groupId, userId);
    const adminIds = await fetchGroupAdminIds(groupId);
    return NextResponse.json(adminIds);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
