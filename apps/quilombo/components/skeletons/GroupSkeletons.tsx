import { Skeleton } from '@heroui/react';

import SubsectionHeading from '@/components/SubsectionHeading';
import ContactInfoInputsSkeleton from '@/components/skeletons/ContactInfoInputsSkeleton';
import UserCardSkeleton from '@/components/skeletons/UserCardSkeleton';

export const GroupBannerSkeleton = () => {
  return <Skeleton className="h-[200px] w-full rounded-xl" />;
};

export const GroupDescriptionSkeleton = () => {
  return (
    <div className="text-center text-small text-default-500 xs:text-left mb-5">
      <Skeleton className="w-full h-4 rounded-md mb-3" />
      <Skeleton className="w-full h-4 rounded-md mb-3" />
      <Skeleton className="w-1/2 h-4 rounded-md mb-3" />
    </div>
  );
};

export const GroupMembersSkeleton = () => {
  return <Skeleton className="rounded-large h-60" />;
};

export const GroupFormSkeleton = () => {
  return (
    <div className="max-w-xl">
      <SubsectionHeading>Images</SubsectionHeading>
      <div className="mb-5 md:flex md:gap-5">
        <div className="flex min-w-24 flex-col justify-start gap-2">
          <h4>Logo</h4>
          <Skeleton className="aspect-square h-28 rounded-full" />
        </div>
        <div className="flex flex-1 flex-col gap-2">
          <h4>Banner</h4>
          <div className="h-28 w-full">
            <Skeleton className="block h-28 w-full cursor-pointer rounded-xl" />
          </div>
        </div>
      </div>
      <Skeleton className="h-14 mb-5 rounded-medium" />
      <Skeleton className="h-[100px] mb-10 rounded-medium" />
      <div className="mb-5 max-w-xs">
        <h4 className="mb-2 inline-block text-sm">Founder</h4>
        <UserCardSkeleton />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputsSkeleton />
      <div className="flex flex-col mt-8 md:flex-row items-center gap-5">
        <Skeleton className="h-12 w-full rounded-lg" />
        <Skeleton className="h-12 w-full rounded-lg" />
      </div>
    </div>
  );
};
export default GroupFormSkeleton;
