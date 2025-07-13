'use client';

import { useInfiniteScroll } from './useInfiniteScroll';
import useGroupSearch, { type UseGroupSearchResult } from './useGroupSearch';
import type { RefObject } from 'react';

interface UseGroupSearchWithInfiniteScrollResult extends UseGroupSearchResult {
  scrollerRef: RefObject<HTMLDivElement | null>;
}

const useGroupSearchWithInfiniteScroll = (): UseGroupSearchWithInfiniteScrollResult => {
  const searchData = useGroupSearch();
  const scrollerRef = useInfiniteScroll({
    hasMore: searchData.hasNextPage,
    onLoadMore: searchData.fetchNextPage,
    isFetching: searchData.isLoading,
  });

  return {
    ...searchData,
    scrollerRef,
  };
};

export default useGroupSearchWithInfiniteScroll;
