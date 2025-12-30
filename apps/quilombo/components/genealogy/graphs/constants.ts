/**
 * Graph Configuration Constants
 *
 * Centralized configuration for genealogy graph views.
 * Edit these values to tune the visual layout and filtering behavior.
 */

import type { TemporalLayoutConfig } from '@/components/genealogy/core';

// ============================================================================
// NODE FILTERING
// ============================================================================

/**
 * Minimum title levels for filtering persons by view.
 * Title levels: 0 = mestre, 1 = contra-mestre, 2 = mestrando, 3 = professor, etc.
 * The "show yourself" feature allows the current user to bypass this filter.
 */
export const ANCESTRY_MIN_TITLE_LEVEL = 1; // contra-mestre and above
export const GENERAL_MIN_TITLE_LEVEL = 3; // professor and above

// ============================================================================
// COLLISION RADII
// ============================================================================

/** Node collision radius for general 3D view */
export const GENERAL_COLLISION_RADIUS = 20;

/** Node collision radius for flat ancestry view - larger to spread nodes within bands */
export const ANCESTRY_COLLISION_RADIUS = 25;

// ============================================================================
// LINK FORCE STRENGTH
// ============================================================================

/**
 * Default link force strength by predicate type.
 * Base values that can be overridden per-graph.
 */
export const DEFAULT_LINK_FORCE_STRENGTH: Record<string, number> = {
  student_of: 0.6,
  trained_under: 0.4,
  associated_with: 0.025,
  influenced_by: 0.02,
  default: 0,
};

/** Link force strength by predicate - general 3D view */
export const GENERAL_LINK_STRENGTH: Record<string, number> = {
  ...DEFAULT_LINK_FORCE_STRENGTH,
  member_of: 0.3,
  co_founded: 0.2,
  family_of: 0.3,
  received_title_from: 0.2,
  baptized_by: 0.2,
};

/** Link force strength by predicate - student ancestry view */
export const ANCESTRY_LINK_STRENGTH: Record<string, number> = {
  ...DEFAULT_LINK_FORCE_STRENGTH,
  student_of: 0.8,
  member_of: 0,
  co_founded: 0.2,
};

// ============================================================================
// SIMULATION SETTINGS
// ============================================================================

/**
 * D3 force simulation parameters.
 * These control how nodes settle into position and how "wild" the initial animation is.
 *
 * @see https://github.com/vasturiano/react-force-graph#force-engine-d3-force-configuration
 */
export const SIMULATION_CONFIG = {
  /** Pre-compute this many ticks before rendering (reduces initial chaos) */
  warmupTicks: 100,
  /** Stop simulation after this many rendered ticks */
  cooldownTicks: 150,
  /** How quickly simulation cools (higher = faster settling, default 0.0228) */
  d3AlphaDecay: 0.03,
  /** Velocity friction (higher = more resistance = calmer motion, default 0.4) */
  d3VelocityDecay: 0.4,
};

// ============================================================================
// TEMPORAL LAYOUT CONFIGS
// ============================================================================

/**
 * Temporal layout config for the General view (3D spherical).
 * Uses slightly larger spacing than defaults for 3D distribution.
 */
export const GENERAL_VIEW_LAYOUT_CONFIG: Partial<TemporalLayoutConfig> = {
  bandRadiusModernDecade: 40,
  bandRadiusContemporaryDecade: 90,
  linkDistance: 75,
};

/**
 * Temporal layout config for Student Ancestry view (flat radial).
 * Optimized for flat timeline with denser node distribution:
 * - Larger era bands for golden age (1850-1899 split into two bands)
 * - Larger link distance to spread connected nodes
 * - Slightly larger modern decade spacing
 * - Unknown dates placed at current year (typically just the current user)
 *
 * With these settings (4 foundation bands):
 * - Foundation ends at: 15 + 35 + 55 + 65 + 75 = 245
 * - Modern decades (1900-1979) add 8 * 40 = 320 → total at 1980: ~565
 * - Contemporary decades add 80 each
 */
export const STUDENT_ANCESTRY_LAYOUT_CONFIG: Partial<TemporalLayoutConfig> = {
  bandRadiusEarlyHistory: 35, // Pre-1800: small (sparse)
  bandRadiusEarlyDocumentation: 45, // 1800-1849: moderate
  bandRadiusRisingDocumentation: 60, // 1850-1874: rising activity
  bandRadiusAbolitionEra: 135, // 1875-1899: golden age, most space
  bandRadiusModernDecade: 50,
  bandRadiusContemporaryDecade: 80,
  linkDistance: 75,
  // Unknown dates at current year - in ancestry view, this is typically just the current user
  unknownYear: new Date().getFullYear(),
};
