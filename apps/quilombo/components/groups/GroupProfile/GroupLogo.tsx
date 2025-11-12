'use client';

import { Avatar } from '@heroui/react';

import GroupStatusBadge from '@/components/groups/GroupStatusBadge';

type Props = {
  url: string | undefined;
  verified: boolean;
  claimedBy: string | null;
};

const DEFAULT_GROUP_LOGO = '/quilombo-icon-192x192.png';

const GroupLogo = ({ url, verified, claimedBy }: Props) => {
  return (
    <GroupStatusBadge verified={verified} claimedBy={claimedBy}>
      <Avatar src={url || DEFAULT_GROUP_LOGO} className="w-20 h-20" />
    </GroupStatusBadge>
  );
};

export default GroupLogo;
