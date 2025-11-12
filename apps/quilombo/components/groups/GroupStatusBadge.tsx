'use client';

import { Badge, Tooltip } from '@heroui/react';
import type { ReactNode } from 'react';

import GroupStatusIcon from './GroupStatusIcon';

type Props = {
  verified: boolean;
  claimedBy: string | null;
  children: ReactNode;
};

/**
 * Displays status badge for group verification and claim status
 * Uses custom SVG icon with two-ring design:
 * - Outer ring: claimed status
 * - Inner circle: verified status
 */
const GroupStatusBadge = ({ verified, claimedBy, children }: Props) => {
  const isClaimed = claimedBy !== null;

  // Build tooltip text based on status with explanation
  const getTooltipContent = () => {
    const statusText = (() => {
      if (verified && isClaimed) return 'Verified & Claimed';
      if (verified && !isClaimed) return 'Verified & Unclaimed';
      if (!verified && isClaimed) return 'Unverified & Claimed';
      return 'Unverified & Unclaimed';
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
            <GroupStatusIcon verified={verified} claimed={isClaimed} />
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
