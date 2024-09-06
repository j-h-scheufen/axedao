'use client';

import { Avatar, AvatarProps } from '@nextui-org/avatar';
import { Card, CardBody, CardProps } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import { UserRoundIcon } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { ForwardedRef, ReactNode, forwardRef } from 'react';

import { User } from '@/types/model';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

export type UserCardProps = CardProps & {
  user?: User | null;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
  isLoading?: boolean;
};
const UserCard = (
  { user, endContent = null, avatarProps, isLoading, ...props }: UserCardProps,
  ref: ForwardedRef<HTMLDivElement | null>,
) => {
  const router = useRouter();
  if (!user || isLoading) return <UserCardSkeleton ref={ref} {...props} />;
  return (
    <Link
      as="div"
      onPress={() => router.push(`/dashboard/overview/users/${user.id}`)}
      className="inline-block cursor-pointer"
    >
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
    </Link>
  );
};
export default forwardRef(UserCard);
