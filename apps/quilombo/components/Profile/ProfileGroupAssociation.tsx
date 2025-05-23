'use client';

import { Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserGroupAtom } from '@/hooks/state/currentUser';
import CreateGroupAssociation from '../CreateGroupAssociation';

const ProfileGroupAssociation = () => {
  const { data: group, isFetching } = useAtomValue(currentUserGroupAtom);

  if (isFetching) return <Spinner />;

  return group ? <GroupCard group={group} /> : <CreateGroupAssociation />;
};

export default ProfileGroupAssociation;
