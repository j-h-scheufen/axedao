'use client';

import {
  GroupMember,
  useGroupFounder,
  useGroupLeader,
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
} from '@/store/groupMembers.store';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useEffect, useMemo } from 'react';
import SubsectionHeading from './SubsectionHeading';
import UsersGrid from './UsersGrid';

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const groupMembersActions = useGroupMembersActions();
  const groupMembers = useGroupMembers();
  const founder = useGroupFounder();
  const leader = useGroupLeader();
  const hasMoreMembers = useGroupMembersHasMoreResults();

  useEffect(() => {
    groupMembersActions.initialize(id);
  }, [id, groupMembersActions]);

  const { admins, members } = useMemo(() => {
    const admins: GroupMember[] = [];
    const members: GroupMember[] = [];
    if (groupMembers?.length) {
      groupMembers.forEach((member) => {
        if (member.role === 'member') members.push(member);
        if (member.role === 'admin') admins.push(member);
      });
    }
    return { admins, members };
  }, [groupMembers]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreMembers,
    isEnabled: true,
    shouldUseLoader: true,
    onLoadMore: () => groupMembersActions.loadNextPage(),
  });

  return (
    <>
      <SubsectionHeading>Founder</SubsectionHeading>
      <UsersGrid users={[founder]} />
      {leader?.id && (
        <>
          <SubsectionHeading>Leader</SubsectionHeading>
          <UsersGrid users={[leader]} />
        </>
      )}
      <SubsectionHeading>Admins</SubsectionHeading>
      <UsersGrid users={admins} emptyContent="No admins found" />
      {/* <AddAdmin groupId={id} /> */}
      <SubsectionHeading>Members</SubsectionHeading>
      <UsersGrid scrollerRef={scrollerRef} users={members} emptyContent="No members found" />
    </>
  );
};
export default GroupMembers;
