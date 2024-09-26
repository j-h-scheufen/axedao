'use client';

import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';
import CreateGroupAssociation from './CreateGroupAssociation';

const GroupAssociation = () => {
  const { data: group, isFetching } = useAtomValue(currentUserGroupAtom);

  if (isFetching) return <Spinner />;
  return group ? <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} /> : <CreateGroupAssociation />;
};
export default GroupAssociation;
