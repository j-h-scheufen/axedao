'use client';

import { useInfiniteScroll } from './useInfiniteScroll';
import useUserSearch from './useUserSearch';

const useUserSearchWithInfiniteScroll = () => {
  const searchData = useUserSearch();
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
