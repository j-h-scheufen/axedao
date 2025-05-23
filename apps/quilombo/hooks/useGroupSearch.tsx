'use client';

import { useInfiniteScroll } from "@heroui/use-infinite-scroll";
import { useState } from 'react';
import { useDebounce } from 'use-debounce';

import { useSearchGroups } from '@/query/group';

const useUserSearch = () => {
  const [searchTerm, setSearchTerm] = useState<string | undefined>();
  const [debouncedSearchTerm] = useDebounce(searchTerm, 750);
  const { data, fetchNextPage, hasNextPage, isFetching, isFetchingNextPage } = useSearchGroups({
    searchTerm: debouncedSearchTerm,
  });
  const [loaderRef, scrollerRef] = useInfiniteScroll({ hasMore: hasNextPage, onLoadMore: fetchNextPage });

  return {
    searchTerm,
    setSearchTerm,
    groups: data?.pages.flatMap((page) => page.data) || [],
    isLoading: isFetching || isFetchingNextPage,
    loaderRef,
    scrollerRef,
  };
};

export default useUserSearch;
