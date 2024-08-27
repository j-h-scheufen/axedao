'use client';

import ContactInfo from '@/components/ContactInfo';
import { Avatar } from '@nextui-org/react';
import { Camera } from 'lucide-react';
import { useParams } from 'next/navigation';
import { useEffect } from 'react';
import ProfileSkeleton from '../../../../../../components/skeletons/ProfileSkeleton';
import { useIsInitializingUser, useUser, useUserActions } from '../store';

const UserProfile = () => {
  const params = useParams();
  const userId = params.userId as string;

  const user = useUser();
  const isLoading = useIsInitializingUser();
  const userActions = useUserActions();

  useEffect(() => {
    if (!userId) return;
    userActions.initializeUser(userId);
  }, [userActions, userId]);

  if (isLoading || !user) return <ProfileSkeleton />;

  const { name, title, avatar, links } = user;

  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src={avatar || undefined}
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center gap-10 xs:flex-row">
          <div className="text-center xs:text-left">
            <h3 className="text-lg font-medium">{name}</h3>
            <div className="text-small capitalize text-default-500 flex items-center gap-2 mt-2">{title}</div>
          </div>
        </div>
        <ContactInfo links={links} />
      </div>
    </div>
  );
};
export default UserProfile;
