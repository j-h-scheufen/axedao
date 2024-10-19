'use client';

import { Skeleton } from '@nextui-org/skeleton';

import SubsectionHeading from '../SubsectionHeading';
import ContactInfoInputsSkeleton from './ContactInfoInputsSkeleton';

const ProfileFormSkeleton = () => {
  return (
    <div className="max-w-lg">
      <SubsectionHeading>General Information</SubsectionHeading>
      <div className="flex flex-col gap-5">
        <div className="flex items-end gap-3">
          <Skeleton className="aspect-square h-32 w-32 rounded-full" />
          <Skeleton className="h-8 w-24 rounded-md" />
        </div>
        <Skeleton className="h-14 rounded-medium" />
        <Skeleton className="h-14 rounded-medium" />
        <Skeleton className="h-14 rounded-medium" />
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <ContactInfoInputsSkeleton />
      <Skeleton className="mt-8 h-10 w-full rounded-medium" />
    </div>
  );
};
export default ProfileFormSkeleton;
