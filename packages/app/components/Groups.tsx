'use client';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import {
  useGroups,
  useGroupsActions,
  useGroupsIsInitialized,
  useIsLoadingGroups,
  useTotalGroups,
} from '@/store/groups.store';
import { Input } from '@nextui-org/input';
import { isEqual } from 'lodash';
import { Search } from 'lucide-react';
import { useEffect, useRef } from 'react';
import { useDebounce } from 'use-debounce';
import GroupsGrid from './GroupsGrid';

const Groups = () => {
  const [query, setQuery] = useOverviewQueries();
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const groupsActions = useGroupsActions();
  const groups = useGroups();
  const totalGroups = useTotalGroups();
  const isLoading = useIsLoadingGroups();
  const isInitialized = useGroupsIsInitialized();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    groupsActions.search(debouncedQuery.searchTerm || '');
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, groupsActions, lastQueryRef]);

  const setSearchTerm = (searchTerm: string) => {
    setQuery({ ...query, searchTerm });
  };

  const { searchTerm } = query;

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
