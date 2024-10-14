import axios from 'axios';
import { fileTypeFromBuffer } from 'file-type';
import { notFound } from 'next/navigation';
import { NextRequest, NextResponse } from 'next/server';
import sharp from 'sharp';

import { FILE_PREFIXES, IMAGE_FORMATS } from '@/config/constants';
import { fetchGroup, updateGroup } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * Updates or sets the group's banner.
 * @param request - The request object
 * @param groupId - PATH parameter. The id of the group
 * @returns The updated group or 400 or 500
 */
export async function POST(request: NextRequest, { params }: { params: { groupId: string } }) {
  const { groupId } = params;

  try {
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const filename: string = `${FILE_PREFIXES.groupBanner}-${groupId}`;

    if (!file) {
      return NextResponse.json({ error: `Invalid input data. No file found.` }, { status: 400 });
    }

    const buffer = await file.arrayBuffer();
    const type = await fileTypeFromBuffer(buffer);
    if (!type || !['image/png', 'image/jpeg', 'image/jpg', 'image/webp'].includes(type.mime)) {
      return NextResponse.json({ error: `Invalid input data. Unsupported image mime-type.` }, { status: 400 });
    }

    // Image processing
    const imageBuffer = await sharp(buffer).resize(IMAGE_FORMATS.groupBanner).webp({ lossless: true }).toBuffer();

    const uploadData = new FormData();
    uploadData.append('file', new Blob([imageBuffer]));
    uploadData.append('pinataMetadata', JSON.stringify({ filename }));
    const IpfsHash = await axios
      .post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
        headers: {
          Authorization: `Bearer ${process.env.PINATA_JWT}`,
        },
      })
      .then((res) => res.data.IpfsHash)
      .catch((error) => {
        console.error('Unable to pin file to IPFS', error.toJSON());
        return NextResponse.json({ error: 'Unable to save group banner' }, { status: 500 });
      });

    // Delete existing banner file before updating DB
    if (group.banner) {
      await axios
        .delete(`https://api.pinata.cloud/pinning/unpin/${group.banner}`, {
          headers: {
            Authorization: `Bearer ${process.env.PINATA_JWT}`,
          },
        })
        .catch((error) => {
          console.error('Unable to unpin file', error.toJSON());
          // Don't return an error here, as the group's banner has been updated successfully
        });
    }

    const updatedGroup = await updateGroup({ ...group, banner: IpfsHash });

    return NextResponse.json(updatedGroup);
  } catch (error) {
    const message = generateErrorMessage(error as Error, 'An unexpected error occured while fetching the user');
    return Response.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
