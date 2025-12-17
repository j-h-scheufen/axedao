'use client';

import { Avatar, Card, CardBody } from '@heroui/react';
import { Camera } from 'lucide-react';

import { getImageUrl } from '@/utils';

interface UserProfileCardProps {
  /** User avatar URL/hash */
  avatar?: string | null;
  /** User's capoeira nickname */
  nickname?: string | null;
  /** User's title (mestre, contra-mestre, etc.) */
  title?: string | null;
  /** Label shown above the card */
  label?: string;
  /** Additional className for the wrapper */
  className?: string;
}

/**
 * Displays a user's profile preview card.
 * Shows avatar, title, and nickname in a compact format.
 */
export function UserProfileCard({
  avatar,
  nickname,
  title,
  label = 'Your Profile',
  className = '',
}: UserProfileCardProps) {
  return (
    <div className={className}>
      <div className="text-xs font-medium text-default-500 uppercase tracking-wide mb-2">{label}</div>
      <Card className="bg-default-50 dark:bg-default-100/10">
        <CardBody className="flex flex-row gap-3 p-3">
          <Avatar
            radius="full"
            size="lg"
            src={getImageUrl(avatar)}
            showFallback
            fallback={<Camera className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-12"
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-0.5">
            {title && <div className="text-small capitalize text-default-500">{title}</div>}
            <span className="font-semibold leading-tight text-default-700">
              {nickname || <span className="text-default-400 italic">No nickname</span>}
            </span>
          </div>
        </CardBody>
      </Card>
    </div>
  );
}

export default UserProfileCard;
