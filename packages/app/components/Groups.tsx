'use client';

import {
  useGroups,
  useGroupsActions,
  useGroupsIsInitialized,
  useIsLoadingGroups,
  useTotalGroups,
} from '@/store/groups.store';
import { Input } from '@nextui-org/input';
import { Search } from 'lucide-react';
import { useEffect } from 'react';
import GroupsGrid from './GroupsGrid';

const Groups = () => {
  const groupsActions = useGroupsActions();
  const groups = useGroups();
  const totalGroups = useTotalGroups();
  const isLoading = useIsLoadingGroups();
  const isInitialized = useGroupsIsInitialized();

  useEffect(() => {
    groupsActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className="flex flex-col gap-4 pt-5">
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
        {typeof totalGroups === 'number' && (
          <span className="ml-auto text-small text-default-400">{totalGroups} total groups</span>
        )}
      </div>
      <GroupsGrid groups={groups} isLoading={isLoading || !isInitialized} />
    </div>
  );
};
export default Groups;
