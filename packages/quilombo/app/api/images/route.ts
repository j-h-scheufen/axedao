import axios from 'axios';
import { NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

import { generateErrorMessage } from '@/utils';

/**
 * Stores the image contained in the request body to IPFS using Pinata.
 * @param request - Multi-part FormData containing the image file and an optional name
 * @returns the IPFS hash of the uploaded image
 */
export async function POST(request: NextRequest) {
  try {
    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const name: string = (data.get('name') as unknown as string) || uuidv4();
    if (!file) {
      return NextResponse.json({ error: `Invalid input data. No file found.` }, { status: 400 });
    } else {
      const uploadData = new FormData();
      uploadData.append('file', file);
      if (name) uploadData.append('pinataMetadata', JSON.stringify({ name }));
      const res = await axios.post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
        headers: {
          Authorization: `Bearer ${process.env.PINATA_JWT}`,
        },
      });
      const { IpfsHash } = res.data;
      return NextResponse.json(IpfsHash);
    }
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
