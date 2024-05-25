'use client';

import { useEffect } from 'react';
import { Input } from '@nextui-org/input';
import { Search } from 'lucide-react';
import GroupsGrid from './GroupsGrid';
import { useGroups, useGroupsActions } from '@/store/groups.store';

const Groups = () => {
  const groupsActions = useGroupsActions();
  const groups = useGroups();

  useEffect(() => {
    groupsActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  console.log(groups);

  return (
    <div className="flex flex-col gap-4">
      <div className="flex h-fit items-center justify-between gap-3">
        <Input
          isClearable
          className="w-full md:max-w-sm"
          placeholder="Search by name"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
        />
      </div>
      <div className="flex items-center justify-between">
        <span className="ml-auto text-small text-default-400">75 total groups</span>
      </div>
      <GroupsGrid />
    </div>
  );
};
export default Groups;
