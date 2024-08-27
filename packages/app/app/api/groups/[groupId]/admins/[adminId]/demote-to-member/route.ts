import { NextRequest, NextResponse } from 'next/server';

import { isGroupAdmin, removeGroupAdmin } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getToken } from 'next-auth/jwt';

export async function POST(req: NextRequest, { params }: { params: { groupId: string; adminId: string } }) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const userId = token.sub;
  const { groupId, adminId } = params;
  const isAdmin = await isGroupAdmin(groupId, userId);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Unauthorized, only admins can demote admins' }, { status: 401 });
  }

  const isTargetAdmin = await isGroupAdmin(groupId, adminId);
  if (!isTargetAdmin) {
    return NextResponse.json(
      { error: 'Only group admins can be demoted to members, this user is not an admin of this group' },
      { status: 400 },
    );
  }

  try {
    await removeGroupAdmin(groupId, adminId);
    return NextResponse.json({ success: true });
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
