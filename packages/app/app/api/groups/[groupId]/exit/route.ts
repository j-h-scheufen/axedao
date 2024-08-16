import { fetchUserProfileByEmail, updateUser } from '@/db';
import { getServerSession } from 'next-auth';

// TODO everything under the api/ route must be protected via middleware.ts to check for user session

export async function POST() {
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
    const userProfile = await fetchUserProfileByEmail(session.user.email);
    if (!userProfile) {
      throw new Error();
    }
    const { id } = userProfile;
    await updateUser({ id, groupId: null });
    return Response.json({ success: true });
  } catch (error) {
    const message = error instanceof Error ? error.message : 'An unexpected server error occurred while exiting group';
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
