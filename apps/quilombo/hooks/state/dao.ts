'use client';

import { atom, useAtom, useAtomValue, useSetAtom } from 'jotai';
import { useCallback, useEffect, useMemo, useRef } from 'react';
import { useAccount, usePublicClient, useWaitForTransactionReceipt } from 'wagmi';
import { enqueueSnackbar } from 'notistack';
import type { Address } from 'viem';

import ENV from '@/config/environment';
import {
  axeMembershipAbi,
  useReadAxeMembershipCouncilGetCurrentMembers,
  useReadAxeMembershipCouncilGetJoiningMembers,
  useReadAxeMembershipCouncilGetLeavingMembers,
  useReadErc20BalanceOf,
  useWriteAxeMembershipCouncilRequestCouncilUpdate,
} from '@/generated';
import { searchUsersByAddressesOptions, useSearchUsersByAddresses } from '@/query/user';
import type { CandidateResult } from '@/query/dao';
import type { User } from '@/types/model';
import { currentUserAtom, currentUserWalletAddressAtom } from './currentUser';
import { useInitializePublicClient } from './web3';
import { atomWithQuery } from 'jotai-tanstack-query';
import { useGetProposals } from '@/query/subgraph';

// copied from baal-sdk
export const PROPOSAL_STATUS = {
  VOTING: 'voting',
  GRACE: 'grace',
  READY: 'ready',
  PROCESSED: 'processed',
  DEFEATED: 'defeated',
  FAILED: 'failed',
  CANCELLED: 'cancelled',
} as const;

export interface Proposal {
  id: number;
  proposalDataHash: `0x${string}`;
  votingPeriod: number;
  expiration: number;
  details: string;
  status: ProposalStatus;
  timestamp: number;
}

export type ProposalStatus = (typeof PROPOSAL_STATUS)[keyof typeof PROPOSAL_STATUS];

export const isProposalActive = (status: ProposalStatus): boolean => {
  return status === PROPOSAL_STATUS.VOTING || status === PROPOSAL_STATUS.GRACE || status === PROPOSAL_STATUS.READY;
};

export const isProposalFinal = (status: ProposalStatus): boolean => {
  return (
    status === PROPOSAL_STATUS.CANCELLED ||
    status === PROPOSAL_STATUS.PROCESSED ||
    status === PROPOSAL_STATUS.DEFEATED ||
    status === PROPOSAL_STATUS.FAILED
  );
};

export interface ProposalsState {
  proposals: Proposal[];
  loading: boolean;
  initialized: boolean;
  error: string | null;
}

export interface Candidate {
  walletAddress: Address;
  delegationCount: number;
  available: boolean;
}

export type CandidateUser = Candidate & User;

export interface CouncilState {
  members: CandidateUser[];
  loading: boolean;
  initialized: boolean;
  error: string | null;
}

//********************************************************************************
//
//  ATOMS
//
//********************************************************************************

export const proposalsAtom = atom<ProposalsState>({
  proposals: [],
  loading: false,
  initialized: false,
  error: null,
});

// Derived atom for easier access to only active proposals
export const activeProposalsAtom = atom<Proposal[]>((get) => {
  const { proposals } = get(proposalsAtom);
  return proposals.filter((proposal) => isProposalActive(proposal.status));
});

// 1. CORE ATOMS
export const candidatesDictionaryAtom = atom<Record<Address, Candidate>>({} as Record<Address, Candidate>);

// Add a new atom for the direct query sync
export const directCandidatesSyncEnabledAtom = atom<boolean>(false);

// Keep the old atom but don't use it anymore
export const candidatesSyncEnabledAtom = atom<boolean>(false);

export const candidateUsersAtom = atom<CandidateUser[]>((get) => {
  const dictionary = get(candidatesDictionaryAtom);
  const candidates = Object.values(dictionary);
  const usersQuery = get(candidateUsersQueryAtom);

  // If users query is loading or errored, return empty array
  // This will be updated when user data becomes available
  if (!usersQuery.data || usersQuery.isLoading || usersQuery.isError) {
    return [];
  }

  // Create a map for quick user lookup
  const userMap = usersQuery.data.reduce(
    (acc, user) => {
      acc[user.walletAddress as Address] = user;
      return acc;
    },
    {} as Record<Address, User>
  );

  // Merge candidate data with user data
  const result = candidates.map((candidate) => {
    const user = userMap[candidate.walletAddress];
    if (user) {
      return { ...candidate, ...user };
    }
    // For candidates without user data, create a minimal user profile
    return {
      ...candidate,
      id: '',
      name: `${candidate.walletAddress.slice(0, 6)}...${candidate.walletAddress.slice(-4)}`,
      nickname: '',
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      profilePictureUrl: null,
      bannerUrl: null,
      bio: null,
      location: null,
      website: null,
      twitter: null,
    };
  }) as CandidateUser[];

  return result;
});

