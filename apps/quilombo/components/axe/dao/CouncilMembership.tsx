'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { useSnackbar } from 'notistack';
import { useEffect } from 'react';
import type { Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';

import ENV from '@/config/environment';
import { useReadAxeMembershipIsMember, useWriteAxeMembershipResignAsCandidate } from '@/generated';
import { isCurrentUserEnlistedAtom, isCurrentUserOnCouncilAtom } from '@/hooks/state/dao';
import { useInvalidateSync } from '@/hooks/useSyncManager';
import { useAtom, useAtomValue } from 'jotai';
import EnlistAsCandidateModal from './EnlistAsCandidateModal';
import VoteDelegation from './VoteDelegation';

const CandidateActions: React.FC<{
  isLoading: boolean;
  onResign: () => void;
  onEnlist: () => void;
}> = ({ isLoading, onResign, onEnlist }) => {
  const [isCandidate] = useAtom(isCurrentUserEnlistedAtom);
  const isOnCouncil = useAtomValue(isCurrentUserOnCouncilAtom);
  const { isOpen, onOpen, onOpenChange, onClose } = useDisclosure();
  return (
    <div>
      {isCandidate ? (
        <div className="flex flex-col gap-2">
          <div className="flex">
            <span>Your status: {isOnCouncil ? 'Council Member' : 'Candidate'}</span>
          </div>
          <Button color="secondary" variant="flat" onPress={onResign} isLoading={isLoading}>
            Resign as Candidate
          </Button>
        </div>
      ) : (
        <>
          <Button onPress={onOpen} color="primary" className="w-full">
            Enlist as Candidate
          </Button>
          <EnlistAsCandidateModal
            isOpen={isOpen}
            onOpenChange={onOpenChange}
            onClose={onClose}
            onSuccess={() => {
              onEnlist();
              onClose();
            }}
          />
        </>
      )}
    </div>
  );
};

const CouncilMembership: React.FC = () => {
  const account = useAccount();
  const invalidateSync = useInvalidateSync();
  const { enqueueSnackbar } = useSnackbar();

  // Check if user is DAO member
  const { data: isMember = false } = useReadAxeMembershipIsMember({
    address: ENV.axeMembershipAddress,
    args: [account.address as Address],
  });

  const {
    data: resignHash,
    isPending: resignPending,
    writeContract: resign,
  } = useWriteAxeMembershipResignAsCandidate();

  const {
    isSuccess: resignSuccess,
    error: resignError,
    isLoading: resignLoading,
    data: resignReceipt,
  } = useWaitForTransactionReceipt({ hash: resignHash });

  // Handle resign transaction states
  useEffect(() => {
    if (resignLoading) {
      enqueueSnackbar('Resigning as candidate. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (resignSuccess) {
      enqueueSnackbar('Successfully resigned as candidate!');
      invalidateSync(resignReceipt);
    } else if (resignError) {
      enqueueSnackbar(`Failed to resign: ${resignError.message}`, {
        variant: 'error',
      });
    }
  }, [resignLoading, resignSuccess, resignError, resignReceipt, enqueueSnackbar, invalidateSync]);

  return (
    <div className="flex flex-col w-full items-center">
      <div className="text-2xl mb-1 sm:mb-2">Your Status</div>
      {!isMember ? (
        <div>You are not a member of the Axé DAO and cannot participate in the Council.</div>
      ) : (
        <div className="flex flex-col gap-2 sm:gap-4 w-full">
          <p className="text-center">You are eligible to participate in the Council.</p>
          <CandidateActions
            isLoading={resignPending || resignLoading}
            onResign={() => resign({ address: ENV.axeMembershipAddress })}
            onEnlist={() => {}}
          />
          <VoteDelegation />
        </div>
      )}
    </div>
  );
};

export default CouncilMembership;
