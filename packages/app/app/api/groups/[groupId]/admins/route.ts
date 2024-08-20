import { NextRequest } from 'next/server';

import { fetchGroupAdmins, fetchGroupProfile, fetchUserProfile } from '@/db';
import { generateErrorMessage } from '@/utils';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    let founder = undefined,
      leader = undefined;
    if (groupProfile.founder) founder = await fetchUserProfile(groupProfile.founder);
    if (groupProfile.leader) leader = await fetchUserProfile(groupProfile.leader);

    const admins = await fetchGroupAdmins(groupId);
    return Response.json({ admins, founder, leader });
  } catch (error) {
    const message = generateErrorMessage(error, 'An unexpected server error occurred while fetching group admins');
    return Response.json(
      { error: true, message },
      {
        status: 400,
      },
    );
  }
}
