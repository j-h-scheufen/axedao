'use client';

import { Spinner } from '@nextui-org/spinner';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';

import useGlobalAdminUsersTable from '@/hooks/useGlobalAdminUsersTable';
import GlobalAdminUsersTableFilters from './GlobalAdminUsersTableFilters';

const GlobalAdminUsersTable = () => {
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
  } = useGlobalAdminUsersTable();

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <GlobalAdminUsersTableFilters
        searchTerm={searchTerm}
        setSearchTerm={setSearchTerm}
        searchBy={searchBy}
        setSearchBy={setSearchBy}
        searchOptions={searchOptions}
      />
      <div className="flex flex-col gap-3">
        <Table
          aria-label="Global admin users table"
          selectedKeys={selectedRows}
          onSelectionChange={(key) => setSelectedRows(key as Set<string>)}
          bottomContent={
            isLoading ? (
              <div className="py-5 flex items-center justify-center">
                <Spinner size="sm" color="default" />
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
export default GlobalAdminUsersTable;
