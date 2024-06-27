'use client';

import useOverview from '@/hooks/useOverview';
import { useUsers, useUsersActions } from '@/store/users.store';
import { User } from '@/types/model';
import { Input } from '@nextui-org/input';
import {
  Select,
  SelectItem,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
  getKeyValue,
} from '@nextui-org/react';
import { isEqual } from 'lodash';
import { Search } from 'lucide-react';
import { useCallback, useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

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

const columns = [
  {
    key: 'name',
    label: 'NAME',
  },
  {
    key: 'nickname',
    label: 'NICKNAME',
  },
  {
    key: 'title',
    label: 'TITLE',
  },
];

const SuperAdminUsersTable = () => {
  const [selectedKeys, setSelectedKeys] = useState<Set<string>>(new Set([]));
  const [query, setQuery] = useOverview();
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const usersActions = useUsersActions();
  const users = useUsers();
  // const totalUsers = useTotalUsers();
  // const isLoading = useIsLoadingUsers();
  // const isInitialized = useUsersIsInitialized();

  const rows = users;

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    usersActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, usersActions, lastQueryRef]);

  const getCellValue = useCallback(({ item, key }: { item: User; key: string }) => {
    return getKeyValue(item, key) || 'N/A';
  }, []);

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
          className="w-full"
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
      <div className="flex flex-col gap-3">
        {' '}
        <Table
          aria-label="Controlled table example with dynamic content"
          selectionMode="multiple"
          selectedKeys={selectedKeys}
          onSelectionChange={(key) => setSelectedKeys(key as Set<string>)}
        >
          <TableHeader columns={columns}>
            {(column) => <TableColumn key={column.key}>{column.label}</TableColumn>}
          </TableHeader>
          <TableBody items={rows}>
            {(item) => (
              <TableRow key={item.id}>
                {(columnKey) => <TableCell>{getCellValue({ item, key: columnKey as string })}</TableCell>}
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  );
};
export default SuperAdminUsersTable;
