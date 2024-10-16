'use client';

import { Avatar } from '@nextui-org/avatar';
import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';
import { Camera } from 'lucide-react';

import ContactInfo from '@/components/ContactInfo';
import { userAtom, userAvatarUrlAtom } from '@/hooks/state/user';
import { getUserDisplayName } from '@/utils';

const UserProfile = () => {
  const { data: user, isFetching } = useAtomValue(userAtom);
  const avatarUrl = useAtomValue(userAvatarUrlAtom);

  if (!user || isFetching) return <Spinner />;

  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src={avatarUrl}
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
        <ContactInfo links={user.links} />
      </div>
    </div>
  );
};
export default UserProfile;
