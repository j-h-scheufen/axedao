import type { Address } from 'viem';
import { useAccount } from 'wagmi';

import ENV from '@/config/environment';
import { useReadAxeMembershipDelegations } from '@/generated';

export const useCurrentUserDelegation = () => {
  const account = useAccount();
  const { data, refetch, isLoading, isError } = useReadAxeMembershipDelegations({
    address: ENV.axeMembershipAddress,
    args: [account.address as Address],
  });

  return {
    address: data,
    refetch,
    isLoading,
    isError,
  };
};
