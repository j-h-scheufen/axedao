'use client';

import { Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';

import GroupCard from '@/components/groups/GroupCard';
import GroupAssociationWizard from '@/components/groups/GroupAssociationWizard';
import { currentUserAtom, currentUserGroupAtom } from '@/hooks/state/currentUser';

const ProfileGroupAssociation = () => {
  const currentUser = useAtomValue(currentUserAtom);
  const currentUserGroup = useAtomValue(currentUserGroupAtom);

  if (currentUser.isLoading || currentUserGroup.isLoading) return <Spinner />;

  return currentUserGroup.data ? <GroupCard group={currentUserGroup.data} /> : <GroupAssociationWizard />;
};

export default ProfileGroupAssociation;
