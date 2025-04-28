import type { Address, PublicClient } from 'viem';

import ENV from '@/config/environment';
import { axeMembershipAbi } from '@/generated';
import type { Candidate } from '@/hooks/state/dao';
import { type GetCandidatesParams, QUERY_KEYS } from '.';

type CandidateResult = {
  delegationCount: bigint;
  available: boolean;
  next: Address;
};

/**
 * Returns query options for retrieving paginated top candidates from the AxeMembership contract.
 * @param offset - The offset to start retrieving candidates from.
 * @param pageSize - The number of candidates to retrieve.
 * @param publicClient - The public client to use for the query.
 * @returns Query options for the getTopCandidates query.
 */
export const getTopCandidatesOptions = ({ 
  offset = 0, 
  pageSize = 10, 
  publicClient 
}: { 
  offset?: number; 
  pageSize?: number; 
  publicClient?: PublicClient 
}) => {
  return {
    enabled: !!publicClient,
    queryKey: [QUERY_KEYS.membership.getTopCandidates, offset, pageSize],
    queryFn: async (): Promise<{ addresses: Address[]; hasMore: boolean }> => {
      try {
        const result = publicClient ? await publicClient.readContract({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          functionName: 'getTopCandidates',
          args: [BigInt(offset), BigInt(pageSize)],
        }) : [[], false];

        // Result is a tuple [address[], boolean]
        const [addresses, hasMore] = result as [Address[], boolean];

        // Filter out zero addresses
        const filteredAddresses = addresses.filter(
          (addr) => addr !== '0x0000000000000000000000000000000000000000'
        );

        return { 
          addresses: filteredAddresses, 
          hasMore 
        };
      } catch (error) {
        console.error('Error fetching top candidates:', error);
        return { addresses: [], hasMore: false };
      }
    },
  };
};

/**
 * Returns query options for retrieving a Record of candidates containing their delegation count and
 * availability, indexed by wallet address.
 * @param addresses - The list of addresses to retrieve candidates for.
 * @param publicClient - The public client to use for the query.
 * @returns Query options for the getCandidates query.
 */
export const getCandidatesDictionaryOptions = ({ addresses, publicClient }: GetCandidatesParams) => {
  return {
    enabled: !!publicClient && !!addresses,
    queryKey: [QUERY_KEYS.membership.getCandidates, addresses],
    queryFn: async (): Promise<Record<Address, Candidate>> => {
      const multicallCandidates = addresses.map((address: string) => ({
        address: ENV.axeMembershipAddress,
        abi: axeMembershipAbi,
        functionName: 'getCandidate',
        args: [address],
      }));

      const results = publicClient ? await publicClient.multicall({
        contracts: multicallCandidates,
      }) : [];

      return addresses.reduce(
        (acc, address, index) => {
          const result = results[index].result;

          if (result && typeof result === 'object') {
            const typedResult = result as CandidateResult;
            acc[address as Address] = {
              walletAddress: address as Address,
              delegationCount: Number(typedResult.delegationCount),
              available: typedResult.available,
            };
          }
          return acc;
        },
        {} as Record<Address, Candidate>,
      );
    },
  } as const;
};

/**
 * Returns query options for all historical candidate addresses in AxeMembership contract based on
 * CandidateEnlisted and CandidateResigned events.
 * @param publicClient - The public client to use for the query.
 * @returns Query options for the getCandidateAddresses query.
 */
export const getCandidateAddressesOptions = ({ publicClient }: { publicClient?: PublicClient }) => ({
  enabled: !!publicClient,
  queryKey: [QUERY_KEYS.membership.getAllCandidateAddresses],
  queryFn: async (): Promise<Address[]> => {

    const [enlistLogs, resignLogs] = await Promise.all([
      publicClient ? publicClient.getContractEvents({
        address: ENV.axeMembershipAddress,
        abi: axeMembershipAbi,
        eventName: 'CandidateEnlisted',
        fromBlock: 'earliest',
      }) : [],
      publicClient ? publicClient.getContractEvents({
        address: ENV.axeMembershipAddress,
        abi: axeMembershipAbi,
        eventName: 'CandidateResigned',
        fromBlock: 'earliest',
      }) : [],
    ]);

    // Get all unique addresses that were ever candidates
    const uniqueCandidates = new Set<Address>();
    for (const log of [...enlistLogs, ...resignLogs]) {
      const args = log.args as { candidate: Address };
      uniqueCandidates.add(args.candidate);
    }

    return Array.from(uniqueCandidates);
  },
});
