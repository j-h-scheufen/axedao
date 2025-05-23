'use client';

import { Card } from "@heroui/card";
import { Button } from "@heroui/button";
import { ArrowRight } from 'lucide-react';
import { useAtomValue } from 'jotai';
import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { useSnackbar } from 'notistack';
import { useEffect } from 'react';
import { Spinner } from "@heroui/spinner";
import type { Address } from 'viem';

import { incomingCouncilUsersAtom, outgoingCouncilUsersAtom } from '@/hooks/state/dao';
import { useWriteAxeMembershipCouncilClaimSeat } from '@/generated';
import RequestCouncilUpdateButton from './RequestCouncilUpdateButton';
import UserCard from '@/components/UserCard';
import ENV from '@/config/environment';

const CouncilSeatExchange: React.FC = () => {
  const {
    data: incomingCouncilUsers,
    isLoading: incomingCouncilUsersLoading,
    refetch: refetchIncomingCouncilUsers,
  } = useAtomValue(incomingCouncilUsersAtom);
  const {
    data: outgoingCouncilUsers,
    isLoading: outgoingCouncilUsersLoading,
    refetch: refetchOutgoingCouncilUsers,
  } = useAtomValue(outgoingCouncilUsersAtom);
  const { address: currentUser } = useAccount();
  const { enqueueSnackbar } = useSnackbar();

  // Contract interaction hook
  const {
    data: claimSeatHash,
    isPending: claimSeatPending,
    writeContract: claimSeat,
  } = useWriteAxeMembershipCouncilClaimSeat();

  // Transaction receipt hook
  const {
    isSuccess: claimSeatSuccess,
    error: claimSeatError,
    isLoading: claimSeatLoading,
  } = useWaitForTransactionReceipt({ hash: claimSeatHash });

  // Handle seat claim results
  useEffect(() => {
    if (claimSeatLoading) {
      enqueueSnackbar('Claiming council seat. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (claimSeatSuccess) {
      enqueueSnackbar('Successfully claimed council seat!');
      refetchIncomingCouncilUsers();
      refetchOutgoingCouncilUsers();
    } else if (claimSeatError) {
      enqueueSnackbar(`Failed to claim seat: ${claimSeatError.message}`, {
        variant: 'error',
      });
    }
  }, [
    claimSeatLoading,
    claimSeatSuccess,
    claimSeatError,
    enqueueSnackbar,
    refetchIncomingCouncilUsers,
    refetchOutgoingCouncilUsers,
  ]);

  const handleClaimSeat = () => {
    const replacing = '0x0000000000000000000000000000000000000000' as Address;

    try {
      console.log('Attempting to claim seat with args:', {
        address: ENV.axeMembershipCouncilAddress,
        args: [replacing],
      });

      claimSeat({
        address: ENV.axeMembershipCouncilAddress,
        args: [replacing],
      });
    } catch (error) {
      console.error('Failed to claim seat:', error);
      enqueueSnackbar('Failed to initiate claim seat transaction', { variant: 'error' });
    }
  };

  if (incomingCouncilUsersLoading || outgoingCouncilUsersLoading) {
    return <Spinner className="w-10 h-10" label="Loading..." />;
  }

  return (
    <div>
      <Card className="p-4 mb-3">
        <div className="flex flex-col gap-6">
          <h3 className="text-xl font-semibold text-center">Council Seat Exchange</h3>

          {incomingCouncilUsers && incomingCouncilUsers.length > 0 ? (
            <div>
              <h4 className="text-lg font-medium mb-2">Incoming Members</h4>
              <div className="flex flex-col gap-3">
                {incomingCouncilUsers.map((user) => (
                  <div key={user.walletAddress} className="flex items-center gap-3">
                    <div className="w-[100px] flex justify-center">
                      {currentUser && currentUser === user.walletAddress ? (
                        <Button
                          color="primary"
                          isLoading={claimSeatPending || claimSeatLoading}
                          onPress={() => handleClaimSeat()}
                        >
                          Claim Seat
                        </Button>
                      ) : (
                        <ArrowRight className="w-5 h-5 text-success" />
                      )}
                    </div>
                    <div className="flex-1">
                      <UserCard user={user} />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ) : (
            <p className="text-center text-default-500">No incoming members</p>
          )}

          {outgoingCouncilUsers && outgoingCouncilUsers.length > 0 ? (
            <div>
              <h4 className="text-lg font-medium mb-2">Outgoing Members</h4>
              <div className="flex flex-col gap-3">
                {outgoingCouncilUsers.map((user) => (
                  <div key={user.walletAddress} className="flex items-center gap-3">
                    <div className="flex-1">
                      <UserCard user={user} />
                    </div>
                    <div className="w-[100px] flex justify-center">
                      <ArrowRight className="w-5 h-5 text-danger" />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ) : (
            <p className="text-center text-default-500">No outgoing members</p>
          )}
        </div>
      </Card>

      <RequestCouncilUpdateButton />
    </div>
  );
};

export default CouncilSeatExchange;
