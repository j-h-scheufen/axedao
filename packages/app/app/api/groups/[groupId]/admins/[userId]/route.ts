import { NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { addGroupAdmin, fetchGroupAdminIds, isGroupAdmin, removeGroupAdmin } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getServerSession } from 'next-auth';

export async function PUT(req: NextRequest, { params }: { params: { groupId: string; userId: string } }) {
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

export async function DELETE(req: NextRequest, { params }: { params: { groupId: string; userId: string } }) {
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
    await removeGroupAdmin(groupId, userId);
    const adminIds = await fetchGroupAdminIds(groupId);
    return NextResponse.json(adminIds);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
