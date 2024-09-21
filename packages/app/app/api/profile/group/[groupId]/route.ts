import { nextAuthOptions } from '@/config/next-auth-options';
import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { fetchUserProfile, updateUser } from '@/db';

export async function POST(req: NextRequest, { params }: { params: { groupId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = params;
    console.log('groupId', groupId);
    console.log('session.user.id', session.user.id);
    await updateUser({ id: session.user.id, groupId });
    const profile = await fetchUserProfile(session.user.id);
    return NextResponse.json(profile);
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while joining group';
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

export async function DELETE() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    await updateUser({ id: session.user.id, groupId: null });
    const profile = await fetchUserProfile(session.user.id);
    return NextResponse.json(profile);
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
