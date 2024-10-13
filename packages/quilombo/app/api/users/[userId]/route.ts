import { NextRequest } from 'next/server';

import { fetchUser } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';

/**
 * Returns a User object for a given user ID.
 * @param request - The request object
 * @param userId - PATH parameter. The id of the user
 * @returns a User object or 404 if not found
 */
export async function GET(request: NextRequest, { params }: { params: { userId: string } }) {
  const { userId } = params;

  try {
    const user = await fetchUser(userId);
    if (!user) return notFound();

    return Response.json(user);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while fetching the user');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
