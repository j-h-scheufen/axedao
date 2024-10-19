import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES, IMAGE_FORMATS } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchUser, updateUser } from '@/db';
import { generateErrorMessage } from '@/utils';
import { pinToGroup, unpin } from '@/utils/pinata';

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
      return NextResponse.json({ error: `Invalid input data. No file found.` }, { status: 400 });
    }

    const { cid, error, errorStatus } = await pinToGroup(file, filename, IMAGE_FORMATS.userAvatar, user.avatar);

    if (error) {
      return NextResponse.json({ error }, { status: errorStatus ?? 500 });
    }

    const updatedUser = await updateUser({ ...user, avatar: cid });

    return NextResponse.json(updatedUser);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while updating the user avatar');
    console.error(message);
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
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
      await unpin(user.avatar);
      const updatedUser = await updateUser({ ...user, avatar: null });
      return NextResponse.json(updatedUser);
    }

    return NextResponse.json(user);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while deleting the user avatar');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
