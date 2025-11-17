'use client';

import { Badge, Tooltip } from '@heroui/react';
import type { ReactNode } from 'react';

import GroupStatusIcon from './GroupStatusIcon';

type Props = {
  lastVerifiedAt: Date | null;
  adminCount: number;
  children: ReactNode;
};

/**
 * Displays status badge for group verification and management status
 * Uses custom SVG icon with two-ring design:
 * - Outer ring: management status (actively managed vs awaiting management)
 * - Inner circle: verified status
 */
const GroupStatusBadge = ({ lastVerifiedAt, adminCount, children }: Props) => {
  const isVerified = lastVerifiedAt !== null;
  const isManaged = adminCount > 0;

  // Build tooltip text based on status with explanation
  const getTooltipContent = () => {
    const statusText = (() => {
      if (isVerified && isManaged) return 'Verified & Actively Managed';
      if (isVerified && !isManaged) return 'Verified & Awaiting Management';
      if (!isVerified && isManaged) return 'Unverified & Actively Managed';
      return 'Unverified & Awaiting Management';
    })();

    return (
      <div className="text-center">
        <div className="font-semibold">This group is {statusText}</div>
      </div>
    );
  };

  return (
    <Badge
      content={
        <Tooltip content={getTooltipContent()} placement="right" delay={300}>
          <div className="cursor-help">
            <GroupStatusIcon verified={isVerified} managed={isManaged} />
          </div>
        </Tooltip>
      }
      placement="top-left"
      shape="circle"
      showOutline={false}
      classNames={{
        badge: 'bg-transparent border-none p-0',
      }}
    >
      {children}
    </Badge>
  );
};

export default GroupStatusBadge;
