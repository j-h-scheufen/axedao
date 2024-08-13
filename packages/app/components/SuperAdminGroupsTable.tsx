'use client';

import useGroups from '@/hooks/useGroups';
import { Group } from '@/types/model';
import { Input } from '@nextui-org/input';
import {
  Avatar,
  Select,
  SelectItem,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableColumnProps,
  TableHeader,
  TableRow,
  getKeyValue,
} from '@nextui-org/react';
import { capitalize } from 'lodash';
import { MapPinIcon, Search } from 'lucide-react';
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
    cell: ({ item }) => {
      const {
        logo = '',
        name,
        // city,
        // country
      } = item;
      return (
        <div className="flex items-center gap-2">
          <Avatar src={logo || undefined} radius="full" />
          <div className="flex justify-center flex-col">
            <div>{name}</div>
            <span className="flex items-center gap-1 text-xs text-default-500">
              <MapPinIcon className="h-3 w-3" /> City, Country
            </span>
          </div>
        </div>
      );
    },
    columnProps: { allowsSorting: true },
  },
  {
    key: 'verified',
    label: 'VERIFICATION',
    cell: ({ item }) => {
      const { verified } = item;
      return <Tag color={verified ? 'success' : 'danger'}>{verified ? 'Verified' : 'Unverified'}</Tag>;
    },
    columnProps: { allowsSorting: true },
  },
  {
    key: 'id',
    label: 'ACTIONS',
    cell: ({ item }) => {
      return (
        <div className="flex items-center justify-end">
          <SuperAdminGroupsTableActions group={item} />
        </div>
      );
    },
    columnProps: {
      className: 'w-6',
    },
  },
];

const verificationStatuses = ['verified', 'unverified'];

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
      <div className="flex items-center gap-3 justify-end">
        <Select label="Verification" labelPlacement="outside" className="w-32 text-sm">
          {verificationStatuses.map((status) => {
            return <SelectItem key={status}>{capitalize(status)}</SelectItem>;
          })}
        </Select>
        <Select label="Country" labelPlacement="outside" className="w-36 text-sm">
          {verificationStatuses.map((status) => {
            return <SelectItem key={status}>{capitalize(status)}</SelectItem>;
          })}
        </Select>
        <Select label="City" labelPlacement="outside" className="w-36 text-sm">
          {verificationStatuses.map((status) => {
            return <SelectItem key={status}>{capitalize(status)}</SelectItem>;
          })}
        </Select>
      </div>
      <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
        <Input
          isClearable
          onClear={() => setSearchTerm('')}
          className="w-full"
          placeholder="Search groups by name"
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
          onSortChange={async (...args) => console.log(args)}
          sortDescriptor={{ column: 'verified', direction: 'ascending' }}
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
