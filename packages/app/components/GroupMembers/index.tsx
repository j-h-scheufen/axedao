'use client';

import { Spinner } from '@nextui-org/spinner';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';
import { useAtomValue } from 'jotai';
import { Suspense, useCallback } from 'react';

import { GroupMembersSkeleton } from '@/components/skeletons/GroupSkeletons';
import { groupAdminIdsAtom, groupFounderAtom, groupLeaderAtom, isCurrentUserGroupAdminAtom } from '@/hooks/state/group';
import { useGroupMembers } from '@/hooks/useGroup';
import { GroupMemberRole } from '@/types/model';
import { getGroupMemberRoles } from '@/utils';
import TableCellValue from './TableCellValue';
import { GroupMemberTableColumnKey, columns } from './utils';

const GroupMembers = () => {
  const { groupMembers, isPending } = useGroupMembers();
  const groupFounder = useAtomValue(groupFounderAtom);
  const groupLeader = useAtomValue(groupLeaderAtom);
  const groupAdminIds = useAtomValue(groupAdminIdsAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const getMemberRoles = useCallback(
    (userId: string): GroupMemberRole[] => {
      if (groupFounder && groupLeader) return getGroupMemberRoles(userId, groupFounder, groupLeader, groupAdminIds);
      return [];
    },
    [groupFounder, groupLeader, groupAdminIds],
  );

  const filteredColumns = [...columns].filter((column) => (isGroupAdmin ? true : column.name !== 'ACTIONS'));

  return (
    <Suspense fallback={<GroupMembersSkeleton />}>
      <Table aria-label="Group members table">
        <TableHeader columns={filteredColumns}>
          {(column) => (
            <TableColumn key={column.uid} className="last:text-end text-left">
              {column.name}
            </TableColumn>
          )}
        </TableHeader>
        <TableBody
          items={groupMembers}
          isLoading={isPending}
          loadingContent={<Spinner label="Loading..." size="sm" color="default" />}
          emptyContent="No members found"
        >
          {(item) => (
            <TableRow key={item.id}>
              {(columnKey) => (
                <TableCell className="last:text-end first:text-left text-center">
                  <TableCellValue
                    groupMember={{ ...item, roles: getMemberRoles(item.id) }}
                    columnKey={columnKey as GroupMemberTableColumnKey}
                  />
                </TableCell>
              )}
            </TableRow>
          )}
        </TableBody>
      </Table>
    </Suspense>
  );
};
export default GroupMembers;
