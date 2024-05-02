'use client';

import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import LinkInputs from './LinkInputs';
import SubsectionHeading from './SubsectionHeading';
import { Button } from '@nextui-org/button';
import Link from 'next/link';

const GroupForm = () => {
  return (
    <div className="max-w-xl">
      <SubsectionHeading>Images</SubsectionHeading>
      <div className="md:flex md:gap-5">
        <div className="flex min-w-24 flex-col justify-start gap-2">
          <h4>Logo</h4>
          <Avatar
            showFallback
            src="https://images.unsplash.com/broken"
            fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
            className="aspect-square h-24 w-24"
          />
        </div>
        <div className="flex flex-1 flex-col gap-2">
          <h4>Banner</h4>
          <div className="aspect-[4] max-h-24 w-full max-w-sm">
            <Avatar
              showFallback
              src="https://images.unsplash.com/broken"
              fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
              className="block h-full w-full"
              radius="md"
            />
          </div>
        </div>
      </div>
      <SubsectionHeading>Links</SubsectionHeading>
      <LinkInputs />
      <Button as={Link} href="/dashboard/profile" className="mt-8 flex w-full items-center">
        Update group
      </Button>
    </div>
  );
};
export default GroupForm;
