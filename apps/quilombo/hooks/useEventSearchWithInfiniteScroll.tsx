'use client';

import type { EventFilters } from '@/config/validation-schema';
import { useInfiniteScroll } from './useInfiniteScroll';
import useEventSearch from './useEventSearch';

type UseEventSearchWithInfiniteScrollOptions = {
  filters?: Partial<EventFilters>;
  showActiveOnly?: boolean;
};

const useEventSearchWithInfiniteScroll = (options?: UseEventSearchWithInfiniteScrollOptions) => {
  const searchData = useEventSearch(options);
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

export default useEventSearchWithInfiniteScroll;
