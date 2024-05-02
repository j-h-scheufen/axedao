'use client';

import { Input } from '@nextui-org/input';
import { Search } from 'lucide-react';
import GroupsGrid from './GroupsGrid';

const Groups = () => {
  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          isClearable
          className="w-full sm:max-w-[44%]"
          placeholder="Search by name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
        />
      </div>
      <div className="flex items-center justify-between">
        <span className="text-small text-default-400">75 total groups</span>
      </div>
      <GroupsGrid />
    </div>
  );
};
export default Groups;
