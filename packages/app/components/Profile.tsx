'use client';

import { Avatar } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Camera, Edit } from 'lucide-react';
import Link from 'next/link';
import { Suspense } from 'react';

import ContactInfo from '@/components/ContactInfo';
import { ProfileSkeleton } from '@/components/skeletons/ProfileSkeletons';
import { PATHS } from '@/config/constants';
import { useProfile } from '@/store/profile.store';
import { getUserDisplayName } from '@/utils';

const Profile = () => {
  const { user, links } = useProfile();

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
          <div className="flex flex-col items-center justify-center gap-5 md:gap-10 xs:flex-row">
            <div className="text-center xs:text-left">
              <h3 className="text-lg font-medium">{getUserDisplayName(user)}</h3>
              <div className="text-small capitalize text-default-500 flex justify-center xs:justify-start gap-2 mt-2">
                {user.title}
              </div>
            </div>
            <div className="xs:mb-auto xs:ml-auto">
              <Button
                as={Link}
                href={`${PATHS.profile}/edit`}
                startContent={<Edit className="h-4 w-4" />}
                size="sm"
                variant="bordered"
              >
                Edit profile
              </Button>
            </div>
          </div>
          <ContactInfo links={links} />
        </div>
      </div>
    </Suspense>
  );
};
export default Profile;
