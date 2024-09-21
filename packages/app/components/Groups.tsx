'use client';

import useGroupsList from '@/hooks/useGroupList';
import { Input } from '@nextui-org/input';
import { Search } from 'lucide-react';
import GroupsGrid from './GroupsGrid';

const Groups = () => {
  const { groups, isLoading, searchTerm, setSearchTerm } = useGroupsList();

  return (
    <div className="flex flex-col gap-4 pt-5">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full md:max-w-sm"
          placeholder="Search by name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={searchTerm || ''}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <GroupsGrid groups={groups} isLoading={isLoading} />
    </div>
  );
};
export default Groups;
