'use client';

import {
  // useGroupFounder,
  // useGroupLeader,
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
  // useIsInitializingGroupAdmins,
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
  // const founder = useGroupFounder();
  // const leader = useGroupLeader();
  // const isInitializingAdmins = useIsInitializingGroupAdmins() || !founder?.id;
  const hasMoreMembers = useGroupMembersHasMoreResults();
  const isLoading = useIsLoadingGroupMembers();

  useEffect(() => {
    groupMembersActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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
