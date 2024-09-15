import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { updateUser } from '@/db';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function POST() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    await updateUser({ id: session.user.id, groupId: null });
    return Response.json({ success: true });
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
