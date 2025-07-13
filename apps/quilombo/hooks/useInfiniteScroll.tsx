'use client';

import { useRef, useCallback, useEffect } from 'react';

interface UseInfiniteScrollOptions {
  hasMore: boolean;
  onLoadMore: () => void;
  isFetching?: boolean;
  rootMargin?: string;
}

/**
 * Custom implementation of infinite scroll hook for custom grid layouts.
 *
 * This hook is used for custom grid components (like UsersGrid, GroupsGrid)
 * where HeroUI's useInfiniteScroll doesn't work properly.
 */
export const useInfiniteScroll = ({
  hasMore,
  onLoadMore,
  isFetching = false,
  rootMargin = '100px',
}: UseInfiniteScrollOptions) => {
  const scrollerRef = useRef<HTMLDivElement>(null);

  const handleIntersection = useCallback(
    (entries: IntersectionObserverEntry[]) => {
      const [entry] = entries;
      if (entry.isIntersecting && hasMore && !isFetching) {
        onLoadMore();
      }
    },
    [hasMore, isFetching, onLoadMore]
  );

  useEffect(() => {
    const observer = new IntersectionObserver(handleIntersection, {
      rootMargin,
    });

    if (scrollerRef.current) {
      observer.observe(scrollerRef.current);
    }

    return () => observer.disconnect();
  }, [handleIntersection, rootMargin]);

  return scrollerRef;
};
