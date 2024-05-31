// import { NextRequest } from 'next/server';
import { getServerSession } from 'next-auth/next';
import { authOptions } from '../auth/[...nextauth]/route';
import { fetchUserProfileByEmail } from '@/db';

// TODO everything under the api/route must be protected via middleware.ts to check for user session

export async function GET(/* request: NextRequest */) {
  const session = await getServerSession(authOptions);
  if (!session?.user?.email) {
    // TODO handle error
    return;
  }
  const user = await fetchUserProfileByEmail(session?.user?.email);
  return Response.json(user);
}
