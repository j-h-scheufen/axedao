import { User } from '@/types/model';
import { cn } from '@/utils/tailwind';
import React, { ReactNode, RefObject } from 'react';
import UserCard, { UserCardProps } from './UserCard';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

type Props = {
  users?: User[];
  emptyContent?: ReactNode;
  className?: string;
  userCardProps?: UserCardProps;
  scrollerRef?: RefObject<HTMLElement>;
  isLoading?: boolean;
  numSkeletons?: number;
  userComponent?: React.FC<UserCardProps>;
};
const UsersGrid = ({
  users,
  emptyContent,
  className = '',
  userCardProps,
  scrollerRef,
  isLoading = false,
  numSkeletons = 20,
  userComponent: UserComponent,
}: Props) => {
  return (
    <div className={cn('grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4', className)}>
      {users?.length
        ? users.map((user, i) => {
            if (UserComponent)
              return <UserComponent key={i} {...((userCardProps as UserCardProps) || {})} user={user} />;
            return <UserCard key={i} {...((userCardProps as UserCardProps) || {})} user={user} />;
          })
        : !isLoading && <div className="mb-3 text-small text-default-400">{emptyContent || 'No users to display'}</div>}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden></div>}
      {isLoading &&
        [...Array(numSkeletons)].map((_, i) => (
          <UserCardSkeleton key={i} {...((userCardProps as UserCardProps) || {})} />
        ))}
    </div>
  );
};
export default UsersGrid;
