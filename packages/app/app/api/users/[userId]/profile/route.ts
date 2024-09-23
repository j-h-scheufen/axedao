import { getServerSession } from 'next-auth';
import { NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchUserProfile } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';

/**
 * Returns a UserProfile for a the specified user ID.
 * @param request - The request object
 * @param userId - PATH parameter. The id of the user
 * @returns a GroupProfile or 404 if not found
 */
export async function GET(request: NextRequest, { params }: { params: { userId: string } }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { userId } = params;
    if (!userId) throw new Error('Invalid user id');

    const profile = await fetchUserProfile(userId);
    if (!profile) return notFound();

    return Response.json(profile);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured whild fetching user');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
