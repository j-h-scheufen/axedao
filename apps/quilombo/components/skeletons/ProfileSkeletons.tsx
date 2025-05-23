import { Skeleton } from "@heroui/skeleton";

import ContactInfoSkeleton from '@/components/skeletons/ContactInfoSkeleton';

export const ProfileSkeleton = () => {
  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Skeleton className="aspect-square h-32 rounded-full" />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center justify-center gap-10 xs:flex-row">
          <div className="text-center xs:text-left">
            <Skeleton className="h-5 mb-3 w-32 rounded-lg" />
            <Skeleton className="h-4 w-3/5 rounded-lg" />
          </div>
          <div className="xs:mb-auto xs:ml-auto">
            <Skeleton className="h-8 w-28 rounded-md" />
          </div>
        </div>
        <ContactInfoSkeleton className="mt-3" />
      </div>
    </div>
  );
};

export const CreateGroupAssociationSkeleton = () => {
  return (
    <div className="max-w-lg">
      <Skeleton className="h-10 max-w-64 rounded-xl mb-3" />
      <Skeleton className="h-14 rounded-xl" />
      <Skeleton className="h-10 rounded-xl mt-5" />
    </div>
  );
};
export default CreateGroupAssociationSkeleton;
