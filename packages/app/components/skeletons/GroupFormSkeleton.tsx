import { Skeleton } from '@nextui-org/react';
import SubsectionHeading from '../SubsectionHeading';
import ContactInfoInputsSkeleton from './ContactInfoInputsSkeleton';
import ImageUploadSkeleton from './ImageUploadSkeleton';
import UserCardSkeleton from './UserCardSkeleton';

type Props = {};
const GroupFormSkeleton = (props: Props) => {
  return (
    <div className="max-w-xl">
      <SubsectionHeading>Images</SubsectionHeading>
      <div className="mb-5 md:flex md:gap-5">
        <div className="flex min-w-24 flex-col justify-start gap-2">
          <h4>Logo</h4>
          <ImageUploadSkeleton hideButton />
        </div>
        <div className="flex flex-1 flex-col gap-2">
          <h4>Banner</h4>
          <div className="aspect-[4] max-h-24 w-full max-w-sm">
            <Skeleton className="block h-24 w-full cursor-pointer rounded-xl" />
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
