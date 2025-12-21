/**
 * Person filtering utilities for genealogy graph visualization.
 *
 * Provides functions to determine which person nodes should be displayed
 * based on title level, historical status, and current user identity.
 */

import { PRESUMED_DECEASED_AGE_THRESHOLD } from '@/config/constants';

import { isTitleAtOrAboveLevel } from './titleFilter';

/**
 * Checks if a person is presumed deceased based on birth year.
 * Historical figures with birth years > PRESUMED_DECEASED_AGE_THRESHOLD years ago
 * are presumed deceased even if we don't have a recorded death year.
 *
 * This is a pure function safe for client-side use (no DB dependencies).
 *
 * @param birthYear - Person's birth year (null if unknown)
 * @param deathYear - Person's death year (null if still alive or unknown)
 * @returns true if the person has a death year or is PRESUMED_DECEASED_AGE_THRESHOLD+ years old
 */
export function isPresumedDeceased(
  birthYear: number | null | undefined,
  deathYear: number | null | undefined
): boolean {
  if (deathYear != null) return true;
  if (birthYear == null) return false;
  const currentYear = new Date().getFullYear();
  return birthYear <= currentYear - PRESUMED_DECEASED_AGE_THRESHOLD;
}

/**
 * Configuration for person node filtering.
 */
export interface PersonFilterConfig {
  /** Minimum title level to include (lower = higher rank). Set to null to disable title filtering. */
  minTitleLevel: number | null;
  /** Whether to include historical/deceased figures regardless of title */
  includeHistorical: boolean;
  /** ID of the current user's person profile (always included if set) */
  currentUserProfileId?: string | null;
}

/**
 * Determines if a person node should be included in the graph display.
 *
 * A person is included if ANY of these conditions are met:
 * 1. Their title meets the minimum level (e.g., professor and above)
 * 2. They are a historical/deceased figure (and includeHistorical is true)
 * 3. They are the current logged-in user
 *
 * @param nodeId - The person node's ID
 * @param title - The person's title (e.g., 'mestre', 'professor', null)
 * @param birthYear - The person's birth year (null if unknown)
 * @param deathYear - The person's death year (null if still alive or unknown)
 * @param config - Filter configuration
 * @returns true if the person should be displayed in the graph
 *
 * @example
 * // Filter for ancestry view (contra-mestre+, historical, or current user)
 * shouldIncludePersonNode(id, 'aluno', 1880, null, {
 *   minTitleLevel: 1,
 *   includeHistorical: true,
 *   currentUserProfileId: userId,
 * }); // returns true (historical figure)
 *
 * @example
 * // Filter for general view (professor+, historical, or current user)
 * shouldIncludePersonNode(id, 'aluno', 1995, null, {
 *   minTitleLevel: 3,
 *   includeHistorical: true,
 *   currentUserProfileId: userId,
 * }); // returns false (not professor+ and not historical)
 */
export function shouldIncludePersonNode(
  nodeId: string,
  title: string | null | undefined,
  birthYear: number | null | undefined,
  deathYear: number | null | undefined,
  config: PersonFilterConfig
): boolean {
  const { minTitleLevel, includeHistorical, currentUserProfileId } = config;

  // Condition 3: Always include the current user's node
  if (currentUserProfileId && nodeId === currentUserProfileId) {
    return true;
  }

  // Condition 2: Include historical/deceased figures
  if (includeHistorical && isPresumedDeceased(birthYear, deathYear)) {
    return true;
  }

  // Condition 1: Check title level (if filtering is enabled)
  if (minTitleLevel !== null && isTitleAtOrAboveLevel(title, minTitleLevel)) {
    return true;
  }

  return false;
}
