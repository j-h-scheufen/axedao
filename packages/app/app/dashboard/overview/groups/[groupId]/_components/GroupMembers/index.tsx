'use client';

import { Spinner, Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/react';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useEffect } from 'react';
import {
  useGroupMembers,
  useGroupMembersActions,
  useGroupMembersHasMoreResults,
  useIsLoadingGroupMembers,
} from '../../store/groupMembers.store';
import { useGroupProfile, useIsGroupAdmin, useIsInitializingGroupProfile } from '../../store/groupProfile.store';
import { GroupMembersSkeleton } from '../skeletons';
import TableCellValue from './TableCellValue';
import { GroupMemberTableColumnKey, columns } from './utils';

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const isInitializingGroupProfile = useIsInitializingGroupProfile();
  const groupProfile = useGroupProfile();
  const { initialize, loadNextPage } = useGroupMembersActions();
  const isGroupAdmin = useIsGroupAdmin();
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

  if (isInitializingGroupProfile || !groupProfile.id) return <GroupMembersSkeleton />;

  const filteredColumns = [...columns].filter((column) => (isGroupAdmin ? true : column.name !== 'ACTIONS'));

  return (
    <Table baseRef={scrollerRef} aria-label="Group members table">
      <TableHeader columns={filteredColumns}>
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
        loadingContent={<Spinner label="Loading..." size="sm" color="default" />}
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
