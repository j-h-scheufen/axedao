'use client';

import type { UserFilters } from '@/config/validation-schema';
import { useInfiniteScroll } from './useInfiniteScroll';
import useUserSearch from './useUserSearch';

type UseUserSearchWithInfiniteScrollOptions = {
  filters?: Partial<UserFilters>;
  hasWallet?: boolean; // Backward compatibility
};

const useUserSearchWithInfiniteScroll = (options?: UseUserSearchWithInfiniteScrollOptions) => {
  const searchData = useUserSearch(options);
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

export default useUserSearchWithInfiniteScroll;
