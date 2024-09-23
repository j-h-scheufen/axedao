import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { isGlobalAdmin, updateGroup } from '@/db';

/**
 * Set group to verified
 * @param request
 * @param param1
 * @returns
 */
export async function PUT(request: NextRequest, { params }: { params: { groupId: string } }) {
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

export async function DELETE(request: NextRequest, { params }: { params: { groupId: string } }) {
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
