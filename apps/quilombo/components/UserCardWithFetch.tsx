'use client';

import type { AvatarProps, CardProps } from '@heroui/react';
import type { ReactNode } from 'react';

import { useFetchUser } from '@/query/user';
import UserCardSkeleton from './skeletons/UserCardSkeleton';
import UserCard from './UserCard';

export type UserCardWithFetchProps = CardProps & {
  userId: string;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
};

const UserCardWithFetch = ({ userId, ...props }: UserCardWithFetchProps) => {
  const { data: user, isLoading, isFetching, isError } = useFetchUser(userId);

  // Show skeleton while loading/fetching
  if (isLoading || isFetching) {
    return <UserCardSkeleton />;
  }

  // Handle error or missing user data
  if (isError || !user) {
    return 'Unable to retrieve user';
  }

  return <UserCard user={user} {...props} />;
};

export default UserCardWithFetch;
