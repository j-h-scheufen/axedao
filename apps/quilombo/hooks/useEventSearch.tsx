'use client';

import { useState, useMemo, useEffect } from 'react';
import { debounce } from 'lodash';
import { useSearchParams, useRouter, usePathname } from 'next/navigation';

import { SEARCH_INPUT_DEBOUNCE, PARAM_KEY_EVENT_QUERY } from '@/config/constants';
import { useSearchEvents } from '@/query/event';

const useEventSearch = () => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const pathname = usePathname();
  const urlSearchTerm = searchParams.get(PARAM_KEY_EVENT_QUERY) || '';

  const [searchTerm, setSearchTerm] = useState<string | undefined>(urlSearchTerm);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchEvents({
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

        // Update URL
        const params = new URLSearchParams(searchParams);
        if (term) {
          params.set(PARAM_KEY_EVENT_QUERY, term);
        } else {
          params.delete(PARAM_KEY_EVENT_QUERY);
        }
        router.replace(`${pathname}?${params.toString()}`, { scroll: false });
      }, SEARCH_INPUT_DEBOUNCE),
    [searchParams, router, pathname]
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
    events: data?.pages.flatMap((page) => page.data) || [],
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useEventSearch;
