import { fetchUserProfileByEmail, updateUser } from '@/db';
import { getServerSession } from 'next-auth';
import { NextRequest } from 'next/server';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function POST(request: NextRequest, { params }: { params: { groupId: string } }) {
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
    const { groupId } = params;
    const { id } = await fetchUserProfileByEmail(session.user.email);
    await updateUser({ id, group_id: groupId });
    return Response.json({ success: true });
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while joining group';
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
