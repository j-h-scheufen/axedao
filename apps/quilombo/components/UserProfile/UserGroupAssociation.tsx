'use client';

import { Spinner } from "@heroui/spinner";
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { userGroupAtom } from '@/hooks/state/user';

const UserGroupAssociation = () => {
  const { data: group, isFetching } = useAtomValue(userGroupAtom);

  if (isFetching) return <Spinner />;

  return group ? (
    <GroupCard group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};

export default UserGroupAssociation;
