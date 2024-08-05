import { Skeleton } from '@nextui-org/react';

const CreateGroupAssociationSkeleton = () => {
  return (
    <div className="max-w-lg">
      <Skeleton className="h-10 max-w-64 rounded-xl mb-3" />
      <Skeleton className="h-14 rounded-xl" />
      <Skeleton className="h-10 rounded-xl mt-5" />
    </div>
  );
};
export default CreateGroupAssociationSkeleton;
