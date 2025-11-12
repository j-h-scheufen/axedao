'use client';

import { Avatar } from '@heroui/react';

import GroupStatusBadge from '@/components/groups/GroupStatusBadge';

type Props = {
  url: string | undefined;
  lastVerifiedAt: Date | null;
  claimedBy: string | null;
};

const DEFAULT_GROUP_LOGO = '/quilombo-icon-192x192.png';

const GroupLogo = ({ url, lastVerifiedAt, claimedBy }: Props) => {
  return (
    <GroupStatusBadge lastVerifiedAt={lastVerifiedAt} claimedBy={claimedBy}>
      <Avatar src={url || DEFAULT_GROUP_LOGO} className="w-20 h-20" />
    </GroupStatusBadge>
  );
};

export default GroupLogo;
