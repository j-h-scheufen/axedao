import { usePublicClient, useWallet } from '@/components/WalletContext';
import { useState } from 'react';
import { Address, Hash } from 'viem';

import ENV from '@/config/environment';
import { axeAbi } from '@/generated';

const axeContract = {
  address: ENV.axeTokenAddress,
  abi: axeAbi,
} as const;

const useAxe = () => {
  const [transferError, setApprovalError] = useState<string | null>(null);
  const publicClient = usePublicClient();
  const { walletClient } = useWallet();

  const executeTransfer = async (to: Address, amount: bigint): Promise<Hash | undefined> => {
    setApprovalError(null);

    // console.log('Public wallet chain: ', publicClient?.chain?.id || 'unknown');
    // console.log('Public wallet acc: ', publicClient?.account || 'unknown');
    // console.log('Silk wallet chain: ', walletClient?.chain?.id || 'unknown');
    // console.log('Silk wallet acc: ', walletClient?.account || 'unknown');

    try {
      if (!publicClient) {
        throw new Error('PublicClient not available.');
      }
      if (!walletClient) {
        throw new Error('WalletClient not available.');
      }

      const { request } = await publicClient.simulateContract({
        ...axeContract,
        account: walletClient.account,
        functionName: 'transfer',
        args: [to, amount],
      });

      console.log('Request: ', request);
      // TODO the below is a workaround to make the chain stick. When this code first ran, walletClient.chain was correct,
      // however, when calling writeContract, the client used chain 10 (OP) which was the chain set on the silk website which
      // might've been set when logging in initially? Keeping this here for now as reminder to create a ticket.
      // walletClient.switchChain(walletClient.chain);
      const hash = await walletClient.writeContract(request);
      return hash;
    } catch (error) {
      setApprovalError('Error during transfer.' + error);
    }
  };

  return { executeTransfer, transferError };
};

export default useAxe;
