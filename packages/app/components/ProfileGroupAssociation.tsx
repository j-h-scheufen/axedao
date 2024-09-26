'use client';

import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';

const UserGroupAssociation = () => {
  const { data: group } = useAtomValue(currentUserGroupAtom);
  return group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};

export default UserGroupAssociation;
