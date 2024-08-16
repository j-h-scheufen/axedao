import ErrorText from '@/components/ErrorText';
import Image from 'next/image';
import { useGroupProfile, useInitializeGroupError, useIsInitializingGroupProfile } from '../store/groupProfile.store';
import { GroupBannerSkeleton } from './skeletons';

const GroupBanner = () => {
  const initializeGroupError = useInitializeGroupError();
  const { banner } = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  return (
    <>
      <ErrorText message={initializeGroupError} />
      <div className="relative bottom-5 h-[200px] w-full mt-8 rounded-xl overflow-hidden bg-default-100">
        {isLoading ? (
          <GroupBannerSkeleton />
        ) : (
          banner && (
            <Image
              src={banner || ''}
              className="h-full w-full object-cover"
              width={800}
              height={400}
              alt="Group banner"
            />
          )
        )}
      </div>
    </>
  );
};
export default GroupBanner;
