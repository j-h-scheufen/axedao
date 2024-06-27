'use client';

import useOverview from '@/hooks/useOverview';
import { useGroups, useGroupsActions } from '@/store/groups.store';
import { Group } from '@/types/model';
import { cn } from '@/utils/tailwind';
import { Input } from '@nextui-org/input';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow, getKeyValue } from '@nextui-org/react';
import { isEqual } from 'lodash';
import { Search } from 'lucide-react';
import React, { useCallback, useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

type Column<T> = {
  key: keyof T;
  label: string;
  cell?: React.FC<{ item: T }>;
};

const columns: Column<Group>[] = [
  {
    key: 'name',
    label: 'NAME',
  },
  {
    key: 'verified',
    label: 'VERIFIED',
    cell: ({ item }) => {
      const { verified } = item;
      return (
        <span
          className={cn('inline-block rounded-lg px-2 py-1 text-xs', {
            'bg-green-800': verified,
            'bg-orange-800': !verified,
          })}
        >
          {verified ? 'Verified' : 'Unverified'}
        </span>
      );
    },
  },
];

const SuperAdminGroupsTable = () => {
  const [selectedKeys, setSelectedKeys] = useState<Set<string>>(new Set([]));
  const [query, setQuery] = useOverview();
  const [debouncedQuery] = useDebounce(query, 500);

  const lastQueryRef = useRef<typeof query | null>(null);

  const groupsActions = useGroupsActions();
  const groups = useGroups();
  // const totalGroups = useTotalGroups();
  // const isLoading = useIsLoadingGroupMembers();
  // const isInitialized = useUsersIsInitialized();

  const rows = groups;

  useEffect(() => {
    if (isEqual(lastQueryRef.current, debouncedQuery)) return;
    groupsActions.initialize();
    // groupsActions.search({ searchTerm: debouncedQuery.searchTerm || '', searchBy: debouncedQuery.searchBy || '' });
    lastQueryRef.current = debouncedQuery;
  }, [debouncedQuery, groupsActions, lastQueryRef]);

  const getCellValue = useCallback(({ item, key }: { item: Group; key: keyof Group }) => {
    const cell = columns.find((col) => col.key === key)?.cell;
    if (cell) {
      return cell({ item });
    }
    return getKeyValue(item, key) || 'N/A';
  }, []);

  const setSearchTerm = (searchTerm: string) => {
    setQuery({ ...query, searchTerm });
  };

  // const setSearchBy = (searchBy: string) => {
  //   setQuery({ ...query, searchBy });
  // };

  const { searchTerm /*searchBy*/ } = query;

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
                {(columnKey) => (
                  <TableCell>{getCellValue({ item, key: columnKey as unknown as keyof Group })}</TableCell>
                )}
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  );
};
export default SuperAdminGroupsTable;
