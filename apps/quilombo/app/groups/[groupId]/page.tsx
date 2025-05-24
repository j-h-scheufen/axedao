import { dehydrate, HydrationBoundary } from '@tanstack/react-query';
import { notFound } from 'next/navigation';

import { GroupProfileClientState, GroupView } from '@/components/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { QueryConfig } from '@/config/constants';
import { fetchGroup, fetchGroupAdminIds, fetchGroupMembers } from '@/db';
import { QUERY_KEYS } from '@/query';
import { createDefaultQueryClient } from '@/utils';
import type { NextPageProps } from '@/app/layout';

const GroupProfilePage = async ({ params }: NextPageProps<{ groupId: string }>) => {
  const { groupId } = await params;
  if (!groupId) throw Error('This page must be placed on a dynamic path containing [groupId]');
  const group = await fetchGroup(groupId);
  const adminIds = await fetchGroupAdminIds(groupId);
  const groupMembers = await fetchGroupMembers(groupId);
  if (!group) throw notFound();

  const queryClient = createDefaultQueryClient(QueryConfig.staleTimeGroup);
  queryClient.setQueryData([QUERY_KEYS.group.getGroup, groupId], group);
  queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins], adminIds);
  queryClient.setQueryData([QUERY_KEYS.group.getGroupMembers], groupMembers);
  const dehydratedState = dehydrate(queryClient);
  queryClient.clear(); // should help with memory usage

  return (
    <HydrationBoundary state={dehydratedState}>
      <GroupProfileClientState groupId={groupId}>
        {/* Repeating relevant attributes from (main) layout  */}
        <div className="px-3">
          <PageHeading>{group.name}</PageHeading>
        </div>
        <GroupView />
      </GroupProfileClientState>
    </HydrationBoundary>
  );
};

export default GroupProfilePage;
