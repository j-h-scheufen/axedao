'use client';
import { Skeleton } from '@nextui-org/react';
import SubsectionHeading from '../SubsectionHeading';
import ContactInfoInputsSkeleton from './ContactInfoInputsSkeleton';
import ImageUploadSkeleton from './ImageUploadSkeleton';

const ProfileFormSkeleton = () => {
  return (
    <div className="max-w-lg">
      <SubsectionHeading>General Information</SubsectionHeading>
      <div className="flex flex-col gap-5">
        <ImageUploadSkeleton />
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
