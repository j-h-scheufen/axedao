import { Skeleton } from '@nextui-org/react';

type Props = {};
const GroupBannerSkeleton = (props: Props) => {
  return (
    <div className="relative bottom-5 h-[200px] w-full rounded-xl bg-gradient-to-t from-neutral-900">
      <Skeleton className="absolute right-5 top-5 h-2 w-32 rounded-lg" />
    </div>
  );
};
export default GroupBannerSkeleton;
