'use client';

import VerificationChip from '@/components/VerificationChip';
import { Group } from '@/types/model';
import {
  Avatar,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableColumnProps,
  TableHeader,
  TableRow,
  getKeyValue,
} from '@nextui-org/react';
import { MapPinIcon } from 'lucide-react';
import React, { useCallback, useState } from 'react';
import useGroupsTable from '../../_hooks/useGroupsTable';
import ActionCell from './ActionCell';
import Filters from './Filters';

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
      const { logo = '', name, city, country } = item;
      return (
        <div className="flex items-center gap-2">
          <Avatar size="sm" src={logo || ''} radius="full" />
          <div className="flex justify-center flex-col">
            <div>{name}</div>
            <span className="flex items-center gap-1 text-small text-default-500">
              <MapPinIcon className="h-3 w-3" /> {city}, {country}
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
      return (
        <VerificationChip
          verified={verified}
          // className="position top-[1px]"
        />
      );
    },
    columnProps: { allowsSorting: true },
  },
  {
    key: 'id',
    label: 'ACTIONS',
    cell: ({ item }) => {
      return (
        <div className="flex items-center justify-end">
          <ActionCell group={item} />
        </div>
      );
    },
    columnProps: {
      className: 'w-6',
    },
  },
];

const GlobalAdminGroupsTable = () => {
  const [selectedKeys, setSelectedKeys] = useState<Set<string>>(new Set([]));

  const { groups, isLoading, query, setQuery } = useGroupsTable();

  const getCellValue = useCallback((item: Group, key: keyof Group) => {
    const cell = columns.find((col) => col.key === key)?.cell;
    if (cell) {
      return cell({ item });
    }
    return getKeyValue(item, key) || 'N/A';
  }, []);

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <Filters query={query} setQuery={setQuery} />
      <div className="flex flex-col gap-3">
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
          <TableBody
            items={groups}
            isLoading={isLoading}
            loadingContent={<Spinner size="sm" color="default" />}
            emptyContent="No group found"
          >
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
export default GlobalAdminGroupsTable;