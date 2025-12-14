import axios from 'axios';

import ENV from '@/config/environment';
import { isCidReferenced } from '@/db';

type PinningResponse = { cid?: string; error?: string; errorStatus?: ResponseInit['status'] };

/**
 * Uploads a file to IPFS via Pinata.
 *
 * IMPORTANT: This function only uploads - it does NOT handle unpinning replaced files.
 * Callers must handle unpinning AFTER updating their DB record to remove the old reference.
 * Use unpinIfNotReferenced() after the DB update to safely unpin the old CID.
 *
 * Correct sequence for replacing a file:
 * 1. const oldCid = record.image;
 * 2. const { cid } = await pinToGroup(buffer, name);
 * 3. await updateRecord({ image: cid }); // DB no longer references oldCid
 * 4. await unpinIfNotReferenced(oldCid); // Safe to unpin now
 *
 * @param buffer - The file buffer to upload
 * @param name - Name/identifier for the file
 * @returns The new CID or error information
 */
export const pinToGroup = async (buffer: Buffer, name: string): Promise<PinningResponse> => {
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

  return { cid };
};

/**
 * Directly unpins a file from IPFS via Pinata.
 * WARNING: This does NOT check for other references. Use unpinIfNotReferenced for safe unpinning.
 *
 * @param cid - The CID to unpin
 */
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

/**
 * Safely unpins a file from IPFS only if it's not referenced elsewhere in the database.
 * Checks all CID columns (users.avatar, groups.logo/banner, events.image,
 * person_profiles.portrait, group_profiles.logo) before unpinning.
 *
 * @param cid - The CID to potentially unpin
 * @returns True if unpinned, false if still referenced (skipped)
 */
export const unpinIfNotReferenced = async (cid: string): Promise<boolean> => {
  const isReferenced = await isCidReferenced(cid);

  if (isReferenced) {
    console.log(`CID ${cid} is still referenced elsewhere, skipping unpin`);
    return false;
  }

  await unpin(cid);
  return true;
};
