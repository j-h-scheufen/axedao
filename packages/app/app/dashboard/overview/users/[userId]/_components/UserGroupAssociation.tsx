'use client';

import GroupCard from '@/components/GroupCard';
import GroupCardSkeleton from '@/components/skeletons/GroupCardSkeleton';
import { useIsInitializingUser, useUser } from '../store';

const UserGroupAssociation = () => {
  const user = useUser();
  const isInitializingUser = useIsInitializingUser();

  const groupCardClassName = 'mx-auto sm:mx-0 md:max-w-80';

  if (isInitializingUser) return <GroupCardSkeleton className={groupCardClassName} />;
  if (!user) return null;

  const { group } = user;

  if (!group) return <div className="text-default-500 text-sm">User has no group association</div>;

  return <GroupCard className={groupCardClassName} group={group} isLoading={isInitializingUser} />;
};
export default UserGroupAssociation;
