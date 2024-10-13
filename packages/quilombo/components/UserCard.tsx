import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import clsx from 'clsx';
import { UserRoundIcon } from 'lucide-react';
import { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import { User } from '@/types/model';
import { getImageUrl } from '@/utils';
import UserNameDisplay from './UserNameDisplay';

export type UserCardProps = CardProps & {
  user: User;
  className?: string;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
};

const UserCard = ({ user, className = '', endContent = null, avatarProps }: UserCardProps) => {
  return (
    <Card as={Link} href={`${PATHS.users}/${user.id}`}>
      <CardBody className={clsx('flex flex-row gap-3 p-2', className)}>
        <Avatar
          radius="full"
          size="lg"
          src={getImageUrl(user.avatar)}
          fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
          className="min-w-10"
          {...avatarProps}
        />
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
