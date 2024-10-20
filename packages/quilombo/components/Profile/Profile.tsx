'use client';

import { Avatar } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { useAtomValue } from 'jotai';
import { Camera, Edit, MailIcon } from 'lucide-react';
import Link from 'next/link';

import ContactInfo from '@/components/ContactInfo';
import { ProfileSkeleton } from '@/components/skeletons/ProfileSkeletons';
import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { getImageUrl, getUserDisplayName } from '@/utils';

const Profile = () => {
  const { data: user, isFetching } = useAtomValue(currentUserAtom);

  if (!user || isFetching) return <ProfileSkeleton />;

  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src={getImageUrl(user.avatar)}
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center justify-center gap-3 sm:gap-0 sm:justify-between sm:flex-row">
          <div className="text-center sm:text-left">
            <div className="text-small capitalize text-default-500 flex justify-center sm:justify-start sm:mt-2">
              {user.title}
            </div>
            <h3 className="text-lg font-medium">{getUserDisplayName(user)}</h3>
          </div>
          <div className="sm:mb-auto sm:ml-auto">
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
        {user.email && (
          <div className="flex gap-1 items-center text-default-400">
            <MailIcon className="h-4 w-4" />
            <Link
              href={`mailto:${user.email}`}
              className="text-small text-default-400 tracking-tight hover:text-primary"
            >
              {user.email}
            </Link>
          </div>
        )}
        <ContactInfo links={user.links} />
      </div>
    </div>
  );
};
export default Profile;
