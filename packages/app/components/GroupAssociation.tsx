'use client';

import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';
import CreateGroupAssociation from './CreateGroupAssociation';

const GroupAssociation = () => {
  const group = useAtomValue(currentUserGroupAtom);

  return group ? <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} /> : <CreateGroupAssociation />;
};
export default GroupAssociation;
