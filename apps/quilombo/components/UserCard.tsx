import { Avatar, type AvatarProps } from '@heroui/react';
import { Card, type CardProps, CardBody } from '@heroui/react';
import { Link } from '@heroui/react';
import { Badge } from '@heroui/react';
import clsx from 'clsx';
import { UserRoundIcon } from 'lucide-react';
import type { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import type { User } from '@/types/model';
import { getImageUrl } from '@/utils';
import UserNameDisplay from './UserNameDisplay';

export type UserCardProps = CardProps & {
  user: User;
  className?: string;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
  badge?: {
    content: string | number;
    color?: 'default' | 'primary' | 'secondary' | 'success' | 'warning' | 'danger';
    placement?: 'top-right' | 'top-left' | 'bottom-right' | 'bottom-left';
  };
};

const UserCard = ({ user, className = '', endContent = null, avatarProps, badge }: UserCardProps) => {
  const avatarComponent = (
    <Avatar
      radius="full"
      size="lg"
      src={getImageUrl(user.avatar)}
      fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
      className="min-w-10"
      {...avatarProps}
    />
  );

  return (
    <Card as={Link} href={`${PATHS.users}/${user.id}`}>
      <CardBody className={clsx('flex flex-row gap-3 p-2', className)}>
        {badge ? (
          <Badge content={badge.content} color={badge.color} placement={badge.placement} size="lg">
            {avatarComponent}
          </Badge>
        ) : (
          avatarComponent
        )}
        <div className="flex-1 flex flex-col items-start justify-top gap-1">
          <div className="text-small capitalize text-default-500 flex justify-start">{user.title}</div>
          <UserNameDisplay user={user} />
        </div>
        {endContent}
      </CardBody>
    </Card>
  );
};

export default UserCard;
