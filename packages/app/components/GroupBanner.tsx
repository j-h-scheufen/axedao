'use client';

import { useAtomValue } from 'jotai';
import Image, { ImageProps } from 'next/image';
import { Suspense } from 'react';

import { GroupBannerSkeleton } from '@/components/skeletons/GroupSkeletons';
import { groupBannerAtom } from '@/hooks/state/group';

const GroupBanner = (props: Omit<ImageProps, 'src' | 'alt'>) => {
  const banner = useAtomValue(groupBannerAtom);

  return (
    <Suspense fallback={<GroupBannerSkeleton />}>
      <div className="relative bottom-5 flex flex-col h-[200px] w-full mt-8 rounded-xl overflow-hidden bg-default-100">
        {banner ? (
          <Image
            src={banner || ''}
            priority
            className="h-full w-full object-cover"
            width={800}
            height={400}
            alt="Group banner"
            {...props}
          />
        ) : (
          <span className="text-sm inline-block w-fit m-auto text-default-500">No banner</span>
        )}
      </div>
    </Suspense>
  );
};
export default GroupBanner;
