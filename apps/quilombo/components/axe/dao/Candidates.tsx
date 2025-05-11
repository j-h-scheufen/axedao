'use client';

import { useEffect } from 'react';
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
      {candidates.map((candidate) => (
        <div key={candidate.walletAddress} className={!candidate.available ? 'opacity-50' : undefined}>
          <UserCard
            user={candidate}
            badge={{
              content: candidate.delegationCount?.toString() || '0',
              color: 'secondary',
              placement: 'top-right',
            }}
            endContent={!candidate.available && <span className="text-sm text-danger">(Resigned)</span>}
          />
        </div>
      ))}
      {candidates.length === 0 && <p className="text-center text-default-500">No candidates available</p>}
    </div>
  );
}
