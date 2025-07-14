'use client';

import { Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/GroupCard';
import { currentUserAtom, currentUserGroupAtom } from '@/hooks/state/currentUser';
import CreateGroupAssociation from '../CreateGroupAssociation';

const ProfileGroupAssociation = () => {
  const currentUser = useAtomValue(currentUserAtom);
  const currentUserGroup = useAtomValue(currentUserGroupAtom);

  if (currentUser.isLoading || currentUserGroup.isLoading) return <Spinner />;

  return currentUserGroup.data ? <GroupCard group={currentUserGroup.data} /> : <CreateGroupAssociation />;
};

export default ProfileGroupAssociation;
