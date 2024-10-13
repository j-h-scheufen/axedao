'use client';

import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { useState } from 'react';
import { useDebounce } from 'use-debounce';

import { useSearchUsers } from '@/query/user';

const useUserSearch = () => {
  const [searchTerm, setSearchTerm] = useState<string | undefined>();
  const [debouncedSearchTerm] = useDebounce(searchTerm, 750);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchUsers({
    searchTerm: debouncedSearchTerm,
  });
  const [loaderRef, scrollerRef] = useInfiniteScroll({ hasMore: hasNextPage, onLoadMore: fetchNextPage });

  return {
    searchTerm,
    setSearchTerm,
    users: data?.pages.flatMap((page) => page.data) || [],
    isLoading: isFetching || isFetchingNextPage,
    loaderRef,
    scrollerRef,
  };
};

export default useUserSearch;
