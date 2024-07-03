'use client';

import { useInitializeGroupError } from '@/store/groupProfile.store';
import Image from 'next/image';
import ErrorText from './ErrorText';
import GroupBannerSkeleton from './skeletons/GroupBannerSkeleton';

type Props = { banner: string | null; isLoading?: boolean };
const GroupBanner = ({ banner, isLoading }: Props) => {
  const initializeGroupError = useInitializeGroupError();

  if (isLoading) return <GroupBannerSkeleton />;

  return (
    <>
      <ErrorText message={initializeGroupError} />
      <div className="relative bottom-5 h-[200px] w-full rounded-xl overflow-hidden">
        {banner && (
          <Image src={banner} className="h-full w-full object-cover" width={800} height={400} alt="Group banner" />
        )}
      </div>
    </>
  );
};
export default GroupBanner;
