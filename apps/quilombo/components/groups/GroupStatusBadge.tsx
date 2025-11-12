'use client';

import { Badge, Tooltip } from '@heroui/react';
import type { ReactNode } from 'react';

import GroupStatusIcon from './GroupStatusIcon';

type Props = {
  lastVerifiedAt: Date | null;
  claimedBy: string | null;
  children: ReactNode;
};

/**
 * Displays status badge for group verification and claim status
 * Uses custom SVG icon with two-ring design:
 * - Outer ring: claimed status
 * - Inner circle: verified status
 */
const GroupStatusBadge = ({ lastVerifiedAt, claimedBy, children }: Props) => {
  const isVerified = lastVerifiedAt !== null;
  const isClaimed = claimedBy !== null;

  // Build tooltip text based on status with explanation
  const getTooltipContent = () => {
    const statusText = (() => {
      if (isVerified && isClaimed) return 'Verified & Claimed';
      if (isVerified && !isClaimed) return 'Verified & Unclaimed';
      if (!isVerified && isClaimed) return 'Unverified & Claimed';
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
            <GroupStatusIcon verified={isVerified} claimed={isClaimed} />
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
