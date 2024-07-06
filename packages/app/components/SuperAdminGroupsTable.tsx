'use client';

import useGroups from '@/hooks/useGroups';
import { Group } from '@/types/model';
import { Input } from '@nextui-org/input';
import {
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableColumnProps,
  TableHeader,
  TableRow,
  getKeyValue,
} from '@nextui-org/react';
import { Search } from 'lucide-react';
import React, { useCallback, useState } from 'react';
import SuperAdminGroupsTableActions from './SuperAdminGroupsTableActions';
import Tag from './Tag';

type Column<T> = {
  key: keyof T;
  label: string;
  cell?: React.FC<{ item: T }>;
  columnProps?: Omit<TableColumnProps<T>, 'children'>;
};

const columns: Column<Group>[] = [
  {
    key: 'name',
    label: 'NAME',
  },
  {
    key: 'verified',
    label: 'VERIFICATION',
    cell: ({ item }) => {
      const { verified } = item;
      return <Tag color={verified ? 'success' : 'danger'}>{verified ? 'Verified' : 'Unverified'}</Tag>;
    },
  },
  {
    key: 'id',
    label: '',
    cell: ({ item }) => {
      return <SuperAdminGroupsTableActions />;
    },
    columnProps: {
      className: 'w-6',
    },
  },
];

const SuperAdminGroupsTable = () => {
  const [selectedKeys, setSelectedKeys] = useState<Set<string>>(new Set([]));

  const { searchTerm, setSearchTerm, groups } = useGroups();

  const getCellValue = useCallback((item: Group, key: keyof Group) => {
    const cell = columns.find((col) => col.key === key)?.cell;
    if (cell) {
      return cell({ item });
    }
    return getKeyValue(item, key) || 'N/A';
  }, []);

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
            {(column) => (
              <TableColumn key={column.key} {...(column.columnProps || {})}>
                {column.label}
              </TableColumn>
            )}
          </TableHeader>
          <TableBody items={groups}>
            {(item) => (
              <TableRow key={item.id}>
                {(columnKey) => <TableCell>{getCellValue(item, columnKey as unknown as keyof Group)}</TableCell>}
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  );
};
export default SuperAdminGroupsTable;
