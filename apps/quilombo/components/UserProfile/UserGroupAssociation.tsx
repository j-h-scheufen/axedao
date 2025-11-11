'use client';

import { Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/groups/GroupCard';
import { userGroupAtom } from '@/hooks/state/user';

const UserGroupAssociation = () => {
  const { data: group, isLoading } = useAtomValue(userGroupAtom);

  if (isLoading) return <Spinner />;

  return group ? (
    <GroupCard group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};

export default UserGroupAssociation;
