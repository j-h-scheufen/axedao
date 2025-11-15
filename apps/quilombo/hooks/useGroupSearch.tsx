'use client';

import { useState, useMemo, useEffect } from 'react';
import { debounce } from 'lodash';
import { parseAsString, useQueryStates } from 'nuqs';
import { useSetAtom, useAtomValue } from 'jotai';
import { isEqual } from 'lodash';

import { SEARCH_INPUT_DEBOUNCE, PARAM_KEY_GROUP_QUERY, QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { useSearchGroups } from '@/query/group';
import { filteredLocationsAtom, locationsAtom } from './state/location';
import type { Group } from '@/types/model';

export interface UseGroupSearchParams {
  countryCodes?: string[];
}

export interface UseGroupSearchResult {
  searchTerm: string | undefined;
  setSearchTerm: (term: string | undefined) => void;
  groups: Group[];
  totalCount: number;
  isLoading: boolean;
  hasNextPage: boolean;
  fetchNextPage: () => void;
}

const useGroupSearch = (params?: UseGroupSearchParams): UseGroupSearchResult => {
  const { countryCodes } = params || {};

  const [{ [PARAM_KEY_GROUP_QUERY]: urlSearchTerm }, setQueryStates] = useQueryStates({
    [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
  });

  const [searchTerm, setSearchTerm] = useState<string | undefined>(urlSearchTerm);

  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchGroups({
    searchTerm,
    pageSize: QUERY_DEFAULT_PAGE_SIZE,
    offset: 0,
    filters: {
      countryCodes,
    },
  });

  const setFilteredLocations = useSetAtom(filteredLocationsAtom);
  const allLocations = useAtomValue(locationsAtom);

  // Sync URL search term with hook state on mount
  useEffect(() => {
    if (urlSearchTerm !== searchTerm) {
      setSearchTerm(urlSearchTerm);
    }
  }, [urlSearchTerm, searchTerm]);

  // Debounced function that updates both search term and URL
  const debouncedSetSearchTerm = useMemo(
    () =>
      debounce((term: string | undefined) => {
        setSearchTerm(term);
        setQueryStates({ [PARAM_KEY_GROUP_QUERY]: term || null });
      }, SEARCH_INPUT_DEBOUNCE),
    [setQueryStates]
  );

  // Cleanup the debounced function on unmount
  useEffect(() => {
    return () => {
      debouncedSetSearchTerm.cancel();
    };
  }, [debouncedSetSearchTerm]);

  const groupResults = useMemo(() => {
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
      const groupIds = new Set(groupResults.map((g) => g.id));
      return {
        ...locationsData,
        features: locationsData.features.filter((feature) => groupIds.has(feature.properties?.groupId)),
      };
    }
  }, [searchTerm, groupResults, locationsData]);

  useEffect(() => {
    if (!filteredLocations || !locationsData) return;
    setFilteredLocations((prev) => (isEqual(prev, filteredLocations) ? prev : filteredLocations));
  }, [filteredLocations, setFilteredLocations, locationsData]);

  return {
    searchTerm,
    setSearchTerm: debouncedSetSearchTerm,
    groups: groupResults,
    totalCount: groupResults.length,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useGroupSearch;
