'use client';

import {
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
  useIsLoadingGroupMembers,
} from '@/store/groupMembers.store';
import { Spinner, Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/react';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useEffect } from 'react';
import TableCellValue from './TableCellValue';
import { GroupMemberTableColumnKey, columns } from './utils';

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const { initialize, loadNextPage } = useGroupMembersActions();
  const groupMembers = useGroupMembers();
  const hasMoreMembers = useGroupMembersHasMoreResults();
  const isLoading = useIsLoadingGroupMembers();

  useEffect(() => {
    initialize(id);
  }, [initialize, id]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreMembers,
    isEnabled: true,
    shouldUseLoader: true,
    onLoadMore: () => loadNextPage(),
  });

  return (
    <Table baseRef={scrollerRef} aria-label="Group members table">
      <TableHeader columns={[...columns]}>
        {(column) => (
          <TableColumn
            key={column.uid}
            align={column.uid === 'actions' ? 'center' : 'start'}
            className="last:text-end first:text-left text-center"
          >
            {column.name}
          </TableColumn>
        )}
      </TableHeader>
      <TableBody
        items={groupMembers}
        isLoading={isLoading}
        loadingContent={<Spinner label="Loading..." size="sm" />}
        emptyContent="No members found"
      >
        {(item) => (
          <TableRow key={item.id}>
            {(columnKey) => (
              <TableCell className="last:text-end first:text-left text-center">
                <TableCellValue groupMember={item} columnKey={columnKey as GroupMemberTableColumnKey} />
              </TableCell>
            )}
          </TableRow>
        )}
      </TableBody>
    </Table>
  );
};
export default GroupMembers;
