'use client';

import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import { Suspense } from 'react';

import ContactInfo from '@/components/ContactInfo';
import ProfileSkeleton from '@/components/skeletons/ProfileSkeleton';
import { useLinks, useUser } from '@/store/userProfile.store';
import { getUserDisplayName } from '@/utils';

const UserProfile = () => {
  const links = useLinks();
  const user = useUser();

  return (
    <Suspense fallback={<ProfileSkeleton />}>
      <div className="flex flex-col items-center gap-5 sm:flex-row">
        <Avatar
          showFallback
          src={user.avatar || undefined}
          fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-32 w-full max-w-32"
        />
        <div className="flex flex-1 flex-col gap-3">
          <div className="flex flex-col items-center gap-10 xs:flex-row">
            <div className="text-center xs:text-left">
              <h3 className="text-lg font-medium">{getUserDisplayName(user)}</h3>
              <div className="text-small capitalize text-default-500 flex items-center gap-2 mt-2">{user.title}</div>
            </div>
          </div>
          <ContactInfo links={links} />
        </div>
      </div>
    </Suspense>
  );
};
export default UserProfile;
