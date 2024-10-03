'use client';

import { useAtomValue } from 'jotai';
import Image, { ImageProps } from 'next/image';
import { Suspense } from 'react';

import { GroupBannerSkeleton } from '@/components/skeletons/GroupSkeletons';
import { groupBannerUrlAtom } from '@/hooks/state/group';

const Banner = (props: Omit<ImageProps, 'src' | 'alt'>) => {
  const bannerUrl = useAtomValue(groupBannerUrlAtom);

  return (
    <div className="relative bottom-5 flex flex-col h-[200px] w-full mt-8 rounded-xl overflow-hidden bg-default-100">
      {bannerUrl ? (
        <Image
          src={bannerUrl}
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
  );
};

const GroupBanner = (props: Omit<ImageProps, 'src' | 'alt'>) => (
  <Suspense fallback={<GroupBannerSkeleton />}>
    <Banner {...props} />
  </Suspense>
);

export default GroupBanner;
