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
  const { data: user, isLoading, isFetching } = useFetchUser(userId);
  return isLoading || isFetching || !user ? <UserCardSkeleton /> : <UserCard user={user} {...props} />;
};

export default UserCardWithFetch;
