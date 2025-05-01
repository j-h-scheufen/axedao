'use client';

import { useCallback, useEffect } from 'react';
import { useAtom, useAtomValue, useSetAtom } from 'jotai';
import { useQuery, useQueryClient } from '@tanstack/react-query';

import { publicClientAtom } from './state/web3';
import { lastSyncedBlockAtom, latestBlockNumberAtom } from './state/app';
import { QUERY_KEYS } from '@/query';
import { getCandidatesOptions, getCandidateChangesOptions } from '@/query/dao';
import { candidatesDictionaryAtom, candidatesSyncEnabledAtom } from './state/dao';

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
  const [dictionary, setDictionary] = useAtom(candidatesDictionaryAtom);

  // Get latest block number
  const blockNumberQuery = useQuery({
    queryKey: [QUERY_KEYS.global.blockNumber],
    queryFn: async () => {
      if (!publicClient) return null;
      const blockNumber = await publicClient.getBlockNumber();
      console.log('[DEBUG] New block number:', blockNumber);
      return blockNumber;
    },
    enabled: !!publicClient && candidateSyncEnabled,
    refetchInterval: 60000, // 1 minute
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
    enabled: !!publicClient && candidateSyncEnabled && !!blockNumberQuery.data,
  });

  // Get candidate details when changes are detected
  const detailsQuery = useQuery({
    queryKey: [QUERY_KEYS.membership.getCandidates, changesQuery.data?.addresses],
    queryFn: async () => {
      if (!publicClient || !changesQuery.data?.addresses.length) return null;
      return getCandidatesOptions({
        publicClient,
        addresses: changesQuery.data.addresses,
      }).queryFn();
    },
    enabled: !!publicClient && !!changesQuery.data?.addresses.length,
  });

  // Update state when new data is available
  useEffect(() => {
    if (blockNumberQuery.data) {
      setLatestBlock(blockNumberQuery.data);
    }
  }, [blockNumberQuery.data, setLatestBlock]);

  useEffect(() => {
    if (detailsQuery.data) {
      setDictionary((prev) => ({
        ...prev,
        ...detailsQuery.data,
      }));
      // Update last synced block after successful sync
      if (blockNumberQuery.data) {
        setLastSyncedBlock(blockNumberQuery.data);
      }
    }
  }, [detailsQuery.data, blockNumberQuery.data, setDictionary, setLastSyncedBlock]);

  // Debug logging
  useEffect(() => {
    console.log('[DEBUG] SyncManager State:', {
      candidateSyncEnabled,
      lastSyncedBlock,
      latestBlock: blockNumberQuery.data,
      changesFound: changesQuery.data?.addresses.length || 0,
      dictionarySize: Object.keys(dictionary).length,
    });
  }, [candidateSyncEnabled, lastSyncedBlock, blockNumberQuery.data, changesQuery.data, dictionary]);
}

export function useInvalidateSync() {
  const queryClient = useQueryClient();

  return useCallback(() => {
    queryClient.invalidateQueries({
      queryKey: [QUERY_KEYS.global.blockNumber],
    });
  }, [queryClient]);
}
