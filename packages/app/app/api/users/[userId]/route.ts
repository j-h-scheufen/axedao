import { fetchUserProfile } from '@/db';
import { generateErrorMessage } from '@/utils';
import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

export async function GET(request: NextRequest, { params }: { params: { userId: string } }) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authorized' },
      {
        status: 401,
      },
    );
  }

  try {
    const { userId } = params;
    if (!userId) throw new Error('Invalid user id');

    const user = await fetchUserProfile(userId);
    if (!user?.id) throw new Error('Unable to fetch user profile');

    return Response.json(user);
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
