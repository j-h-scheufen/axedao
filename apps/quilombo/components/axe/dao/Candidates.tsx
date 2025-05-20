'use client';

import { useEffect } from 'react';
import { useAtomValue, useSetAtom } from 'jotai';

import UserCard from '@/components/UserCard';
import { sortedCandidateUsersAtom } from '@/hooks/state/dao';
import { useCandidatesSync } from '@/hooks/state/dao';
import { directCandidatesSyncEnabledAtom } from '@/hooks/state/dao';

export default function Candidates() {
  const candidates = useAtomValue(sortedCandidateUsersAtom);
  const setDirectSync = useSetAtom(directCandidatesSyncEnabledAtom);

  useCandidatesSync();

  useEffect(() => {
    setDirectSync(true);
    return () => {
      setDirectSync(false);
    };
  }, [setDirectSync]);

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
