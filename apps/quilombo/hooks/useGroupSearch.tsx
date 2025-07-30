'use client';

import { useState, useMemo, useEffect } from 'react';
import { debounce } from 'lodash';
import { parseAsString, useQueryStates } from 'nuqs';

import { SEARCH_INPUT_DEBOUNCE, PARAM_KEY_GROUP_QUERY } from '@/config/constants';
import { useSearchGroups } from '@/query/group';
import type { Group } from '@/types/model';

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
  const [{ [PARAM_KEY_GROUP_QUERY]: urlSearchTerm }, setQueryStates] = useQueryStates({
    [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
  });

  const [searchTerm, setSearchTerm] = useState<string | undefined>(urlSearchTerm);

  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchGroups({
    searchTerm,
  });

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

  return {
    searchTerm,
    setSearchTerm: debouncedSetSearchTerm,
    groups: data?.pages.flatMap((page) => page.data) || [],
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useGroupSearch;
