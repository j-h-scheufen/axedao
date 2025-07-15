'use client';

import { useMemo, useEffect, useState, useCallback } from 'react';
import { useSetAtom, useAtomValue } from 'jotai';
import { isEqual, debounce } from 'lodash';
import { useSearchParams, useRouter, usePathname } from 'next/navigation';

import { QUERY_DEFAULT_PAGE_SIZE, SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import { useSearchGroups } from '@/query/group';
import { filteredLocationsAtom } from './state/location';
import { locationsAtom } from './state/location';
import type { Group } from '@/types/model';

const queryKey = 'gq';

export interface UseGroupSearchResult {
  searchTerm: string | undefined;
  setSearchTerm: (term: string | undefined) => void;
  groups: Group[];
  totalCount: number;
  isLoading: boolean;
  hasNextPage: boolean;
  fetchNextPage: () => void;
}

const useGroupSearch = (): UseGroupSearchResult => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const pathname = usePathname();
  const urlSearchTerm = searchParams.get(queryKey) || '';

  const [searchTerm, setSearchTerm] = useState<string | undefined>(urlSearchTerm);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchGroups({
    searchTerm,
    pageSize: QUERY_DEFAULT_PAGE_SIZE,
    offset: 0,
  });

  const setFilteredLocations = useSetAtom(filteredLocationsAtom);
  const allLocations = useAtomValue(locationsAtom);

  // Sync URL search term with hook state on mount
  useEffect(() => {
    if (urlSearchTerm !== searchTerm) {
      setSearchTerm(urlSearchTerm);
    }
  }, [urlSearchTerm, searchTerm]);

  const updateUrlSearchTerm = useCallback(
    (term: string | undefined) => {
      // Update URL
      const params = new URLSearchParams(searchParams);
      if (term) {
        params.set(queryKey, term);
      } else {
        params.delete(queryKey);
      }
      router.replace(`${pathname}?${params.toString()}`, { scroll: false });
    },
    [searchParams, router, pathname]
  );

  // Debounced function that updates both search term and URL
  const debouncedSetSearchTerm = useMemo(
    () =>
      debounce((term: string | undefined) => {
        setSearchTerm(term);
        updateUrlSearchTerm(term);
      }, SEARCH_INPUT_DEBOUNCE),
    [updateUrlSearchTerm]
  );

  // Cleanup the debounced function on unmount
  useEffect(() => {
    return () => {
      debouncedSetSearchTerm.cancel();
    };
  }, [debouncedSetSearchTerm]);

  // Memoize groups and locationsData
  const groups = useMemo(() => {
    return data?.pages.flatMap((page) => page.data) || [];
  }, [data]);
  const locationsData = useMemo(() => {
    return allLocations.data;
  }, [allLocations.data]);

  const filteredLocations = useMemo(() => {
    if (!locationsData) {
      return { type: 'FeatureCollection' as const, features: [] };
    } else if (!searchTerm) {
      return locationsData;
    } else {
      const groupIds = new Set(groups.map((g) => g.id));
      return {
        ...locationsData,
        features: locationsData.features.filter((feature) => groupIds.has(feature.properties?.groupId)),
      };
    }
  }, [searchTerm, groups, locationsData]);

  useEffect(() => {
    if (!filteredLocations || !locationsData) return;
    setFilteredLocations((prev) => (isEqual(prev, filteredLocations) ? prev : filteredLocations));
  }, [filteredLocations, setFilteredLocations, locationsData]);

  return {
    searchTerm,
    setSearchTerm: debouncedSetSearchTerm,
    groups,
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useGroupSearch;
