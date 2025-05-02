'use client';

import { useCallback, useEffect } from 'react';
import { useAtom, useAtomValue, useSetAtom } from 'jotai';
import { useQuery, useQueryClient } from '@tanstack/react-query';

import { publicClientAtom } from './state/web3';
import { lastSyncedBlockAtom, latestBlockNumberAtom } from './state/app';
import { QUERY_KEYS } from '@/query';
import { getCandidatesOptions, getCandidateChangesOptions } from '@/query/dao';
import { candidatesDictionaryAtom, candidatesSyncEnabledAtom } from './state/dao';
import { QueryConfig } from '@/config/constants';

/**
 * Global sync manager hook - use this ONCE at app root
 *
 * This hook is responsible for syncing the candidates dictionary with the latest block number
 * and the last synced block number.
 *
 * TODO: this entire mechanism should be replaced with a subscription-based approach to events
 *
 */
export function useSyncManager() {
  const publicClient = useAtomValue(publicClientAtom);
  const [lastSyncedBlock, setLastSyncedBlock] = useAtom(lastSyncedBlockAtom);
  const setLatestBlock = useSetAtom(latestBlockNumberAtom);
  const candidateSyncEnabled = useAtomValue(candidatesSyncEnabledAtom);
  const setDictionary = useSetAtom(candidatesDictionaryAtom);

  // Get latest block number
  const blockNumberQuery = useQuery({
    queryKey: [QUERY_KEYS.global.blockNumber],
    queryFn: async () => {
      if (!publicClient) return null;
      return publicClient.getBlockNumber();
    },
    enabled: !!publicClient && candidateSyncEnabled,
    refetchInterval: QueryConfig.staleTimeSync,
    staleTime: 1000,
  });

  // Get candidate changes since last sync
  const changesQuery = useQuery({
    queryKey: [
      QUERY_KEYS.membership.getCandidateChanges,
      lastSyncedBlock ? lastSyncedBlock.toString() : 'earliest',
      blockNumberQuery.data ? blockNumberQuery.data.toString() : null,
    ],
    queryFn: async () => {
      if (!publicClient || !blockNumberQuery.data) return null;
      return getCandidateChangesOptions({
        publicClient,
        fromBlock: lastSyncedBlock || 'earliest',
        toBlock: blockNumberQuery.data,
      }).queryFn();
    },
    enabled:
      !!publicClient &&
      candidateSyncEnabled &&
      !!blockNumberQuery.data &&
      blockNumberQuery.data > (lastSyncedBlock ?? 0n),
  });

  // Get candidate details when changes are detected
  const detailsQuery = useQuery({
    queryKey: [
      QUERY_KEYS.membership.getCandidates,
      changesQuery.data?.addresses,
      blockNumberQuery.data ? blockNumberQuery.data.toString() : null,
    ],
    queryFn: async () => {
      if (!publicClient || !changesQuery.data?.addresses.length) return null;
      return getCandidatesOptions({
        publicClient,
        addresses: changesQuery.data.addresses,
      }).queryFn();
    },
    enabled: !!publicClient && !!changesQuery.data?.addresses && changesQuery.data.addresses.length > 0,
  });

  // Update latest block
  useEffect(() => {
    if (blockNumberQuery.data) {
      setLatestBlock(blockNumberQuery.data);
    }
  }, [blockNumberQuery.data, setLatestBlock]);

  // Update dictionary and sync state
  useEffect(() => {
    if (detailsQuery.data && blockNumberQuery.data && blockNumberQuery.data > (lastSyncedBlock ?? 0n)) {
      setDictionary((prev) => ({
        ...prev,
        ...detailsQuery.data,
      }));
      setLastSyncedBlock(blockNumberQuery.data);
    }
  }, [detailsQuery.data, blockNumberQuery.data, lastSyncedBlock, setDictionary, setLastSyncedBlock]);
}

/**
 * Invalidates the global blocknumber query to trigger refetching of dependent queries
 * @returns a function to retrigger sync-dependent queries
 */
export function useInvalidateSync() {
  const queryClient = useQueryClient();
  const publicClient = useAtomValue(publicClientAtom);

  return useCallback(
    async (receipt?: { blockNumber: bigint }) => {
      if (receipt?.blockNumber) {
        // just in case the block number is not yet available, we'll wait for it
        const waitForBlock = async (targetBlock: bigint): Promise<void> => {
          const currentBlock = await publicClient?.getBlockNumber();
          if (!currentBlock || currentBlock < targetBlock) {
            await new Promise((resolve) => setTimeout(resolve, 1000));
            return waitForBlock(targetBlock);
          }
        };
        await waitForBlock(receipt.blockNumber);
      }
      queryClient.invalidateQueries({
        queryKey: [QUERY_KEYS.global.blockNumber],
      });
    },
    [queryClient, publicClient]
  );
}
