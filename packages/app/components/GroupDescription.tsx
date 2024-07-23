import { useGroupProfile, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import GroupDescriptionSkeleton from './skeletons/GroupDescriptionSkeleton';

const GroupDescription = () => {
  const { description } = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  if (isLoading) return <GroupDescriptionSkeleton />;

  return <p className="text-center text-small text-default-500 xs:text-left mb-5">{description}</p>;
};
export default GroupDescription;
