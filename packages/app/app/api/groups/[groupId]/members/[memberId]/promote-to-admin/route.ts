import { NextRequest, NextResponse } from 'next/server';

import { addGroupAdmin, isGroupAdmin, isGroupMember } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getToken } from 'next-auth/jwt';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function POST(req: NextRequest, { params }: { params: { groupId: string; memberId: string } }) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const userId = token.sub;
  const { groupId, memberId } = params;
  const isAdmin = await isGroupAdmin(groupId, userId);
  if (!isAdmin) {
    return NextResponse.json({ error: 'Unauthorized, only admins can demote admins' }, { status: 401 });
  }

  const isMember = await isGroupMember(groupId, memberId);
  if (!isMember) {
    return NextResponse.json(
      { error: 'Only group members can be upgraded to admin, this user might be a group admin or leader' },
      { status: 400 },
    );
  }

  try {
    await addGroupAdmin({
      groupId,
      userId: memberId,
    });
    return NextResponse.json({ success: true });
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group members');
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
