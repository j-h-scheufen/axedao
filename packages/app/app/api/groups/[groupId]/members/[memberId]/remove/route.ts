import { isGroupAdmin, isGroupMember, removeGroupMember } from '@/db';
import { getToken } from 'next-auth/jwt';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(req: NextRequest, { params }: { params: { groupId: string; memberId: string } }) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const userId = token.sub;
  const { groupId, memberId } = params;
  const isAdmin = await isGroupAdmin(groupId, userId);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Unauthorized, only an admin can perform this action' }, { status: 401 });
  }

  const isMember = await isGroupMember(groupId, memberId);
  if (!isMember) {
    return NextResponse.json(
      { error: 'Only group members can be removed from a group, this user might be a group admin or leader' },
      { status: 400 },
    );
  }

  try {
    await removeGroupMember(memberId);
    return NextResponse.json({ success: true });
  } catch (error) {
    return NextResponse.json(
      { error: 'An internal server error occurred while removing group member' },
      { status: 500 },
    );
  }
}
