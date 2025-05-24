import type { NextRequest } from 'next/server';

import { fetchUser } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';
import type { RouteParamsUser } from '@/types/routes';

/**
 * Returns a User object for a given user ID.
 * @param _ - The request object (not used)
 * @param userId - PATH parameter. The id of the user
 * @returns a User object or 404 if not found
 */
export async function GET(_: NextRequest, { params }: RouteParamsUser) {
  const { userId } = await params;

  try {
    const user = await fetchUser(userId);
    if (!user) return notFound();

    return Response.json(user);
  } catch (error) {
    const message = generateErrorMessage(
      error as Error,
      `An unexpected error occured while fetching user with id ${userId}`
    );
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
