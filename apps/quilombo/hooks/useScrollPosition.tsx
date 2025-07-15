'use client';

import { useEffect, useRef, useCallback } from 'react';
import { useSearchParams } from 'next/navigation';

interface UseScrollPositionOptions {
  key: string;
  enabled?: boolean;
}

/**
 * Hook to save and restore scroll position for search results
 * Uses sessionStorage to persist scroll position across navigation
 */
export const useScrollPosition = ({ key, enabled = true }: UseScrollPositionOptions) => {
  const containerRef = useRef<HTMLDivElement>(null);
  const searchParams = useSearchParams();

  // Create a unique key based on search parameters
  const scrollKey = `scroll-${key}-${searchParams.toString()}`;

  // Save scroll position
  const saveScrollPosition = useCallback(() => {
    if (!enabled || !containerRef.current) return;

    const scrollTop = containerRef.current.scrollTop;
    sessionStorage.setItem(scrollKey, scrollTop.toString());
  }, [enabled, scrollKey]);

  // Restore scroll position
  const restoreScrollPosition = useCallback(() => {
    if (!enabled || !containerRef.current) return;

    const savedPosition = sessionStorage.getItem(scrollKey);
    if (savedPosition) {
      const scrollTop = parseInt(savedPosition, 10);
      containerRef.current.scrollTop = scrollTop;
    }
  }, [enabled, scrollKey]);

  // Save scroll position on scroll
  useEffect(() => {
    if (!enabled) return;

    const container = containerRef.current;
    if (!container) return;

    const handleScroll = () => {
      saveScrollPosition();
    };

    container.addEventListener('scroll', handleScroll, { passive: true });

    return () => {
      container.removeEventListener('scroll', handleScroll);
    };
  }, [enabled, saveScrollPosition]);

  // Restore scroll position when component mounts
  useEffect(() => {
    if (!enabled) return;

    // Use a small delay to ensure the content is rendered
    const timer = setTimeout(() => {
      restoreScrollPosition();
    }, 100);

    return () => clearTimeout(timer);
  }, [enabled, restoreScrollPosition]);

  return containerRef;
};
