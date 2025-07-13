'use client';

import { useState } from 'react';
import { useDebounce } from 'use-debounce';

import { useSearchUsers } from '@/query/user';

const useUserSearch = () => {
  const [searchTerm, setSearchTerm] = useState<string | undefined>();
  const [debouncedSearchTerm] = useDebounce(searchTerm, 750);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchUsers({
    searchTerm: debouncedSearchTerm,
  });

  return {
    searchTerm,
    setSearchTerm,
    users: data?.pages.flatMap((page) => page.data) || [],
    totalCount: data?.pages[0]?.totalCount || 0,
    isLoading: isFetching || isFetchingNextPage,
    hasNextPage,
    fetchNextPage,
  };
};

export default useUserSearch;
