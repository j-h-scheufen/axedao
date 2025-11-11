'use client';

import { Avatar } from '@heroui/react';
import { Camera } from 'lucide-react';

import GroupStatusBadge from '@/components/groups/GroupStatusBadge';

type Props = {
  url: string | undefined;
  verified: boolean;
  claimedBy: string | null;
};

const GroupLogo = ({ url, verified, claimedBy }: Props) => {
  return (
    <GroupStatusBadge verified={verified} claimedBy={claimedBy}>
      <Avatar
        showFallback
        src={url}
        fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="block aspect-square h-full max-h-20 w-full max-w-20 xs:inline-block"
      />
    </GroupStatusBadge>
  );
};

export default GroupLogo;
