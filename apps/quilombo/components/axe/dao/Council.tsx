'use client';

import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';

import UserCard from '@/components/UserCard';
import { useCouncil } from '@/hooks/state/dao';

export default function Council() {
  const { members, isLoading: councilLoading, error } = useCouncil();

  if (councilLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div className="text-danger">Error: {error}</div>;
  }

  return (
    <div className="w-full flex flex-col gap-4">
      {members.length === 0 ? (
        <p className="text-lg text-gray-500 text-center">No members on the council</p>
      ) : (
        <Table aria-label="Current Council Members">
          <TableHeader>
            <TableColumn>MEMBER</TableColumn>
            <TableColumn>DELEGATIONS</TableColumn>
          </TableHeader>
          <TableBody isLoading={councilLoading}>
            {members.map((member) => (
              <TableRow key={member.id}>
                <TableCell>
                  <UserCard user={member} />
                </TableCell>
                <TableCell>{member.delegationCount}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      )}
    </div>
  );
}
