'use client';

import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';

const ProfileGroupAssociation = () => {
  const { data: group, isFetching } = useAtomValue(currentUserGroupAtom);

  if (isFetching) return <Spinner />;

  return group ? (
    <GroupCard className="sm:max-w-100" group={group} />
  ) : (
    <div className="text-default-500 text-sm">You are currently not associated with a group</div>
  );
};

export default ProfileGroupAssociation;
