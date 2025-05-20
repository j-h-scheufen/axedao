import type { Address, PublicClient } from 'viem';

import ENV from '@/config/environment';
import { axeMembershipAbi } from '@/generated';
import type { Candidate } from '@/hooks/state/dao';
import { type GetCandidatesParams, QUERY_KEYS } from '.';
import { queryOptions, useQuery } from '@tanstack/react-query';

export type CandidateResult = {
  delegationCount: bigint;
  available: boolean;
  next: Address;
};

type GetCandidateChangesParams = {
  publicClient?: PublicClient;
  fromBlock: bigint | 'earliest';
  toBlock?: bigint;
};

export type GetTopCandidatesParams = {
  offset?: number;
  pageSize?: number;
  publicClient?: PublicClient;
};

export type AddressesInBlockRange = {
  addresses: Address[];
  fromBlock: bigint | 'earliest';
  toBlock?: bigint;
};

/**
 * Returns query options for retrieving paginated top candidates from the AxeMembership contract.
 * @param offset - The offset to start retrieving candidates from.
 * @param pageSize - The number of candidates to retrieve.
 * @param publicClient - The public client to use for the query.
 * @returns Query options for the getTopCandidates query.
 */
export const getTopCandidatesOptions = ({ offset = 0, pageSize = 10, publicClient }: GetTopCandidatesParams) =>
  ({
    enabled: !!publicClient,
    queryKey: [QUERY_KEYS.membership.getTopCandidates, offset, pageSize],
    queryFn: async (): Promise<{ addresses: Address[]; hasMore: boolean }> => {
      try {
        const result = publicClient
          ? await publicClient.readContract({
              address: ENV.axeMembershipAddress,
              abi: axeMembershipAbi,
              functionName: 'getTopCandidates',
              args: [BigInt(offset), BigInt(pageSize)],
            })
          : [[], false];

        // Result is a tuple [address[], boolean]
        const [addresses, hasMore] = result as [Address[], boolean];

        // Filter out zero addresses
        const filteredAddresses = addresses.filter((addr) => addr !== '0x0000000000000000000000000000000000000000');

        return {
          addresses: filteredAddresses,
          hasMore,
        };
      } catch (error) {
        console.error('Error fetching top candidates:', error);
        return { addresses: [], hasMore: false };
      }
    },
  }) as const;

/**
 * Returns query options for all candidate addresses that had status changes (enlisted/resigned)
 * within a specific block range.
 * @param publicClient - The public client to use for the query.
 * @param fromBlock - The block to start querying from.
 * @param toBlock - The block to end querying at.
 * @returns Query options for the getCandidateChanges query.
 */
export const getCandidateChangesOptions = ({
  publicClient,
  fromBlock = 'earliest',
  toBlock,
}: GetCandidateChangesParams) =>
  ({
    enabled: !!publicClient && !!toBlock,
    queryKey: [QUERY_KEYS.membership.getCandidateChanges, fromBlock, toBlock],
    queryFn: async (): Promise<AddressesInBlockRange> => {
      if (!publicClient) return { addresses: [], fromBlock };

      // Get all relevant events
      const [enlistEvents, resignEvents, delegateEvents, undelegateEvents] = await Promise.all([
        publicClient.getContractEvents({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          eventName: 'CandidateEnlisted',
          fromBlock,
          toBlock,
        }),
        publicClient.getContractEvents({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          eventName: 'CandidateResigned',
          fromBlock,
          toBlock,
        }),
        publicClient.getContractEvents({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          eventName: 'VoteDelegated',
          fromBlock,
          toBlock,
        }),
        publicClient.getContractEvents({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          eventName: 'VoteUndelegated',
          fromBlock,
          toBlock,
        }),
      ]);

      // Get all unique addresses from the events
      const changedCandidates = new Set<Address>();

      // Add candidates from enlist/resign events
      for (const log of [...enlistEvents, ...resignEvents, ...delegateEvents, ...undelegateEvents]) {
        const args = log.args as { candidate: Address };
        changedCandidates.add(args.candidate);
      }

      return {
        addresses: Array.from(changedCandidates),
        fromBlock,
        toBlock,
      };
    },
  }) as const;

/**
 * Returns query options for retrieving current candidate details for a list of addresses.
 * @param addresses - The addresses to get candidate details for.
 * @param publicClient - The public client to use for the query.
 * @returns Query options for the getCandidateDetails query.
 */
export const getCandidatesOptions = ({ addresses, publicClient }: GetCandidatesParams) =>
  ({
    enabled: !!publicClient && !!addresses,
    queryKey: [QUERY_KEYS.membership.getCandidates, addresses],
    queryFn: async (): Promise<Record<Address, Candidate>> => {
      if (!publicClient || addresses.length === 0) {
        return {};
      }

      const multicallCandidates = addresses.map((address) => ({
        address: ENV.axeMembershipAddress,
        abi: axeMembershipAbi,
        functionName: 'getCandidate',
        args: [address],
      }));

      const results = await publicClient.multicall({
        contracts: multicallCandidates,
      });

      // Add logging to see what we get from the contract
      console.log('[DEBUG] Multicall results:', results);

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
        {} as Record<Address, Candidate>
      );
    },
  }) as const;

// *** HOOKS ***
export const useGetTopCandidates = (params: GetTopCandidatesParams) => {
  return useQuery(queryOptions(getTopCandidatesOptions(params)));
};

export const useGetCandidateChanges = (params: GetCandidateChangesParams) => {
  return useQuery(queryOptions(getCandidateChangesOptions(params)));
};

export const useGetCandidates = (params: GetCandidatesParams) => {
  return useQuery(queryOptions(getCandidatesOptions(params)));
};
