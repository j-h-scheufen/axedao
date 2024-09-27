'use client';

import GroupCard from '@/components/GroupCard';
import { useProfileGroup } from '@/store/profile.store';
import CreateGroupAssociation from './CreateGroupAssociation';

const GroupAssociation = () => {
  const group = useProfileGroup();

  return group ? <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} /> : <CreateGroupAssociation />;
};
export default GroupAssociation;
