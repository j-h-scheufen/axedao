import { NextRequest } from 'next/server';

import { fetchGroupProfile } from '@/db';
import { Group } from '@/types/model';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function GET(request: NextRequest, { params }: { params: { groupId: string } }) {
  try {
    const { groupId } = params;
    const groupProfile: Group | null = await fetchGroupProfile(groupId);
    return await Response.json(groupProfile);
  } catch (error) {
    console.log(error);
    // handle error
  }
}
