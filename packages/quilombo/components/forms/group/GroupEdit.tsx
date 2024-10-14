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
    <div className="flex flex-col">
      <h4>Logo</h4>
      <ImageUpload value={logo} ownerId={groupId} useDynamicMutation={useUpdateLogoMutation} hideButton />
      <h4>Banner</h4>
      <ImageUpload
        value={banner}
        ownerId={groupId}
        useDynamicMutation={useUpdateBannerMutation}
        avatarProps={{ className: 'block h-28 w-full cursor-pointer', radius: 'md' }}
        hideButton
      />
      <GroupForm />
    </div>
  );
};

export default ProfileEdit;
