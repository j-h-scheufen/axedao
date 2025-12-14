'use client';

import { Badge } from '@heroui/react';
import clsx from 'clsx';
import type { PropsWithChildren } from 'react';

type Props = {
  adminCount: number;
};

/**
 * GroupStatusBadge wraps a child element (typically an Avatar) to display
 * the group's management status:
 * - Groups with admins (adminCount > 0): Show green badge indicating active management
 * - Groups without admins (adminCount === 0): Show gray badge indicating unmanaged
 */
const GroupStatusBadge = ({ adminCount, children }: PropsWithChildren<Props>) => {
  const hasAdmins = adminCount > 0;

  return (
    <Badge
      content=""
      shape="circle"
      placement="bottom-right"
      classNames={{
        badge: clsx(
          'w-4 h-4 border-2 border-background',
          hasAdmins ? 'bg-success' : 'bg-default-300' // Green for managed, gray for unmanaged
        ),
      }}
      title={hasAdmins ? 'This group is actively managed' : 'This group has no admins'}
    >
      {children}
    </Badge>
  );
};

export default GroupStatusBadge;
