'use client';

import { Button } from '@heroui/react';
import { useSnackbar } from 'notistack';
import { useEffect, useMemo, useState } from 'react';
import type { Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { useAtomValue } from 'jotai';

import DelegateForm from '@/components/forms/DelegateForm';
import UserCard from '@/components/UserCard';
import ENV from '@/config/environment';
import type { MembershipDelegateForm } from '@/config/validation-schema';
import { useWriteAxeMembershipDelegate, useWriteAxeMembershipUndelegate } from '@/generated';
import { candidateUsersAtom, type CandidateUser } from '@/hooks/state/dao';
import { useInvalidateSync } from '@/hooks/useSyncManager';
import { useCurrentUserDelegation } from '@/hooks/useCurrentUserDelegation';

const VoteDelegation: React.FC = () => {
  const account = useAccount();
  const { enqueueSnackbar } = useSnackbar();
  const invalidateSync = useInvalidateSync();
  const [showDelegateForm, setShowDelegateForm] = useState(false);
  const [selectedCandidate, setSelectedCandidate] = useState<CandidateUser | null>(null);
  const candidates = useAtomValue(candidateUsersAtom);

  // Read current delegation
  const { address: currentDelegationAddress, refetch: refetchCurrentDelegation } = useCurrentUserDelegation();

  // Contract interaction hooks
  const { data: delegateHash, isPending: delegatePending, writeContract: delegate } = useWriteAxeMembershipDelegate();

  const {
    data: undelegateHash,
    isPending: undelegatePending,
    writeContract: undelegate,
  } = useWriteAxeMembershipUndelegate();

  // Transaction receipt hooks
  const {
    isSuccess: delegateSuccess,
    error: delegateError,
    isLoading: delegateLoading,
  } = useWaitForTransactionReceipt({ hash: delegateHash });

  const {
    isSuccess: undelegateSuccess,
    error: undelegateError,
    isLoading: undelegateLoading,
  } = useWaitForTransactionReceipt({ hash: undelegateHash });

  const isSelfDelegating = useMemo(
    () => selectedCandidate?.walletAddress === account.address,
    [selectedCandidate, account.address]
  );

  // Handle transaction states
  useEffect(() => {
    if (delegateLoading) {
      enqueueSnackbar('Delegating vote. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (delegateSuccess) {
      setShowDelegateForm(false);
      enqueueSnackbar('Successfully delegated vote!');
      refetchCurrentDelegation().then(() => {
        invalidateSync();
      });
    } else if (delegateError) {
      enqueueSnackbar(`Failed to delegate: ${delegateError.message}`, {
        variant: 'error',
      });
    }
  }, [delegateLoading, delegateSuccess, delegateError, enqueueSnackbar, refetchCurrentDelegation, invalidateSync]);

  useEffect(() => {
    if (undelegateLoading) {
      enqueueSnackbar('Removing delegation. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (undelegateSuccess) {
      enqueueSnackbar('Successfully removed delegation!');
      refetchCurrentDelegation();
    } else if (undelegateError) {
      enqueueSnackbar(`Failed to undelegate: ${undelegateError.message}`, {
        variant: 'error',
      });
    }
  }, [undelegateLoading, undelegateSuccess, undelegateError, enqueueSnackbar, refetchCurrentDelegation]);

  useEffect(() => {
    if (currentDelegationAddress === selectedCandidate?.walletAddress) return;
    let newSelection: CandidateUser | undefined;
    if (currentDelegationAddress) {
      newSelection = candidates?.find((candidate) => candidate.walletAddress === currentDelegationAddress);
    }
    setSelectedCandidate(newSelection || null);
  }, [currentDelegationAddress, selectedCandidate, candidates]);

  const handleSubmit = async (values: MembershipDelegateForm) => {
    await delegate({
      address: ENV.axeMembershipAddress,
      args: [values.candidate as Address],
    });
  };

  const handleUndelegate = () => {
    undelegate({ address: ENV.axeMembershipAddress });
  };

  const hasActiveDelegation =
    currentDelegationAddress && currentDelegationAddress !== '0x0000000000000000000000000000000000000000';

  return (
    <div className="flex flex-col w-full">
      {hasActiveDelegation ? (
        !showDelegateForm ? (
          <div className="flex flex-col gap-2 sm:gap-4">
            <p>
              Your membership delegation is to
              {isSelfDelegating && ' yourself'}
            </p>
            {selectedCandidate && !isSelfDelegating && <UserCard user={selectedCandidate} />}
            <div className="flex gap-2">
              <Button variant="flat" onPress={() => setShowDelegateForm(true)}>
                Change
              </Button>
              <Button
                color="secondary"
                variant="flat"
                onPress={handleUndelegate}
                isLoading={undelegatePending || undelegateLoading}
              >
                Undelegate
              </Button>
            </div>
          </div>
        ) : (
          <div className="flex flex-col gap-2 sm:gap-4">
            <p>Delegate your vote to a candidate to help them get onto the council.</p>
            <DelegateForm
              onSubmit={handleSubmit}
              onCancel={() => setShowDelegateForm(false)}
              isLoading={delegatePending || delegateLoading}
              candidates={candidates ?? []}
              currentDelegationAddress={currentDelegationAddress}
            />
          </div>
        )
      ) : !showDelegateForm ? (
        <div className="flex flex-col gap-2 sm:gap-4">
          <p>
            Delegate your vote to a candidate to help them get onto the council. By enlisting, you automatically
            delegate to yourself.
          </p>
          <Button color="primary" onPress={() => setShowDelegateForm(true)}>
            Delegate
          </Button>
        </div>
      ) : (
        <DelegateForm
          onSubmit={handleSubmit}
          onCancel={() => setShowDelegateForm(false)}
          isLoading={delegatePending || delegateLoading}
          candidates={candidates ?? []}
          currentDelegationAddress={currentDelegationAddress}
        />
      )}
    </div>
  );
};

export default VoteDelegation;
