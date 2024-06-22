'use client';

import {
  useIsLoadingUsers,
  useTotalUsers,
  useUsers,
  useUsersActions,
  useUsersIsInitialized,
} from '@/store/users.store';
import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/react';
import { Search } from 'lucide-react';
import { useEffect } from 'react';
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
  const usersActions = useUsersActions();
  const users = useUsers();
  const totalUsers = useTotalUsers();
  const isLoading = useIsLoadingUsers();
  const isInitialized = useUsersIsInitialized();

  useEffect(() => {
    usersActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          isClearable
          onClear={() => console.log('clear')}
          className="w-full md:max-w-sm"
          placeholder="Search"
          startContent={<Search className="h-4 w-4" />}
          labelPlacement="outside"
        />
        <Select
          label={
            <span className="inline-block h-10 whitespace-nowrap text-small leading-10 text-default-500">
              Search by
            </span>
          }
          labelPlacement="outside-left"
          value={searchOptions[0].value}
          className="ml-auto w-48 md:ml-0 md:flex-col"
          classNames={{ value: '!text-default-500', listbox: '!text-default-500' }}
          defaultSelectedKeys={[searchOptions[0].value]}
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
