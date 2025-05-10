'use client';

import { useEffect } from 'react';
import { Table, TableBody, TableCell, TableColumn, TableHeader, TableRow } from '@nextui-org/table';
import { useAtomValue, useSetAtom } from 'jotai';

import UserCard from '@/components/UserCard';
import { candidatesSyncEnabledAtom, sortedCandidateUsersAtom } from '@/hooks/state/dao';

export default function Candidates() {
  const candidates = useAtomValue(sortedCandidateUsersAtom);
  const setCandidatesSyncEnabled = useSetAtom(candidatesSyncEnabledAtom);

  useEffect(() => {
    setCandidatesSyncEnabled(true);
    return () => {
      setCandidatesSyncEnabled(false);
    };
  }, [setCandidatesSyncEnabled]);

  return (
    <div className="w-full flex flex-col gap-4">
      <Table aria-label="Council candidates and their delegations">
        <TableHeader>
          <TableColumn>Candidate</TableColumn>
          <TableColumn>Delegations</TableColumn>
        </TableHeader>
        <TableBody>
          {candidates.map((candidate) => (
            <TableRow key={candidate.walletAddress} className={!candidate.available ? 'opacity-50' : undefined}>
              <TableCell>
                <div className="flex items-center gap-2">
                  <UserCard user={candidate} />
                  {!candidate.available && <span className="text-sm text-gray-500">(Resigned)</span>}
                </div>
              </TableCell>
              <TableCell>
                {typeof candidate.delegationCount === 'number' ? candidate.delegationCount.toString() : '0'}
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}
