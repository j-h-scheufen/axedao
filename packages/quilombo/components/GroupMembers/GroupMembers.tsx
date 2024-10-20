'use client';

import { Spinner } from '@nextui-org/spinner';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';
import { useAtomValue } from 'jotai';
import { useCallback } from 'react';

import { GroupMembersSkeleton } from '@/components/skeletons/GroupSkeletons';
import {
  groupAdminIdsAtom,
  groupFounderAtom,
  groupLeaderAtom,
  groupMembersAtom,
  isCurrentUserGroupAdminAtom,
} from '@/hooks/state/group';
import { GroupMemberRole } from '@/types/model';
import { getGroupMemberRoles } from '@/utils';
import TableCellValue, { COLUMNS, GroupMemberTableColumnKey } from './TableCellValue';

const GroupMembers = () => {
  const { data: groupMembers, isPending } = useAtomValue(groupMembersAtom);
  const groupFounder = useAtomValue(groupFounderAtom);
  const groupLeader = useAtomValue(groupLeaderAtom);
  const { data: groupAdminIds } = useAtomValue(groupAdminIdsAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const getMemberRoles = useCallback(
    (userId: string): GroupMemberRole[] => getGroupMemberRoles(userId, groupFounder, groupLeader, groupAdminIds),
    [groupFounder, groupLeader, groupAdminIds],
  );

  const filteredColumns = [...COLUMNS].filter((column) => (isGroupAdmin ? true : column.uid !== 'actions'));

  if (isPending) return <GroupMembersSkeleton />;

  return (
    <Table aria-label="Group members table" hideHeader removeWrapper>
      <TableHeader columns={filteredColumns}>
        {(column) => (
          <TableColumn key={column.uid} className="last:text-end text-left capitalize">
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
  );
};
export default GroupMembers;
