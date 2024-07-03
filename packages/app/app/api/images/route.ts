import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { NextRequest } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

export async function POST(request: NextRequest) {
  try {
    const data = await request.formData();
    const file: File | null = data.get('file') as unknown as File;
    const name: string = (data.get('name') as unknown as string) || uuidv4();
    console.log(name, file);
    if (file) {
      const uploadData = new FormData();
      uploadData.append('file', file);
      if (name) uploadData.append('pinataMetadata', JSON.stringify({ name }));
      const res = await axios.post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
        headers: {
          Authorization: `Bearer ${process.env.PINATA_JWT}`,
        },
      });
      const { IpfsHash } = res.data;
      return Response.json({ url: `https://${process.env.NEXT_PUBLIC_PINATA_GATEWAY_URL}/ipfs/${IpfsHash}` });
    } else {
      throw new Error('No image file received.');
    }
  } catch (error) {
    const message = generateErrorMessage(error, 'An unknown error occurred while uploading image');
    return Response.json(
      { error: true, message },
      {
        status: 403,
      },
    );
  }
}
