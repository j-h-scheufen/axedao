'use client';

import useOverview from '@/hooks/useOverview';
import {
  useIsLoadingUsers,
  useTotalUsers,
  useUsers,
  useUsersActions,
  useUsersIsInitialized,
} from '@/store/users.store';
import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/react';
import { isEqual } from 'lodash';
import { Search } from 'lucide-react';
import { useEffect, useRef } from 'react';
import { useDebounce } from 'use-debounce';
import UsersGrid from './UsersGrid';

const searchOptions = [
  {
    value: 'name',
    label: 'Name',
  },
  {
    value: 'nickname',
    label: 'Nickname',
  },
];

const Users = () => {
  const [query, setQuery] = useOverview();
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const usersActions = useUsersActions();
  const users = useUsers();
  const totalUsers = useTotalUsers();
  const isLoading = useIsLoadingUsers();
  const isInitialized = useUsersIsInitialized();

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const setSearchTerm = (searchTerm: string) => {
    setQuery({ ...query, searchTerm });
  };

  const setSearchBy = (searchBy: string) => {
    setQuery({ ...query, searchBy });
  };

  const { searchTerm, searchBy } = query;

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
        <Select
          label={
            <span className="inline-block h-10 whitespace-nowrap text-small leading-10 text-default-500">
              Search by
            </span>
          }
          labelPlacement="outside-left"
          value={searchBy || 'name'}
          className="ml-auto w-48 md:ml-0 md:flex-col"
          classNames={{ value: '!text-default-500', listbox: '!text-default-500' }}
          defaultSelectedKeys={['name']}
          onChange={(e) => setSearchBy(e.target.value)}
        >
          {searchOptions.map(({ value, label }) => (
            <SelectItem key={value} value={value}>
              {label}
            </SelectItem>
          ))}
        </Select>
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
