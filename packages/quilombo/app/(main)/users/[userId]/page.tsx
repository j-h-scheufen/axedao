import { dehydrate, HydrationBoundary } from '@tanstack/react-query';
import { notFound } from 'next/navigation';

import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import { UserGroupAssociation, UserProfile, UserProfileClientState } from '@/components/UserProfile';
import { QueryConfig } from '@/config/constants';
import { fetchGroup, fetchUser } from '@/db';
import { QUERY_KEYS } from '@/query';
import { createDefaultQueryClient, getUserDisplayName } from '@/utils';

type Props = { params: { userId: string } };

const UserProfilePage = async ({ params: { userId } }: Props) => {
  if (!userId) throw Error('This page must be placed on a dynamic path containing [userId]');
  const user = await fetchUser(userId);
  const group = user?.groupId ? await fetchGroup(user.groupId) : undefined;
  if (!user) throw notFound();

  const queryClient = createDefaultQueryClient(QueryConfig.staleTimeUser);
  queryClient.setQueryData([QUERY_KEYS.user.getUser, userId], user);
  if (group) queryClient.setQueryData([QUERY_KEYS.group.getGroup], group);
  const dehydratedState = dehydrate(queryClient);
  queryClient.clear(); // should help with memory usage

  return (
    <HydrationBoundary state={dehydratedState}>
      <UserProfileClientState userId={userId}>
        <PageHeading>{getUserDisplayName(user)}</PageHeading>
        <UserProfile />
        <SectionHeading>Group association</SectionHeading>
        <UserGroupAssociation />
      </UserProfileClientState>
    </HydrationBoundary>
  );
};

export default UserProfilePage;
