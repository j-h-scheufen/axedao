'use client';

import {
  Accordion,
  AccordionItem,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
} from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useCallback, useMemo } from 'react';

import { GroupMembersSkeleton } from '@/components/skeletons/GroupSkeletons';
import { TitleEnum } from '@/config/constants';
import {
  groupAdminIdsAtom,
  groupFounderAtom,
  groupLeaderAtom,
  groupMembersAtom,
  isCurrentUserGroupAdminAtom,
} from '@/hooks/state/group';
import type { GroupMemberRole } from '@/types/model';
import { getGroupMemberRoles } from '@/utils';
import TableCellValue, { COLUMNS, type GroupMemberTableColumnKey } from './TableCellValue';

const GroupMembers = () => {
  const { data: groupMembers, isLoading } = useAtomValue(groupMembersAtom);
  const groupFounder = useAtomValue(groupFounderAtom);
  const groupLeader = useAtomValue(groupLeaderAtom);
  const { data: groupAdminIds } = useAtomValue(groupAdminIdsAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);

  const getMemberRoles = useCallback(
    (userId: string): GroupMemberRole[] => getGroupMemberRoles(userId, groupFounder, groupLeader, groupAdminIds),
    [groupFounder, groupLeader, groupAdminIds]
  );

  const sortedGroupMembers = useMemo(
    () =>
      groupMembers?.sort((a, b) => {
        if (!a.title && !b.title) return 0;
        if (!a.title) return -1;
        if (!b.title) return 1;
        return TitleEnum[a.title] - TitleEnum[b.title];
      }) ?? [],
    [groupMembers]
  );

  // Show loading state if admin status is still being determined
  if (isGroupAdmin === null || isLoading) {
    return <GroupMembersSkeleton />;
  }

  const memberCount = sortedGroupMembers.length;
  const memberText = memberCount === 0 ? 'No Members' : memberCount === 1 ? 'Member' : 'Members';

  if (!sortedGroupMembers.length) {
    return (
      <Accordion variant="bordered" className="w-full">
        <AccordionItem key="members" aria-label="No Members" title="No Members" className="px-0" isDisabled>
          <div className="text-default-500 text-center py-4">No members found</div>
        </AccordionItem>
      </Accordion>
    );
  }

  const filteredColumns = [...COLUMNS].filter((column) => (isGroupAdmin ? true : column.uid !== 'actions'));

  return (
    <Accordion variant="bordered" className="w-full px-0" defaultExpandedKeys={['members']} fullWidth>
      <AccordionItem
        key="members"
        aria-label={`${memberCount} ${memberText}`}
        title={`${memberCount} ${memberText}`}
        classNames={{
          content: 'px-0 sm:px-2 py-1',
          heading: 'px-4 py-1',
        }}
      >
        <Table aria-label="Group members table" hideHeader removeWrapper>
          <TableHeader columns={filteredColumns}>
            {(column) => (
              <TableColumn key={column.uid} className="last:text-end text-left capitalize">
                {column.name}
              </TableColumn>
            )}
          </TableHeader>
          <TableBody
            items={sortedGroupMembers}
            isLoading={isLoading}
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
      </AccordionItem>
    </Accordion>
  );
};

export default GroupMembers;
