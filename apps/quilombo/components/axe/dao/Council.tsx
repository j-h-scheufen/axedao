'use client';

import { Button } from '@nextui-org/button';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';

import UserCard from '@/components/UserCard';
import { useCouncil, useCouncilUpdateRequest, useInitializeCouncilState } from '@/hooks/state/dao';
import { useReadAxeMembershipCouncilCanRequestCouncilUpdate } from '@/generated';

export default function Council() {
  // Initialize council state
  useInitializeCouncilState();

  const { members, isLoading: councilLoading, error, canUpdate } = useCouncil();
  const { requestUpdate, isPending: isUpdatePending } = useCouncilUpdateRequest();
  const { data: canRequestUpdate } = useReadAxeMembershipCouncilCanRequestCouncilUpdate();

  if (councilLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div className="text-danger">Error: {error}</div>;
  }

  return (
    <div className="w-full flex flex-col gap-4">
      <div className="flex flex-col items-center gap-4">
        <p className="text-sm text-gray-500 text-center">
          Every 24 hours, anyone can request for the council to be updated.
        </p>

        <Button
          color="primary"
          className="max-w-[400px] w-full opacity-100 transition-opacity"
          isDisabled={!canUpdate || councilLoading || !canRequestUpdate}
          isLoading={isUpdatePending}
          onPress={() => requestUpdate()}
        >
          Request Council Update
        </Button>

        {!canRequestUpdate && <p className="text-xs text-gray-400">Last updated &lt; 24 hours ago</p>}
      </div>

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
    </div>
  );
}
