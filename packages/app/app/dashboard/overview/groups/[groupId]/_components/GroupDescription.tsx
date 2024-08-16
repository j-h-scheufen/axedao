import SubsectionHeading from '@/components/SubsectionHeading';
import { useGroupProfile, useIsInitializingGroupProfile } from '../store/groupProfile.store';
import { GroupDescriptionSkeleton } from './skeletons';

const GroupDescription = () => {
  const { description } = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  if (isLoading) return <GroupDescriptionSkeleton />;

  const hasNoDescription = !isLoading && !description;
  if (hasNoDescription) return null;
  return (
    <>
      <SubsectionHeading className="mt-0 text-default-400 mb-2">Description</SubsectionHeading>
      <p className="text-center text-small text-default-500 xs:text-left mb-5">{description}</p>
    </>
  );
};
export default GroupDescription;