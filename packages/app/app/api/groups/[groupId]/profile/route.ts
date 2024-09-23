import { NextRequest } from 'next/server';

import { fetchGroupProfile } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';

/**
 * Returns a GroupProfile object for a given group ID.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns the GroupProfile or 404 if not found
 */
export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    if (!groupProfile) return notFound();

    return Response.json(groupProfile);
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      },
    );
  }
}
