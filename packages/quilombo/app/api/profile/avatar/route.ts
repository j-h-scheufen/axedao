import axios from 'axios';
import { fileTypeFromBuffer } from 'file-type';
import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchUser, updateUser } from '@/db';
import { generateErrorMessage } from '@/utils';

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

    const buffer = await file.arrayBuffer();
    const type = await fileTypeFromBuffer(buffer);

    console.log('File type', type?.mime);

    if (!type || !['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/svg+xml'].includes(type.mime)) {
      return NextResponse.json({ error: `Invalid input data. Unsupported image mime-type.` }, { status: 400 });
    }

    console.log('Updating user avatar', user.id);
    // Image processing
    // const imageBuffer = await sharp(buffer).resize(IMAGE_FORMATS.userAvatar).webp({ lossless: true }).toBuffer();

    console.log('Uploading user avatar to IPFS');

    const uploadData = new FormData();
    uploadData.append('file', file);
    uploadData.append('pinataMetadata', JSON.stringify({ name: filename }));
    const IpfsHash = await axios
      .post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
        headers: {
          Authorization: `Bearer ${process.env.PINATA_JWT}`,
        },
      })
      .then((res) => res.data.IpfsHash)
      .catch((error) => {
        console.error('Unable to pin file to IPFS', error.message, error.toJSON());
        throw error;
      });

    console.log('Updating user avatar in DB with hash', JSON.stringify(IpfsHash));

    // Delete existing avatar file before updating DB
    if (user.avatar) {
      await axios
        .delete(`https://api.pinata.cloud/pinning/unpin/${user.avatar}`, {
          headers: {
            Authorization: `Bearer ${process.env.PINATA_JWT}`,
          },
        })
        .catch((error) => {
          console.error('Unable to unpin file', error.toJSON());
          // Don't return an error here, as the user's avatar has been updated successfully
        });
    }

    console.log('done');
    const updatedUser = await updateUser({ ...user, avatar: IpfsHash });

    return NextResponse.json(updatedUser);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while updating the user avatar');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
