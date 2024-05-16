'use client';

import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/react';
import { Search } from 'lucide-react';
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
  return (
    <div className="flex flex-col gap-4">
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
        <span className="ml-auto text-small text-default-400">75 total Users</span>
      </div>
      <UsersGrid />
    </div>
  );
};
export default Users;
