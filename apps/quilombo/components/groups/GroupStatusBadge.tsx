import { Badge, Tooltip } from '@heroui/react';
import { CircleCheckIcon, ShieldCheckIcon } from 'lucide-react';
import type { ReactNode } from 'react';

type Props = {
  verified: boolean;
  claimedBy: string | null;
  children: ReactNode;
};

/**
 * Displays dual-status badge for group verification and claim status
 * Uses overlapping badges: inner circle for verified status, outer ring for claimed status
 */
const GroupStatusBadge = ({ verified, claimedBy, children }: Props) => {
  const isClaimed = claimedBy !== null;

  // Inner badge (verified status) - darker green or gray
  const innerBadge = (
    <Badge
      content={
        verified ? (
          <Tooltip content="Verified Group">
            <CircleCheckIcon className="[&>circle]:fill-primary-600 stroke-default-100" />
          </Tooltip>
        ) : undefined
      }
      placement="top-left"
      isOneChar
      classNames={{
        badge: verified ? 'bg-primary-600 border border-black' : 'bg-default-400 border border-black',
      }}
      showOutline={false}
    >
      {children}
    </Badge>
  );

  // If both statuses are default (not verified, not claimed), show single badge
  if (!verified && !isClaimed) {
    return innerBadge;
  }

  // Outer badge (claimed status) - primary green or gray
  return (
    <Badge
      content={
        isClaimed ? (
          <Tooltip content="Claimed Group">
            <ShieldCheckIcon className="[&>path]:fill-primary stroke-default-100" />
          </Tooltip>
        ) : undefined
      }
      placement="top-left"
      isOneChar
      classNames={{
        badge: isClaimed ? 'bg-primary border border-black' : 'bg-default-300 border border-black',
      }}
      showOutline={false}
    >
      {innerBadge}
    </Badge>
  );
};

export default GroupStatusBadge;
