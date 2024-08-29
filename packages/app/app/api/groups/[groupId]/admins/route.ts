import { NextRequest, NextResponse } from 'next/server';

import { fetchGroupAdmins, fetchGroupProfile, fetchUserProfile } from '@/db';
import { generateErrorMessage } from '@/utils';

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile = await fetchGroupProfile(groupId);
    if (!groupProfile) return NextResponse.json({ error: 'Unable to fetch group profile' }, { status: 404 });

    const founder = groupProfile.founder ? await fetchUserProfile(groupProfile.founder) : undefined;
    const leader = groupProfile.leader ? await fetchUserProfile(groupProfile.leader) : undefined;

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
