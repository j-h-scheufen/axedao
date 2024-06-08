'use client';

import {
  GroupMember,
  useGroupFounder,
  useGroupLeader,
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
  useIsInitializingGroupAdmins,
  useIsLoadingGroupMembers,
} from '@/store/groupMembers.store';
import { cn } from '@/utils/tailwind';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useEffect, useMemo } from 'react';
import SubsectionHeading from './SubsectionHeading';
import UserCard from './UserCard';
import UsersGrid from './UsersGrid';

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const groupMembersActions = useGroupMembersActions();
  const groupMembers = useGroupMembers();
  const founder = useGroupFounder();
  const leader = useGroupLeader();
  const isInitializingAdmins = useIsInitializingGroupAdmins() || !founder.id;
  const hasMoreMembers = useGroupMembersHasMoreResults();
  const isLoading = useIsLoadingGroupMembers();

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
      <UserCard
        className={cn('w-full', { 'sm:w-60': isInitializingAdmins, 'sm:w-fit': !isInitializingAdmins })}
        user={founder}
        isLoading={isInitializingAdmins}
      />
      {leader?.id && (
        <>
          <SubsectionHeading>Leader</SubsectionHeading>
          <UserCard
            className={cn('w-full', { 'sm:w-60': isInitializingAdmins, 'sm:w-fit': !isInitializingAdmins })}
            user={leader}
            isLoading={isInitializingAdmins}
          />
        </>
      )}
      <SubsectionHeading>Admins</SubsectionHeading>
      <UsersGrid users={admins} emptyContent="No admins found" isLoading={isInitializingAdmins} numSkeletons={4} />
      {/* <AddAdmin groupId={id} /> */}
      <SubsectionHeading>Members</SubsectionHeading>
      <UsersGrid scrollerRef={scrollerRef} users={members} emptyContent="No members found" isLoading={isLoading} />
    </>
  );
};
export default GroupMembers;
