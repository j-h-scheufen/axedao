'use client';

import useSuperAdminUsersTable from '@/hooks/useSuperAdminUsersTable';
import { Input } from '@nextui-org/input';
import {
  Select,
  SelectItem,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
} from '@nextui-org/react';
import { Search } from 'lucide-react';

const SuperAdminUsersTable = () => {
  const {
    searchTerm,
    setSearchTerm,
    searchBy,
    setSearchBy,
    users,
    isLoading,
    selectedRows,
    setSelectedRows,
    searchOptions,
    columns,
    getCellValue,
  } = useSuperAdminUsersTable();

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
          selectedKeys={selectedRows}
          onSelectionChange={(key) => setSelectedRows(key as Set<string>)}
          bottomContent={
            isLoading ? (
              <div className="py-5 flex items-center justify-center">
                <Spinner size="sm" />
              </div>
            ) : null
          }
        >
          <TableHeader columns={columns}>
            {(column) => <TableColumn key={column.key}>{column.label}</TableColumn>}
          </TableHeader>
          <TableBody items={users}>
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