export const candidateUsersQueryAtom = atomWithQuery((get) => {
  const dictionary = get(candidatesDictionaryAtom);
  const addresses = Object.keys(dictionary) as Address[];

  return searchUsersByAddressesOptions({
    addresses,
  });
});

// Add a sorted version for convenience
export const sortedCandidateUsersAtom = atom((get) => {
  const candidates = get(availableCandidateUsersAtom);
  return [...candidates].sort((a, b) => b.delegationCount - a.delegationCount);
});

// Add a sorted version for convenience
export const availableCandidateUsersAtom = atom((get) => {
  const candidates = get(candidateUsersAtom);
  return candidates.filter((c) => c.available);
});

export const isCurrentUserEnlistedAtom = atom((get) => {
  const currentUser = get(currentUserAtom);
  const dictionary = get(candidatesDictionaryAtom);
  const address = currentUser?.data?.walletAddress;
  return dictionary?.[address as Address]?.available;
});

export const isCurrentUserOnCouncilAtom = atom((get) => {
  const address = get(currentUserWalletAddressAtom);
  const currentMembers = get(currentCouncilAddressesAtom);
  return address && currentMembers ? currentMembers.includes(address as Address) : false;
});

export const councilAtom = atom<CouncilState>({
  members: [],
  loading: false,
  initialized: false,
  error: null,
});

export const incomingAddressesAtom = atom<Address[]>([]);
export const outgoingAddressesAtom = atom<Address[]>([]);
export const currentCouncilAddressesAtom = atom<Address[]>([]);

// Derived atoms with user data
export const incomingCouncilUsersAtom = atomWithQuery((get) =>
  searchUsersByAddressesOptions({
    addresses: get(incomingAddressesAtom),
  })
);

export const outgoingCouncilUsersAtom = atomWithQuery((get) =>
  searchUsersByAddressesOptions({
    addresses: get(outgoingAddressesAtom),
  })
);

//********************************************************************************
//
//  HOOKS
//
//********************************************************************************

export function useProposals() {
  const [state, setState] = useAtom(proposalsAtom);
  const { data: proposals, isLoading, error, refetch } = useGetProposals();

  useEffect(() => {
    if (!state.initialized && !isLoading && proposals) {
      setState({
        proposals,
        loading: isLoading,
        initialized: true,
        error: error ? 'Error loading proposals' : null,
      });
    }
  }, [proposals, isLoading, error, state.initialized, setState]);

  return {
    ...state,
    refresh: refetch,
  };
}

export function useVotingShares() {
  const account = useAccount();

  const {
    data: balance,
    isLoading,
    error,
    refetch,
  } = useReadErc20BalanceOf({
    address: ENV.daoSharesAddress,
    args: [account.address as Address],
  });

  return { balance, isLoading, error, refetch };
}

export function useLootShares() {
  const account = useAccount();

  const {
    data: balance,
    isLoading,
    error,
    refetch,
  } = useReadErc20BalanceOf({
    address: ENV.daoLootAddress,
    args: [account.address as Address],
  });

  return { balance, isLoading, error, refetch };
}

export function useCouncil() {
  const [state, setState] = useAtom(councilAtom);
  const publicClient = usePublicClient();

  const renderCount = useRef(0);
  renderCount.current++;

  const { data: currentMembers, isLoading: membersLoading } = useReadAxeMembershipCouncilGetCurrentMembers({
    address: ENV.axeMembershipCouncilAddress,
  });

  const { data: councilUsers, isLoading: councilUsersLoading } = useSearchUsersByAddresses({
    addresses: currentMembers?.map((m) => m) ?? [],
  });

  // Memoize loading state
  const isLoading = useMemo(
    () => state.loading || membersLoading || councilUsersLoading,
    [state.loading, membersLoading, councilUsersLoading]
  );

  // TODO the candidates to display for members should already be loaded in the candidatesDictionaryAtom!
  // components just need to use the "candidatesSync" flag to turn trigger the sync
  const loadCouncilMembers = useCallback(async () => {
    if (!currentMembers || !councilUsers || !publicClient || state.initialized) {
      return;
    }

    setState((prev) => ({ ...prev, loading: true }));

    try {
      const multicallCandidates = currentMembers.map((address) => ({
        address: ENV.axeMembershipAddress,
        abi: axeMembershipAbi,
        functionName: 'getCandidate',
        args: [address],
      }));

      const candidateResults = await publicClient.multicall({
        contracts: multicallCandidates,
      });

      const mergedMembers = currentMembers
        .map((address, index) => {
          const result = candidateResults[index].result;
          if (!result || typeof result !== 'object') {
            console.warn(`Invalid candidate data for ${address}`);
            return null;
          }

          const delegationCount = result[0] as bigint;
          const available = result[1] as boolean;
          const user = councilUsers.find((user) => user.walletAddress === address);

          return {
            walletAddress: address,
            delegationCount: Number(delegationCount), // safe to assume delegationCount will never be outside of number range
            available,
            ...(user || {}),
          } as CandidateUser;
        })
        .filter((member): member is CandidateUser => member !== null);

      setState((prev) => ({
        ...prev,
        members: mergedMembers,
        initialized: true,
        error: null,
      }));
    } catch (error) {
      console.error('[useCouncil] Error:', error);
    } finally {
      setState((prev) => ({ ...prev, loading: false }));
    }
  }, [currentMembers, councilUsers, publicClient, state.initialized, setState]);

  useEffect(() => {
    if (!state.initialized && !isLoading) {
      loadCouncilMembers();
    }
  }, [loadCouncilMembers, state.initialized, isLoading]);

  return {
    members: state.members,
    isLoading,
    error: state.error,
    refresh: loadCouncilMembers,
  };
}

