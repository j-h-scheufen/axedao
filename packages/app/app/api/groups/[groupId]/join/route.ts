import { fetchGroup, updateUser } from '@/db';
import { getToken } from 'next-auth/jwt';
import { NextRequest, NextResponse } from 'next/server';

export async function POST(req: NextRequest, { params }: { params: { groupId: string } }) {
  const token = await getToken({ req });
  if (!token?.sub) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }
  const userId = token.sub;

  try {
    const { groupId } = params;
    await updateUser({ id: userId, groupId });
    const group = await fetchGroup(groupId);
    return NextResponse.json({ group });
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while joining group';
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
