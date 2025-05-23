import { Skeleton } from '@heroui/react';

const ContactInfoInputsSkeleton = () => {
  return (
    <div>
      <div className="grid h-fit w-full grid-cols-1 gap-x-3 gap-y-3 text-small text-default-500 sm:grid-cols-2">
        {[...Array(4)].map((_, i) => (
          <Skeleton key={i} className="h-10 rounded-medium" />
        ))}
      </div>
      <div className="mt-3 flex justify-end gap-3">
        <Skeleton className="h-8 w-24 rounded-md" />
      </div>
    </div>
  );
};
export default ContactInfoInputsSkeleton;
