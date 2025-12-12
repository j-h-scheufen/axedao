/**
 * Link rendering utilities for 3D graph visualization.
 *
 * Provides functions for styling links based on relationship type.
 */

import { LINK_COLORS } from '@/components/genealogy/types';
import type { ForceLink, LinkStyle } from './types';

/**
 * Get link color based on predicate type.
 */
export function getLinkColor(link: ForceLink): string {
  const predicate = link.type as keyof typeof LINK_COLORS;
  return LINK_COLORS[predicate] || LINK_COLORS.default;
}

/**
 * Default link style based on predicate type.
 */
export function getDefaultLinkStyle(link: ForceLink): LinkStyle {
  return {
    color: getLinkColor(link),
    width: 1.5,
    opacity: 0.6,
    arrowLength: 3,
    particles: 1,
    particleWidth: 2,
    particleSpeed: 0.005,
  };
}

/**
 * Minimal link style (no particles, thin lines) for dense graphs.
 */
export function getMinimalLinkStyle(link: ForceLink): LinkStyle {
  return {
    color: getLinkColor(link),
    width: 1,
    opacity: 0.4,
    arrowLength: 0,
    particles: 0,
    particleWidth: 0,
    particleSpeed: 0,
  };
}