// Hook to trigger initial loading
export function useInitializeCouncilState() {
  useInitializePublicClient();

  const { data: incomingAddresses } = useReadAxeMembershipCouncilGetJoiningMembers({
    address: ENV.axeMembershipCouncilAddress,
  });

  const { data: outgoingAddresses } = useReadAxeMembershipCouncilGetLeavingMembers({
    address: ENV.axeMembershipCouncilAddress,
  });

  const { data: currentMembers } = useReadAxeMembershipCouncilGetCurrentMembers({
    address: ENV.axeMembershipCouncilAddress,
  });

  const setIncoming = useSetAtom(incomingAddressesAtom);
  const setOutgoing = useSetAtom(outgoingAddressesAtom);
  const setCurrentMembers = useSetAtom(currentCouncilAddressesAtom);

  useEffect(() => {
    if (incomingAddresses) {
      setIncoming(incomingAddresses.map((a) => a));
    }
  }, [incomingAddresses, setIncoming]);

  useEffect(() => {
    if (outgoingAddresses) {
      setOutgoing(outgoingAddresses.map((a) => a));
    }
  }, [outgoingAddresses, setOutgoing]);

  useEffect(() => {
    if (currentMembers) {
      setCurrentMembers(currentMembers.map((a) => a));
    }
  }, [currentMembers, setCurrentMembers]);
}

export function useCouncilUpdateRequest({
  onSuccess,
}: {
  onSuccess?: () => void | Promise<void>;
}) {
  const {
    writeContract,
    data: hash,
    error: writeError,
    isPending: isWritePending,
  } = useWriteAxeMembershipCouncilRequestCouncilUpdate();

  const {
    isLoading: isConfirming,
    isSuccess,
    error: confirmError,
  } = useWaitForTransactionReceipt({
    hash: hash as `0x${string}`,
  });

  // Handle update transaction states
  useEffect(() => {
    if (isWritePending) {
      enqueueSnackbar('Requesting council update...', { autoHideDuration: 3000 });
    } else if (isSuccess) {
      enqueueSnackbar('Council update requested successfully!');
      onSuccess?.();
    } else if (writeError) {
      enqueueSnackbar(`Failed to request update: ${writeError.message}`, { variant: 'error' });
    }
  }, [isWritePending, isSuccess, writeError, onSuccess]);

  return {
    requestUpdate: () => writeContract({ address: ENV.axeMembershipCouncilAddress }),
    isPending: isWritePending || isConfirming,
    error: writeError || confirmError,
    hash,
  };
}

// Modify useCandidatesSync to use the new atom
export function useCandidatesSync() {
  const publicClient = usePublicClient();
  const setCandidatesDictionary = useSetAtom(candidatesDictionaryAtom);
  const syncEnabled = useAtomValue(directCandidatesSyncEnabledAtom);

  useEffect(() => {
    if (!syncEnabled || !publicClient) return;

    const fetchTopCandidates = async () => {
      try {
        // Get top 100 candidates
        const result = await publicClient.readContract({
          address: ENV.axeMembershipAddress,
          abi: axeMembershipAbi,
          functionName: 'getTopCandidates',
          args: [0n, 100n],
        });

        if (result && Array.isArray(result) && result[0]) {
          const [addresses] = result as [Address[], boolean];
          const validAddresses = addresses.filter((addr) => addr !== '0x0000000000000000000000000000000000000000');

          if (validAddresses.length === 0) return;

          const candidateDetails = await publicClient.multicall({
            contracts: validAddresses.map((address) => ({
              address: ENV.axeMembershipAddress,
              abi: axeMembershipAbi,
              functionName: 'getCandidate',
              args: [address],
            })),
          });

          const newDictionary: Record<Address, Candidate> = {};
          validAddresses.forEach((address, i) => {
            const result = candidateDetails[i].result as unknown as CandidateResult;
            if (result) {
              newDictionary[address] = {
                walletAddress: address,
                delegationCount: Number(result.delegationCount),
                available: result.available,
              };
            }
          });

          setCandidatesDictionary(newDictionary);
        }
      } catch (error) {
        console.error('Error fetching candidates:', error);
      }
    };

    fetchTopCandidates();
    const interval = setInterval(fetchTopCandidates, 300000);
    return () => clearInterval(interval);
  }, [syncEnabled, publicClient, setCandidatesDictionary]);
}
