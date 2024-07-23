import { useGroupProfile, useInitializeGroupError, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import Image from 'next/image';
import ErrorText from './ErrorText';
import GroupBannerSkeleton from './skeletons/GroupBannerSkeleton';

const GroupBanner = () => {
  const initializeGroupError = useInitializeGroupError();
  const { banner } = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  if (isLoading) return <GroupBannerSkeleton />;

  return (
    <>
      <ErrorText message={initializeGroupError} />
      <div className="relative bottom-5 h-[200px] w-full mt-8 rounded-xl overflow-hidden bg-gradient-to-t from-neutral-900">
        {banner && (
          <Image src={banner} className="h-full w-full object-cover" width={800} height={400} alt="Group banner" />
        )}
      </div>
    </>
  );
};
export default GroupBanner;
