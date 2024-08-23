import { NextRequest, NextResponse } from 'next/server';

import { fetchGroupAdmins, fetchGroupProfile, fetchUserProfile } from '@/db';
import { generateErrorMessage } from '@/utils';

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    if (!groupProfile) return NextResponse.json({ error: 'Unable to fetch group profile' }, { status: 404 });

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
