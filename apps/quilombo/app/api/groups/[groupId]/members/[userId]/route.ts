import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchGroupMembers, isGroupAdmin, isGroupMember, removeGroupMember } from '@/db';
import type { User } from '@/types/model';

/**
 * Removes the specified user from the group
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @param userId - PATH parameter. The id of the user to remove
 * @returns the updated list of group members as User[]
 */
export async function DELETE(_: NextRequest, { params }: { params: { groupId: string; userId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId, userId: memberId } = params;
  const isAdmin = await isGroupAdmin(groupId, session.user.id);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Missing permissions' }, { status: 403 });
  }

  const isMember = await isGroupMember(groupId, memberId);
  if (!isMember) {
    return NextResponse.json(
      { error: 'Only group members can be removed from a group, this user might be a group admin or leader' },
      { status: 400 }
    );
  }

  try {
    await removeGroupMember(memberId);
    const groupMembers: User[] = await fetchGroupMembers(groupId);
    return NextResponse.json(groupMembers);
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: 'An internal server error occurred while removing group member' },
      { status: 500 }
    );
  }
}
