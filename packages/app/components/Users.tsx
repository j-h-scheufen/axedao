'use client';

import { Input } from '@nextui-org/input';
import { isEqual } from 'lodash';
import { Search } from 'lucide-react';
import { useEffect, useRef } from 'react';
import { useDebounce } from 'use-debounce';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import {
  useIsInitialized,
  useIsLoadingUsers,
  useSearchResults,
  useTotalUsers,
  useUserSearchActions,
} from '@/store/user-search.store';
import UsersGrid from './UsersGrid';

const Users = () => {
  const [query, setQuery] = useOverviewQueries();
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const usersActions = useUserSearchActions();
  const users = useSearchResults();
  const totalUsers = useTotalUsers();
  const isLoading = useIsLoadingUsers();
  const isInitialized = useIsInitialized();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const setSearchTerm = (searchTerm: string) => {
    setQuery({ ...query, searchTerm });
  };

  const { searchTerm } = query;

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full md:max-w-sm"
          placeholder="Search"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
          value={searchTerm || ''}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
      </div>
      <div className="flex items-center justify-between">
        {typeof totalUsers === 'number' && (
          <span className="ml-auto text-small text-default-400">{totalUsers} total users</span>
        )}
      </div>
      <UsersGrid users={users} isLoading={isLoading || !isInitialized} />
    </div>
  );
};
export default Users;
