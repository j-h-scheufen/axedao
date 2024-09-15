'use client';

import GroupCard from '@/components/GroupCard';
import { useUser } from '../store/userDetails.store';

const UserGroupAssociation = () => {
  const user = useUser();

  if (!user) return null;

  return user.group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={user.group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};
export default UserGroupAssociation;
