'use client';

import { useInfiniteScroll } from './useInfiniteScroll';
import useEventSearch from './useEventSearch';

const useEventSearchWithInfiniteScroll = () => {
  const searchData = useEventSearch();
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
