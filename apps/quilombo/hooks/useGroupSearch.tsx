'use client';

import { useState } from 'react';
import { useDebounce } from 'use-debounce';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { useSearchGroups } from '@/query/group';

const useGroupSearch = () => {
  const [searchTerm, setSearchTerm] = useState<string | undefined>();
  const [debouncedSearchTerm] = useDebounce(searchTerm, 750);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchGroups({
    searchTerm: debouncedSearchTerm,
    pageSize: QUERY_DEFAULT_PAGE_SIZE,
    offset: 0,
  });

  return {
    searchTerm,
    setSearchTerm,
    groups: data?.pages.flatMap((page) => page.data) || [],
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useGroupSearch;
