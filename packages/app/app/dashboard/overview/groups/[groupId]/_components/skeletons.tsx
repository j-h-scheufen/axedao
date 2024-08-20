import { Skeleton } from '@nextui-org/react';

export const GroupBannerSkeleton = () => {
  return <Skeleton className="h-[200px] w-full rounded-xl"></Skeleton>;
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
