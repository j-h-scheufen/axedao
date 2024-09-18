'use client';

import { AvatarProps } from '@nextui-org/avatar';
import { CardProps } from '@nextui-org/card';
import { ReactNode, Suspense } from 'react';

import { useFetchUser } from '@/query/user';
import UserCardSkeleton from './skeletons/UserCardSkeleton';
import UserCard from './UserCard';

export type UserCardDynamicProps = CardProps & {
  userId: string;
  endContent?: ReactNode | null;
  avatarProps?: AvatarProps;
};

const DynamicUserCard = ({ userId, ...props }: UserCardDynamicProps) => {
  const { data: user } = useFetchUser(userId);
  return (
    <>
      <UserCard user={user} {...props} />, Name: {user ? user.name : 'No user'}
    </>
  );
};

const UserCardWithFetch = (props: UserCardDynamicProps) => (
  <Suspense fallback={<UserCardSkeleton {...props} />}>
    <div>ID: {props.userId}</div>
    <DynamicUserCard {...props} />
  </Suspense>
);

export default UserCardWithFetch;
