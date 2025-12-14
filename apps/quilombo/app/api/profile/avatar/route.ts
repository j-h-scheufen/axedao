import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchUser, updateUser } from '@/db';
import { generateErrorMessage } from '@/utils';
import { createImageBuffer } from '@/utils/images';
import { pinToGroup, unpinIfNotReferenced } from '@/utils/pinata';

/**
 * Updates or sets the user's avatar.
 * @param request - The request object
 * @param userId - PATH parameter. The id of the user
 * @returns The updated User or 400 or 500
 */
export async function POST(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const user = await fetchUser(session.user.id);
    if (!user) return notFound();

    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const filename: string = `${FILE_PREFIXES.userAvatar}-${session.user.id}`;

    if (!file) {
      return NextResponse.json({ error: 'Invalid input data. No file found.' }, { status: 400 });
    }

    // 1. Save old CID before uploading new file
    const oldAvatar = user.avatar;

    // 2. Upload new file to IPFS
    const imageBuffer = await createImageBuffer(file, 'userAvatar');
    const { cid, error, errorStatus } = await pinToGroup(imageBuffer, filename);

    if (error) {
      return NextResponse.json({ error }, { status: errorStatus ?? 500 });
    }

    // 3. Update user record (removes reference to old CID)
    const updatedUser = await updateUser({ ...user, avatar: cid });

    // 4. Safely unpin old CID (only if not referenced elsewhere, e.g., synced portrait)
    if (oldAvatar && oldAvatar !== cid) {
      await unpinIfNotReferenced(oldAvatar).catch((err) => {
        console.error('Failed to unpin old avatar:', err.message);
        // Don't fail the request - the avatar was successfully updated
      });
    }

    return NextResponse.json(updatedUser);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while updating the user avatar');
    console.error(message);
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}

export async function DELETE() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const user = await fetchUser(session.user.id);
    if (!user) return notFound();

    if (user.avatar) {
      const avatarCid = user.avatar;

      // 1. Update user record first (removes reference to CID)
      const updatedUser = await updateUser({ ...user, avatar: null });

      // 2. Safely unpin (only if not referenced elsewhere, e.g., synced portrait)
      await unpinIfNotReferenced(avatarCid).catch((err) => {
        console.error('Failed to unpin avatar:', err.message);
        // Don't fail the request - the avatar was successfully removed from user
      });

      return NextResponse.json(updatedUser);
    }

    return NextResponse.json(user);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while deleting the user avatar');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      }
    );
  }
}
