'use client';

import { useMemo } from 'react';

import { useMediaQuery } from './useMediaQuery';

/** Breakpoints matching Tailwind CSS defaults */
const BREAKPOINTS = {
  sm: 640,
  md: 768,
  lg: 1024,
  xl: 1280,
} as const;

export type DrawerPlacement = 'left' | 'right' | 'bottom' | 'top';

export interface ResponsiveLayout {
  /** Screen is less than 768px wide */
  isMobile: boolean;
  /** Screen is between 768px and 1024px wide */
  isTablet: boolean;
  /** Screen is 1024px or wider */
  isDesktop: boolean;
  /** Device is in portrait orientation (height > width) */
  isPortrait: boolean;
  /** Device is in landscape orientation (width >= height) */
  isLandscape: boolean;
  /** Whether the controls drawer should be open by default */
  controlsDrawerDefaultOpen: boolean;
  /** Placement for the details drawer based on device/orientation */
  detailsDrawerPlacement: DrawerPlacement;
  /** Whether to show full-screen modals */
  useFullScreenModals: boolean;
}

/**
 * Hook for responsive layout behavior on the genealogy page.
 * Provides device type, orientation, and computed drawer placements.
 *
 * @returns Responsive layout configuration
 *
 * @example
 * const { isMobile, detailsDrawerPlacement, controlsDrawerDefaultOpen } = useResponsiveLayout();
 */
export function useResponsiveLayout(): ResponsiveLayout {
  // Device size detection
  const isMobile = useMediaQuery(`(max-width: ${BREAKPOINTS.md - 1}px)`);
  const isTablet = useMediaQuery(`(min-width: ${BREAKPOINTS.md}px) and (max-width: ${BREAKPOINTS.lg - 1}px)`);
  const isDesktop = useMediaQuery(`(min-width: ${BREAKPOINTS.lg}px)`);

  // Orientation detection
  const isPortrait = useMediaQuery('(orientation: portrait)');
  const isLandscape = useMediaQuery('(orientation: landscape)');

  return useMemo(
    () => ({
      isMobile,
      isTablet,
      isDesktop,
      isPortrait,
      isLandscape,

      // Controls drawer: open by default on desktop, closed on mobile/tablet
      controlsDrawerDefaultOpen: isDesktop,

      // Details drawer placement:
      // - Mobile portrait: bottom sheet
      // - Mobile landscape: right drawer
      // - Tablet/Desktop: right drawer
      detailsDrawerPlacement: isMobile && isPortrait ? 'bottom' : 'right',

      // Full-screen modals on mobile
      useFullScreenModals: isMobile,
    }),
    [isMobile, isTablet, isDesktop, isPortrait, isLandscape]
  );
}

export default useResponsiveLayout;
