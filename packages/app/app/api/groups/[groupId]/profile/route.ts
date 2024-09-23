import { NextRequest } from 'next/server';

import { fetchGroupProfile } from '@/db';
import { generateErrorMessage } from '@/utils';
import { notFound } from 'next/navigation';

/**
 * Returns a GroupProfile object for a given group ID.
 * @param req
 * @param param1
 * @returns
 */
export async function GET(req: NextRequest, { params }: { params: { groupId: string } }) {
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
