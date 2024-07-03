import { Skeleton } from '@nextui-org/react';
import SubsectionHeading from '../SubsectionHeading';
import ContactInfoInputsSkeleton from './ContactInfoInputsSkeleton';
import UserCardSkeleton from './UserCardSkeleton';

const GroupFormSkeleton = () => {
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
        <label className="mb-2 inline-block text-sm">Founder</label>
        <UserCardSkeleton />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputsSkeleton />
    </div>
  );
};
export default GroupFormSkeleton;
