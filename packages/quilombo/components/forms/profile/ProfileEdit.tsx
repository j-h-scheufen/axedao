'use client';

import { useAtomValue } from 'jotai';

import ImageUpload from '@/components/forms/ImageUpload';
import { currentUserAvatarAtom } from '@/hooks/state/currentUser';
import { useUpdateAvatarMutation } from '@/query/currentUser';
import ProfileForm from './ProfileForm';

const ProfileEdit = () => {
  const avatar = useAtomValue(currentUserAvatarAtom);
  return (
    <div className="flex flex-col">
      <div className="flex justify-center w-full">
        {/* ownerId is ignored in the currentUser avatar mutation, so it can be empty */}
        <ImageUpload value={avatar} ownerId="" useFileUploadMutation={useUpdateAvatarMutation} />
      </div>
      <ProfileForm />
    </div>
  );
};

export default ProfileEdit;
