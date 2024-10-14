import axios from 'axios';
import { fileTypeFromBuffer } from 'file-type';
import { NextRequest, NextResponse } from 'next/server';
import sharp, { ResizeOptions } from 'sharp';
import { v4 as uuidv4 } from 'uuid';

import { generateErrorMessage } from '@/utils';

type ImageType = 'userAvatar' | 'groupLogo' | 'groupBanner';

const FORMATS: Record<ImageType, ResizeOptions> = {
  userAvatar: { width: 300, height: 300 },
  groupLogo: { width: 400, height: 400 },
  groupBanner: { height: 700, fit: 'outside' },
};

/**
 * Stores the image contained in the request body to IPFS using Pinata.
 * @param request - Multi-part FormData containing the image file and an optional name and type fields. The type is used to determine resize options.
 * @returns the IPFS hash of the uploaded image
 */
export async function POST(request: NextRequest) {
  try {
    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const name: string = (data.get('name') as unknown as string) || uuidv4();
    const imageType: ImageType = (data.get('type') as unknown as ImageType) || undefined;

    if (!file) {
      return NextResponse.json({ error: `Invalid input data. No file found.` }, { status: 400 });
    }

    const buffer = await file.arrayBuffer();
    const type = await fileTypeFromBuffer(buffer);
    if (!type || !['image/png', 'image/jpeg', 'image/jpg', 'image/webp'].includes(type.mime)) {
      return NextResponse.json({ error: `Invalid input data. Unsupported image mime-type.` }, { status: 400 });
    }

    const image = await sharp(buffer).resize(FORMATS[imageType]).webp({ lossless: true }).toBuffer();

    const uploadData = new FormData();
    uploadData.append('file', new Blob([image]));
    if (name) uploadData.append('pinataMetadata', JSON.stringify({ name }));
    const res = await axios.post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
      headers: {
        Authorization: `Bearer ${process.env.PINATA_JWT}`,
      },
    });
    const { IpfsHash } = res.data;
    return NextResponse.json(IpfsHash);
  } catch (error) {
    const message = generateErrorMessage(error, 'An unknown error occurred while uploading image');
    return NextResponse.json(
      { error: true, message },
      {
        status: 500,
      },
    );
  }
}
