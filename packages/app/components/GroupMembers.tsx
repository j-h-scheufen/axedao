'use client';

import { useGroupMembers, useGroupMembersActions } from '@/store/groupMembers.store';
import { Table, TableHeader, TableColumn, TableBody, TableRow, TableCell, getKeyValue } from '@nextui-org/react';
import { useEffect } from 'react';

const columns = [
  {
    key: 'id',
    label: 'MEMBER',
  },
  {
    key: 'role',
    label: 'ROLE',
  },
];

type Props = { id: string };
const GroupMembers = ({ id }: Props) => {
  const groupMembersActions = useGroupMembersActions();
  const groupMembers = useGroupMembers();

  useEffect(() => {
    groupMembersActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id]);
  return (
    <Table aria-label="Example table with dynamic content">
      <TableHeader columns={columns}>
        {(column) => <TableColumn key={column.key}>{column.label}</TableColumn>}
      </TableHeader>
      <TableBody items={groupMembers} emptyContent="This group has no members">
        {(member) => (
          <TableRow key={member.id}>{(columnKey) => <TableCell>{getKeyValue(member, columnKey)}</TableCell>}</TableRow>
        )}
      </TableBody>
    </Table>
  );
};
export default GroupMembers;
