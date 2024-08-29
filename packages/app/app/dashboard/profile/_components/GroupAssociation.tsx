'use client';

import CreateGroupAssociation from '@/app/dashboard/profile/_components/CreateGroupAssociation';
import GroupCard from '@/components/GroupCard';
import { useProfile } from '../../../../store/profile.store';

const GroupAssociation = () => {
  const profile = useProfile();

  return profile.group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={profile.group} />
  ) : (
    <CreateGroupAssociation />
  );
};
export default GroupAssociation;
