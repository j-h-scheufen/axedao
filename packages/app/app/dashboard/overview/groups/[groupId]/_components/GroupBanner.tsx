import ErrorText from '@/components/ErrorText';
import Image from 'next/image';
import { Suspense } from 'react';
import { useGroupProfile, useInitializeGroupError } from '../store/groupProfile.store';
import { GroupBannerSkeleton } from './skeletons';

const GroupBanner = () => {
  const initializeGroupError = useInitializeGroupError();
  const { banner } = useGroupProfile();

  return (
    <Suspense fallback={<GroupBannerSkeleton />}>
      <ErrorText message={initializeGroupError} />
      <div className="relative bottom-5 flex flex-col h-[200px] w-full mt-8 rounded-xl overflow-hidden bg-default-100">
        {banner ? (
          <Image
            src={banner || ''}
            className="h-full w-full object-cover"
            width={800}
            height={400}
            alt="Group banner"
          />
        ) : (
          <span className="text-sm inline-block w-fit m-auto text-default-500">No banner</span>
        )}
      </div>
    </Suspense>
  );
};
export default GroupBanner;
