'use client';

import {
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
  useIsLoadingGroupMembers,
} from '@/store/groupMembers.store';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useEffect } from 'react';
import GroupMemberCard from './GroupMemberCard';
import UsersGrid from './UsersGrid';

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const groupMembersActions = useGroupMembersActions();
  const groupMembers = useGroupMembers();
  const hasMoreMembers = useGroupMembersHasMoreResults();
  const isLoading = useIsLoadingGroupMembers();

  useEffect(() => {
    groupMembersActions.initialize(id);
  }, [groupMembersActions, id]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreMembers,
    isEnabled: true,
    shouldUseLoader: true,
    onLoadMore: () => groupMembersActions.loadNextPage(),
  });

  return (
    <UsersGrid
      scrollerRef={scrollerRef}
      users={groupMembers}
      emptyContent="No members found"
      isLoading={isLoading}
      userComponent={GroupMemberCard}
    />
  );
};
export default GroupMembers;
