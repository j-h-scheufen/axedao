'use client';

import { Avatar, Skeleton } from '@nextui-org/react';
import { Camera } from 'lucide-react';
import ContactInfoSkeleton from './ContactInfoSkeleton';

type Props = {};
const ProfileSkeleton = (props: Props) => {
  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src="https://images.unsplash.com/broken"
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center justify-center gap-10 xs:flex-row">
          <div className="text-center xs:text-left">
            <Skeleton className="h-3 mb-3 w-32 rounded-lg" />
            <Skeleton className="h-2 w-3/5 rounded-lg" />
          </div>
          <div className="xs:mb-auto xs:ml-auto">
            <Skeleton className="h-8 w-28 rounded-md" />
          </div>
        </div>
        <ContactInfoSkeleton className="mt-3" />
      </div>
    </div>
  );
};
export default ProfileSkeleton;
