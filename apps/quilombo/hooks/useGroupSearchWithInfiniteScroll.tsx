'use client';

import { useInfiniteScroll } from './useInfiniteScroll';
import useGroupSearch from './useGroupSearch';

const useGroupSearchWithInfiniteScroll = () => {
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
