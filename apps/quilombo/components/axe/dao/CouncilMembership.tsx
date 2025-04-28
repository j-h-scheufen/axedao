'use client';

import { Button } from '@nextui-org/button';
import { useDisclosure } from '@nextui-org/use-disclosure';
import { useSnackbar } from 'notistack';
import { useEffect } from 'react';
import type { Address } from 'viem';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';

import { PATHS } from '@/config/constants';
import ENV from '@/config/environment';
import { useReadAxeMembershipIsMember, useWriteAxeMembershipResignAsCandidate } from '@/generated';
import { isCurrentUserEnlistedAtom, isCurrentUserOnCouncilAtom } from '@/hooks/state/dao';
import { Link } from '@nextui-org/link';
import { useAtom, useAtomValue } from 'jotai';
import EnlistAsCandidateModal from './CouncilEligibilityModal';
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
            <span>You are a Council {isOnCouncil ? 'Member' : 'Candidate'}</span>
          </div>
          <Button color="danger" variant="flat" onPress={onResign} isLoading={isLoading}>
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
  } = useWaitForTransactionReceipt({ hash: resignHash });

  // Handle resign transaction states
  useEffect(() => {
    if (resignLoading) {
      enqueueSnackbar('Resigning as candidate. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (resignSuccess) {
      enqueueSnackbar('Successfully resigned as candidate!');
    } else if (resignError) {
      enqueueSnackbar(`Failed to resign: ${resignError.message}`, {
        variant: 'error',
      });
    }
  }, [resignLoading, resignSuccess, resignError, enqueueSnackbar]);

  return (
    <div className="flex flex-col w-full items-center">
      <div className="text-2xl mb-1 sm:mb-2">Membership Status</div>
      {!isMember ? (
        <div>
          You are not a member of the Axé DAO and cannot participate in the Council. Join the DAO{' '}
          <Link href={`${PATHS.dao}?tab=dao`}>here</Link>
        </div>
      ) : (
        <div className="flex flex-col gap-2 sm:gap-4 w-full">
          <p>
            As a member of Axé DAO, you should either delegate your vote to a candidate or enlist as
            a candidate yourself and delegate your vote to you.
          </p>
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
