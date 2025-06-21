'use client';

import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow, Spinner } from '@heroui/react';
import { useInfiniteScroll } from '@heroui/use-infinite-scroll';

import useGlobalAdminUsersTable from '@/hooks/useGlobalAdminUsersTable';
import GlobalAdminUsersTableFilters from './GlobalAdminUsersTableFilters';

const GlobalAdminUsersTable = () => {
  const {
    searchTerm,
    setSearchTerm,
    users,
    isLoading,
    selectedRows,
    setSelectedRows,
    columns,
    getCellValue,
    hasNextPage,
    fetchNextPage,
  } = useGlobalAdminUsersTable();

  const [loaderRef, scrollerRef] = useInfiniteScroll({
    hasMore: hasNextPage,
    onLoadMore: fetchNextPage,
  });

  return (
    <div className="flex flex-col gap-4 -mt-5">
      <GlobalAdminUsersTableFilters searchTerm={searchTerm} setSearchTerm={setSearchTerm} />
      <div className="flex flex-col gap-3">
        <Table
          aria-label="Global admin users table"
          selectedKeys={selectedRows}
          onSelectionChange={(key) => setSelectedRows(key as Set<string>)}
          baseRef={scrollerRef}
          bottomContent={
            hasNextPage ? (
              <div className="flex w-full justify-center">
                <Spinner ref={loaderRef} size="sm" color="default" />
              </div>
            ) : null
          }
        >
          <TableHeader columns={columns}>
            {(column) => <TableColumn key={column.key}>{column.label}</TableColumn>}
          </TableHeader>
          <TableBody
            items={users}
            isLoading={isLoading}
            loadingContent={<Spinner size="sm" color="default" />}
            emptyContent="No users found"
          >
            {(item) => (
              <TableRow key={item.id}>
                {(columnKey) => <TableCell>{getCellValue({ user: item, key: columnKey as string })}</TableCell>}
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
    </div>
  );
};
export default GlobalAdminUsersTable;
