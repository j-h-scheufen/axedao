import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, updateGroup } from '@/db';

/**
 * Marks the specified group as verified
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns Group - the updated Group
 */
export async function PUT(_: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Missing permission' }, { status: 403 });
  }

  const { groupId } = params;
  const group = await updateGroup({ id: groupId, verified: true });
  return NextResponse.json(group);
}

/**
 * Marks the specified group as unverified
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns Group - the updated Group
 */
export async function DELETE(_: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const isUserGlobalAdmin = await isGlobalAdmin(session.user.id);
  if (!isUserGlobalAdmin) {
    return NextResponse.json({ error: 'Missing permission' }, { status: 403 });
  }

  const { groupId } = params;
  const group = await updateGroup({ id: groupId, verified: false });
  return NextResponse.json(group);
}
