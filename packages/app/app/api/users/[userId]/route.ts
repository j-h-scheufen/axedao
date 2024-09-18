import { NextRequest, NextResponse } from 'next/server';

import { fetchUser } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * Returns a User object for a given user ID.
 * @param request
 * @param param1
 * @returns
 */
export async function GET(request: NextRequest, { params }: { params: { userId: string } }) {
  const { userId } = params;

  try {
    const profile = await fetchUser(userId);
    if (!profile) return NextResponse.json({ error: `User ID '${userId}' not found` }, { status: 404 });

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
