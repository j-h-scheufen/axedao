'use client';

import ImageUpload from '@/components/forms/ImageUpload';
import { groupBannerAtom, groupIdAtom, groupLogoAtom } from '@/hooks/state/group';
import { useUpdateBannerMutation, useUpdateLogoMutation } from '@/query/group';
import { useAtomValue } from 'jotai';
import { GroupForm } from '.';

const ProfileEdit = () => {
  const groupId = useAtomValue(groupIdAtom);
  const logo = useAtomValue(groupLogoAtom);
  const banner = useAtomValue(groupBannerAtom);

  if (!groupId) return null;

  return (
    <div className="flex flex-col ">
      <h4 className="mb-1 sm:mb-2">Logo</h4>
      <ImageUpload value={logo} ownerId={groupId} useFileUploadMutation={useUpdateLogoMutation} />
      <h4 className="my-1 sm:my-2">Banner</h4>
      <ImageUpload
        value={banner}
        ownerId={groupId}
        useFileUploadMutation={useUpdateBannerMutation}
        classname="w-full mb-2 sm:mb-4"
        avatarProps={{ radius: 'md' }}
      />
      <GroupForm />
    </div>
  );
};

export default ProfileEdit;
