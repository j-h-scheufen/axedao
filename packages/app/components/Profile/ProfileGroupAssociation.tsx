'use client';

import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';

const ProfileGroupAssociation = () => {
  const { data: group, isFetching } = useAtomValue(currentUserGroupAtom);

  if (isFetching) return <Spinner />;

  return group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};

export default ProfileGroupAssociation;
