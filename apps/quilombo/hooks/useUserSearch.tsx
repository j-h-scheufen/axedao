'use client';

import { useState, useMemo, useEffect } from 'react';
import { debounce } from 'lodash';
import { useSearchParams, useRouter, usePathname } from 'next/navigation';

import { SEARCH_INPUT_DEBOUNCE } from '@/config/constants';
import { useSearchUsers } from '@/query/user';

const queryKey = 'uq';

const useUserSearch = () => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const pathname = usePathname();
  const urlSearchTerm = searchParams.get(queryKey) || '';

  const [searchTerm, setSearchTerm] = useState<string | undefined>(urlSearchTerm);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchUsers({
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
          params.set(queryKey, term);
        } else {
          params.delete(queryKey);
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
    users: data?.pages.flatMap((page) => page.data) || [],
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useUserSearch;
