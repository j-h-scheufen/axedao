'use client';

import GroupCard from '@/components/GroupCard';
import { useGroup } from '@/store/userProfile.store';

const UserGroupAssociation = () => {
  const group = useGroup();
  return group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};

export default UserGroupAssociation;
