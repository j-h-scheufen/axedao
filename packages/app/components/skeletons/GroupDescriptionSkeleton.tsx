import { Skeleton } from '@nextui-org/react';

const GroupDescriptionSkeleton = () => {
  return (
    <div className="text-center text-small text-default-500 xs:text-left mb-5">
      <Skeleton className="w-full h-3 rounded-md mb-3" />
      <Skeleton className="w-full h-3 rounded-md mb-3" />
      <Skeleton className="w-1/2 h-3 rounded-md mb-3" />
    </div>
  );
};
export default GroupDescriptionSkeleton;
