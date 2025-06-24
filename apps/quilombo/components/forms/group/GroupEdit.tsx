'use client';

import ImageUpload from '@/components/forms/ImageUpload';
import { GroupLocations } from '@/components/GroupLocations';
import { groupBannerAtom, groupIdAtom, groupLogoAtom } from '@/hooks/state/group';
import { useUpdateBannerMutation, useUpdateLogoMutation } from '@/query/group';
import { Spacer } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { GroupForm } from '.';

const ProfileEdit = () => {
  const groupId = useAtomValue(groupIdAtom);
  const logo = useAtomValue(groupLogoAtom);
  const banner = useAtomValue(groupBannerAtom);

  if (!groupId) return null;

  return (
    <div className="flex flex-col">
      <div className="flex flex-col items-center mb-1 sm:mb-2">
        <h4 className="mb-1 sm:mb-2">Logo</h4>
        <ImageUpload value={logo} ownerId={groupId} useFileUploadMutation={useUpdateLogoMutation} />
        <h4 className="my-1 sm:my-2">Banner</h4>
        <ImageUpload
          value={banner}
          ownerId={groupId}
          useFileUploadMutation={useUpdateBannerMutation}
          classname="w-full"
          avatarProps={{ radius: 'md' }}
        />
      </div>
      <Spacer y={2} />
      <GroupForm />
      <Spacer y={4} />
      <GroupLocations />
    </div>
  );
};

export default ProfileEdit;
