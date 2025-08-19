import axios from 'axios';

import ENV from '@/config/environment';

type PinningResponse = { cid?: string; error?: string; errorStatus?: ResponseInit['status'] };

export const pinToGroup = async (
  buffer: Buffer,
  name: string,
  replaceCID?: string | null
): Promise<PinningResponse> => {
  const uploadData = new FormData();
  uploadData.append('file', new Blob([buffer]));
  uploadData.append('pinataMetadata', JSON.stringify({ name }));
  uploadData.append('pinataOptions', JSON.stringify({ groupId: ENV.pinataFileGroupId }));

  const cid = await axios
    .post('https://api.pinata.cloud/pinning/pinFileToIPFS', uploadData, {
      headers: {
        Authorization: `Bearer ${ENV.pinataJwt}`,
      },
    })
    .then((res) => res.data.IpfsHash)
    .catch((error) => {
      console.error('Unable to upload file to IPFS', error.message);
      throw error;
    });

  // Delete existing file
  if (replaceCID && replaceCID !== cid) {
    await unpin(replaceCID).catch((error) => {
      console.error('Unable to unpin file', error.message);
      // Don't return an error here, as the new file has been uploaded successfully
    });
  }

  return { cid };
};

export const unpin = async (cid: string): Promise<void> => {
  await axios
    .delete(`https://api.pinata.cloud/pinning/unpin/${cid}`, {
      headers: {
        Authorization: `Bearer ${ENV.pinataJwt}`,
      },
    })
    .catch((error) => {
      console.error('Unable to unpin file', error.message);
      throw error;
    });
};
