'use client';

import CreateGroupAssociation from '@/app/dashboard/profile/_components/CreateGroupAssociation';
import GroupCard from '@/components/GroupCard';
import GroupCardSkeleton from '@/components/skeletons/GroupCardSkeleton';
import { useIsInitializingProfile, useIsProfileInitialized, useProfile } from '../../../../store/profile.store';

const GroupAssociation = () => {
  const profile = useProfile();

  const { groupId, group } = profile;
  const isInitializingProfile = useIsInitializingProfile();
  const isProfileInitialized = useIsProfileInitialized();

  const isLoading = (!groupId && !isProfileInitialized) || isInitializingProfile;

  const groupCardClassName = 'mx-auto sm:mx-0 md:max-w-80';
  if (isInitializingProfile) return <GroupCardSkeleton className={groupCardClassName} />;

  if (isProfileInitialized && !group) return <CreateGroupAssociation isLoading={isLoading} />;

  return group ? (
    <GroupCard className={groupCardClassName} group={group} isLoading={isLoading} />
  ) : (
    <GroupCardSkeleton className={groupCardClassName} />
  );
};
export default GroupAssociation;
