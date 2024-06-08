'use client';
import { User } from '@/types/model';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Avatar, AvatarProps } from '@nextui-org/react';
import { UserRoundIcon } from 'lucide-react';
import { ForwardedRef, ReactNode, forwardRef } from 'react';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

export type UserCardProps = CardProps & {
  user?: User;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
  isLoading?: boolean;
};
const UserCard = (
  { user, endContent = null, avatarProps, isLoading, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  if (!user || isLoading) return <UserCardSkeleton ref={ref} {...props} />;
  return (
    <Card ref={ref} {...props}>
      <CardBody className="justify-between">
        <div className="flex gap-3">
          <Avatar
            radius="full"
            size="md"
            src={user?.avatar || ''}
            fallback={<UserRoundIcon className="w-5 h-5 text-default-400" strokeWidth={1.25} />}
            className="min-w-10"
            {...avatarProps}
          />
          <div className="flex-1 flex flex-col items-start justify-center gap-1">
            <h4 className="text-small font-semibold leading-none text-default-600">{user?.name}</h4>
            <h5 className="text-small tracking-tight text-default-400">{user?.email}</h5>
          </div>
          {endContent}
        </div>
      </CardBody>
    </Card>
  );
};
export default forwardRef(UserCard);
