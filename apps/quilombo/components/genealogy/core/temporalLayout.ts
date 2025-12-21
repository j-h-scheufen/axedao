/**
 * Temporal Layout Utilities
 *
 * Shared utilities for era-based radial positioning of nodes in genealogy graphs.
 * Positions older entities closer to the center, with concentric rings for each era/decade.
 *
 * Design:
 * - Center represents ~1700 (earliest capoeira history)
 * - Foundation eras (pre-1900): 50-year bands, compressed for sparse historical data
 * - Modern era (1900+): 10-year decades with consistent spacing
 * - Unknown years: Placed in outermost position (2020s)
 */

import type { GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { DEFAULT_LINK_FORCE_STRENGTH } from '../graphs/constants';

// ============================================================================
// CONFIGURATION
// ============================================================================

/**
 * Configuration for temporal layout sizing.
 * Controls the radial distances for different eras in the graph.
 *
 * Foundation eras have individual radii to allow fine-tuned spacing
 * based on data density in each historical period.
 */
export interface TemporalLayoutConfig {
  /** Minimum radius from center (prevents nodes at exact center) */
  minRadius: number;

  // Foundation era band radii (pre-1900)
  /** Radius for band 0: Pre-1800 (sparse early history) */
  bandRadiusEarlyHistory: number;
  /** Radius for band 1: 1800-1849 (early documentation period) */
  bandRadiusEarlyDocumentation: number;
  /** Radius for band 2: 1850-1874 (rising documentation) */
  bandRadiusRisingDocumentation: number;
  /** Radius for band 3: 1875-1899 (golden age - foundational mestres) */
  bandRadiusAbolitionEra: number;

  // Modern/contemporary era radii
  /** Additional radius per decade in modern era (1900-1979) */
  bandRadiusModernDecade: number;
  /** Additional radius per decade in contemporary era (1980+) */
  bandRadiusContemporaryDecade: number;

  /** Default distance for link force - how far apart linked nodes want to be */
  linkDistance: number;
}

/**
 * Default temporal layout configuration.
 * Suitable for general-purpose genealogy visualization.
 *
 * With 4 foundation bands:
 * - Foundation ends at: 15 + 30 + 50 + 55 + 60 = 210
 * - Modern decades (1900-1979) add 8 * 35 = 280 → total at 1980: ~490
 * - Contemporary decades add 75 each
 */
export const DEFAULT_TEMPORAL_LAYOUT_CONFIG: TemporalLayoutConfig = {
  minRadius: 15,
  // Foundation era band radii (smaller for sparse, larger for dense)
  bandRadiusEarlyHistory: 30, // Pre-1800: sparse, small
  bandRadiusEarlyDocumentation: 40, // 1800-1849: moderate
  bandRadiusRisingDocumentation: 55, // 1850-1874: increasing density
  bandRadiusAbolitionEra: 60, // 1875-1899: golden age, more space
  // Modern/contemporary
  bandRadiusModernDecade: 35,
  bandRadiusContemporaryDecade: 75,
  linkDistance: 40,
};

// Convenience constants derived from default config (for backward compatibility)
const MIN_RADIUS = DEFAULT_TEMPORAL_LAYOUT_CONFIG.minRadius;

/**
 * Years to add to birth year for positioning.
 * Capoeiristas typically started training around age 10-15, so we offset
 * to show them in the era when they were actively practicing.
 */
export const BIRTH_YEAR_OFFSET = 10;

/**
 * Era configuration for the radial layout.
 * Foundation eras use variable bands; modern era uses decades.
 *
 * Structure:
 * - Pre-1800: Band 0 (sparse early history)
 * - 1800-1849: Band 1 (early documentation period)
 * - 1850-1874: Band 2 (rising documentation)
 * - 1875-1899: Band 3 (golden age - Pastinha, Bimba, foundational mestres)
 * - 1900+: Decade bands (modern era)
 */
export const ERA_CONFIG = {
  // Foundation eras - inner shells with variable band sizes
  foundation: [
    { label: 'Pre-1800', startYear: -Infinity, endYear: 1799, band: 0 },
    { label: '1800-1849', startYear: 1800, endYear: 1849, band: 1 },
    { label: '1850-1874', startYear: 1850, endYear: 1874, band: 2 },
    { label: '1875-1899', startYear: 1875, endYear: 1899, band: 3 },
  ],
  // Modern era starts at band 4 (year 1900), ends at 1979
  modernStartBand: 4,
  modernStartYear: 1900,
  modernEndYear: 1979,
  // Contemporary era starts at 1980 (larger spacing for group explosion)
  contemporaryStartYear: 1980,
  // Unknown birth years go to this pseudo-decade (beyond current timeline)
  unknownYear: 2030,
} as const;

// ============================================================================
// ERA BAND COMPUTATION
// ============================================================================

/**
 * Get the era band index for a given year.
 * Foundation eras (pre-1900) use variable bands; modern/contemporary eras use decades.
 *
 * @param year - Calendar year to get band for
 * @returns Band index (0 = pre-1800, 1 = 1800-1849, 2 = 1850-1874, 3 = 1875-1899, 4-11 = 1900s-1970s, 12+ = 1980s+)
 */
export function getEraBand(year: number): number {
  // Check foundation eras first
  for (const era of ERA_CONFIG.foundation) {
    if (year >= era.startYear && year <= era.endYear) {
      return era.band;
    }
  }

  // Modern era: one band per decade starting from 1900
  const decadesSince1900 = Math.floor((year - ERA_CONFIG.modernStartYear) / 10);
  return ERA_CONFIG.modernStartBand + decadesSince1900;
}

// ============================================================================
// RADIAL DISTANCE COMPUTATION
// ============================================================================

/**
 * Array of foundation band radii in order (band 0, 1, 2, 3).
 * Used by computeRadialDistanceForYear with default config.
 */
const DEFAULT_FOUNDATION_RADII = [
  DEFAULT_TEMPORAL_LAYOUT_CONFIG.bandRadiusEarlyHistory,
  DEFAULT_TEMPORAL_LAYOUT_CONFIG.bandRadiusEarlyDocumentation,
  DEFAULT_TEMPORAL_LAYOUT_CONFIG.bandRadiusRisingDocumentation,
  DEFAULT_TEMPORAL_LAYOUT_CONFIG.bandRadiusAbolitionEra,
];

/**
 * Compute cumulative radius at the start of a foundation band.
 *
 * @param bandIndex - Foundation band index (0-3)
 * @param foundationRadii - Array of individual band radii
 * @param minRadius - Minimum radius from center
 * @returns Cumulative radius at the start of the band
 */
function getFoundationBandStartRadius(bandIndex: number, foundationRadii: number[], minRadius: number): number {
  let radius = minRadius;
  for (let i = 0; i < bandIndex && i < foundationRadii.length; i++) {
    radius += foundationRadii[i];
  }
  return radius;
}

/**
 * Compute total radius of all foundation bands.
 *
 * @param foundationRadii - Array of individual band radii
 * @param minRadius - Minimum radius from center
 * @returns Total radius at the end of foundation eras (start of modern era)
 */
function getTotalFoundationRadius(foundationRadii: number[], minRadius: number): number {
  return foundationRadii.reduce((sum, r) => sum + r, minRadius);
}

/**
 * Compute the radial distance for a given calendar year (no offset applied).
 * Used for drawing era rings at their actual decade positions.
 *
 * Uses continuous proportional placement within each era band:
 * - Foundation eras (pre-1900): Proportional within individual band radii
 * - Modern era (1900-1979): Proportional within 10-year decades
 * - Contemporary era (1980+): Larger spacing per decade
 *
 * @param year - Calendar year to compute radius for
 * @returns Radial distance from center
 */
export function computeRadialDistanceForYear(year: number): number {
  const { bandRadiusModernDecade, bandRadiusContemporaryDecade } = DEFAULT_TEMPORAL_LAYOUT_CONFIG;

  // Foundation eras (pre-1900)
  for (const era of ERA_CONFIG.foundation) {
    if (year >= era.startYear && year <= era.endYear) {
      const bandStartRadius = getFoundationBandStartRadius(era.band, DEFAULT_FOUNDATION_RADII, MIN_RADIUS);
      const bandEndRadius = bandStartRadius + DEFAULT_FOUNDATION_RADII[era.band];

      // Handle Pre-1800 era (infinite start)
      if (era.startYear === -Infinity) {
        const eraStart = 1700;
        const eraEnd = era.endYear;
        const proportion = Math.max(0, Math.min(1, (year - eraStart) / (eraEnd - eraStart)));
        return bandStartRadius + proportion * (bandEndRadius - bandStartRadius);
      }

      // Normal foundation era - proportional placement
      const proportion = (year - era.startYear) / (era.endYear - era.startYear);
      return bandStartRadius + proportion * (bandEndRadius - bandStartRadius);
    }
  }

  // Calculate base radius at end of foundation eras
  const foundationRadius = getTotalFoundationRadius(DEFAULT_FOUNDATION_RADII, MIN_RADIUS);

  // Contemporary era (1980+) - larger spacing per decade
  if (year >= ERA_CONFIG.contemporaryStartYear) {
    // Modern era spans 8 decades (1900-1979)
    const modernDecades = (ERA_CONFIG.contemporaryStartYear - ERA_CONFIG.modernStartYear) / 10;
    const modernRadius = foundationRadius + modernDecades * bandRadiusModernDecade;

    // Add contemporary era spacing
    const decadesSince1980 = (year - ERA_CONFIG.contemporaryStartYear) / 10;
    return modernRadius + decadesSince1980 * bandRadiusContemporaryDecade;
  }

  // Modern era (1900-1979) - proportional within decades
  const decadesSince1900 = (year - ERA_CONFIG.modernStartYear) / 10;
  return foundationRadius + decadesSince1900 * bandRadiusModernDecade;
}

/**
 * Compute the radial distance for a given birth/founding year.
 *
 * Applies BIRTH_YEAR_OFFSET to position nodes at their "active capoeira years"
 * rather than birth year (capoeiristas typically started training around age 10-15).
 *
 * @param year - Birth year (for persons) or founding year (for groups), or null if unknown
 * @returns Radial distance from center
 */
export function computeRadialDistanceForEntityYear(year: number | null): number {
  const effectiveYear = year !== null ? year + BIRTH_YEAR_OFFSET : ERA_CONFIG.unknownYear;
  return computeRadialDistanceForYear(effectiveYear);
}

// ============================================================================
// NODE UTILITIES
// ============================================================================

/**
 * Get the temporal year for a node (birthYear for persons, foundedYear for groups).
 *
 * @param node - Graph node to extract year from
 * @returns Birth year (person), founding year (group), or null if not available
 */
export function getNodeYear(node: GraphNode): number | null {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    return metadata.birthYear ?? null;
  }
  if (node.type === 'group') {
    const metadata = node.metadata as GroupMetadata;
    return metadata.foundedYear ?? null;
  }
  return null;
}

/**
 * Compute target radius for a node based on its temporal data.
 *
 * @param node - Graph node to compute radius for
 * @returns Target radial distance from center
 */
export function computeNodeTargetRadius(node: GraphNode): number {
  const year = getNodeYear(node);
  return computeRadialDistanceForEntityYear(year);
}

// ============================================================================
// FORCE FACTORIES
// ============================================================================

/**
 * Extended node type with target radius for radial force constraint.
 */
export interface TemporalForceNode {
  id: string;
  x?: number;
  y?: number;
  z?: number;
  vx?: number;
  vy?: number;
  vz?: number;
  /** Target radius for this node based on birth/founding year */
  targetRadius?: number;
  /** Whether this node has temporal data (birth/founding year) */
  hasTemporalData?: boolean;
}

/**
 * Configuration for the radial constraint force.
 */
export interface RadialForceConfig {
  /**
   * Strength of the radial constraint (0-1).
   * - 1.0: Hard constraint, nodes fixed to exact radius
   * - 0.95: Soft constraint, allows slight movement
   * - 0.0: No radial constraint
   */
  strength: number;
  /**
   * Whether to constrain nodes to y=0 plane (2D layout).
   * If false, nodes can move freely in 3D space.
   */
  constrainToPlane: boolean;
  /**
   * Only apply radial force to nodes with temporal data.
   * If false, nodes without temporal data will be pushed to unknownYear radius.
   */
  onlyTemporalNodes: boolean;
}

/**
 * Create a radial constraint force that pulls/pushes nodes toward their target radius.
 *
 * @param config - Configuration for the radial force
 * @returns D3 force function
 */
export function createRadialForce(config: RadialForceConfig) {
  const { strength, constrainToPlane, onlyTemporalNodes } = config;

  // biome-ignore lint/suspicious/noExplicitAny: custom d3-force implementation
  const force: any = (alpha: number) => {
    const nodes = force.nodes || [];
    for (const node of nodes) {
      // Skip nodes without temporal data if configured
      if (onlyTemporalNodes && !node.hasTemporalData) {
        continue;
      }

      // Constrain to y=0 plane if configured
      if (constrainToPlane) {
        node.y = 0;
        node.vy = 0;
      }

      const targetRadius = node.targetRadius ?? MIN_RADIUS;

      // For 2D (plane) layout, use XZ distance
      // For 3D layout, use full XYZ distance
      const currentRadius = constrainToPlane
        ? Math.sqrt(node.x * node.x + node.z * node.z)
        : Math.sqrt(node.x * node.x + node.y * node.y + node.z * node.z);

      if (currentRadius < 0.001) {
        // Node at center - place at target radius with random angle
        const theta = Math.random() * Math.PI * 2;
        if (constrainToPlane) {
          node.x = targetRadius * Math.cos(theta);
          node.z = targetRadius * Math.sin(theta);
        } else {
          const phi = Math.random() * Math.PI;
          node.x = targetRadius * Math.sin(phi) * Math.cos(theta);
          node.y = targetRadius * Math.cos(phi);
          node.z = targetRadius * Math.sin(phi) * Math.sin(theta);
        }
        return;
      }

      if (strength >= 1.0) {
        // Hard constraint: fix to exact radius
        const scale = targetRadius / currentRadius;
        node.x *= scale;
        if (!constrainToPlane) {
          node.y *= scale;
        }
        node.z *= scale;

        // Remove radial velocity component
        if (constrainToPlane) {
          const vRadial = (node.vx * node.x + node.vz * node.z) / currentRadius;
          const normalX = node.x / currentRadius;
          const normalZ = node.z / currentRadius;
          node.vx -= vRadial * normalX;
          node.vz -= vRadial * normalZ;
        } else {
          const vRadial = (node.vx * node.x + node.vy * node.y + node.vz * node.z) / currentRadius;
          node.vx -= (vRadial * node.x) / currentRadius;
          node.vy -= (vRadial * node.y) / currentRadius;
          node.vz -= (vRadial * node.z) / currentRadius;
        }
      } else {
        // Soft constraint: apply force toward target radius
        const radiusDiff = targetRadius - currentRadius;
        const forceStrength = radiusDiff * strength * alpha;

        if (constrainToPlane) {
          node.vx += (forceStrength * node.x) / currentRadius;
          node.vz += (forceStrength * node.z) / currentRadius;
        } else {
          node.vx += (forceStrength * node.x) / currentRadius;
          node.vy += (forceStrength * node.y) / currentRadius;
          node.vz += (forceStrength * node.z) / currentRadius;
        }
      }
    }
  };

  force.initialize = (nodes: TemporalForceNode[]) => {
    force.nodes = nodes;
  };
  force.nodes = [] as TemporalForceNode[];

  return force;
}

/**
 * Create a link force strength resolver based on predicate type.
 *
 * @param strengthByType - Map of predicate to strength value
 * @returns Function that returns strength for a given link
 */
export function createLinkStrengthResolver(
  strengthByType: Record<string, number> = DEFAULT_LINK_FORCE_STRENGTH
  // biome-ignore lint/suspicious/noExplicitAny: d3-force link type is complex
): (link: any) => number {
  return (link) => {
    const linkType = link.type as string;
    return strengthByType[linkType] ?? strengthByType.default ?? 0;
  };
}

// ============================================================================
// TEMPORAL LAYOUT FACTORY
// ============================================================================

/**
 * Return type for createTemporalLayout factory.
 * Contains all config-dependent functions bound to the provided configuration.
 */
export interface TemporalLayout {
  /** The resolved configuration */
  config: TemporalLayoutConfig;

  /**
   * Compute the radial distance for a given calendar year (no offset applied).
   * Used for drawing era rings at their actual decade positions.
   */
  computeRadialDistanceForYear: (year: number) => number;

  /**
   * Compute the radial distance for a given birth/founding year.
   * Applies BIRTH_YEAR_OFFSET to position nodes at their "active capoeira years".
   */
  computeRadialDistanceForEntityYear: (year: number | null) => number;

  /**
   * Compute target radius for a node based on its temporal data.
   */
  computeNodeTargetRadius: (node: GraphNode) => number;

  /**
   * Create a radial constraint force that pulls/pushes nodes toward their target radius.
   */
  createRadialForce: (forceConfig: RadialForceConfig) => ReturnType<typeof createRadialForce>;
}

/**
 * Create a temporal layout instance with custom configuration.
 *
 * Use this factory to create config-bound layout functions for different graph views.
 * Each view can have its own sizing optimized for its data density and visual requirements.
 *
 * @param config - Partial configuration (defaults are merged for missing values)
 * @returns Object with all layout functions bound to the configuration
 *
 * @example
 * ```typescript
 * // Create a layout with larger contemporary spacing
 * const layout = createTemporalLayout({
 *   contemporaryDecadeRadius: 100,
 * });
 *
 * // Use the bound functions
 * const radius = layout.computeRadialDistanceForYear(1990);
 * const nodeRadius = layout.computeNodeTargetRadius(node);
 * ```
 */
export function createTemporalLayout(config: Partial<TemporalLayoutConfig> = {}): TemporalLayout {
  const resolvedConfig: TemporalLayoutConfig = {
    ...DEFAULT_TEMPORAL_LAYOUT_CONFIG,
    ...config,
  };

  const {
    minRadius,
    bandRadiusEarlyHistory,
    bandRadiusEarlyDocumentation,
    bandRadiusRisingDocumentation,
    bandRadiusAbolitionEra: bandRadiusGoldenAge,
    bandRadiusModernDecade,
    bandRadiusContemporaryDecade,
  } = resolvedConfig;

  // Build foundation radii array from config
  const foundationRadii = [
    bandRadiusEarlyHistory,
    bandRadiusEarlyDocumentation,
    bandRadiusRisingDocumentation,
    bandRadiusGoldenAge,
  ];

  /**
   * Config-bound version of computeRadialDistanceForYear.
   */
  function computeRadialDistanceForYearBound(year: number): number {
    // Foundation eras (pre-1900)
    for (const era of ERA_CONFIG.foundation) {
      if (year >= era.startYear && year <= era.endYear) {
        const bandStartRadius = getFoundationBandStartRadius(era.band, foundationRadii, minRadius);
        const bandEndRadius = bandStartRadius + foundationRadii[era.band];

        // Handle Pre-1800 era (infinite start)
        if (era.startYear === -Infinity) {
          const eraStart = 1700;
          const eraEnd = era.endYear;
          const proportion = Math.max(0, Math.min(1, (year - eraStart) / (eraEnd - eraStart)));
          return bandStartRadius + proportion * (bandEndRadius - bandStartRadius);
        }

        // Normal foundation era - proportional placement
        const proportion = (year - era.startYear) / (era.endYear - era.startYear);
        return bandStartRadius + proportion * (bandEndRadius - bandStartRadius);
      }
    }

    // Calculate base radius at end of foundation eras
    const foundationRadius = getTotalFoundationRadius(foundationRadii, minRadius);

    // Contemporary era (1980+) - larger spacing per decade
    if (year >= ERA_CONFIG.contemporaryStartYear) {
      // Modern era spans 8 decades (1900-1979)
      const modernDecades = (ERA_CONFIG.contemporaryStartYear - ERA_CONFIG.modernStartYear) / 10;
      const modernRadius = foundationRadius + modernDecades * bandRadiusModernDecade;

      // Add contemporary era spacing
      const decadesSince1980 = (year - ERA_CONFIG.contemporaryStartYear) / 10;
      return modernRadius + decadesSince1980 * bandRadiusContemporaryDecade;
    }

    // Modern era (1900-1979) - proportional within decades
    const decadesSince1900 = (year - ERA_CONFIG.modernStartYear) / 10;
    return foundationRadius + decadesSince1900 * bandRadiusModernDecade;
  }

  /**
   * Config-bound version of computeRadialDistanceForEntityYear.
   */
  function computeRadialDistanceForEntityYearBound(year: number | null): number {
    const effectiveYear = year !== null ? year + BIRTH_YEAR_OFFSET : ERA_CONFIG.unknownYear;
    return computeRadialDistanceForYearBound(effectiveYear);
  }

  /**
   * Config-bound version of computeNodeTargetRadius.
   */
  function computeNodeTargetRadiusBound(node: GraphNode): number {
    const year = getNodeYear(node);
    return computeRadialDistanceForEntityYearBound(year);
  }

  /**
   * Config-bound version of createRadialForce.
   */
  function createRadialForceBound(forceConfig: RadialForceConfig) {
    const { strength, constrainToPlane, onlyTemporalNodes } = forceConfig;

    // biome-ignore lint/suspicious/noExplicitAny: custom d3-force implementation
    const force: any = (alpha: number) => {
      const nodes = force.nodes || [];
      for (const node of nodes) {
        // Skip nodes without temporal data if configured
        if (onlyTemporalNodes && !node.hasTemporalData) {
          continue;
        }

        // Constrain to y=0 plane if configured
        if (constrainToPlane) {
          node.y = 0;
          node.vy = 0;
        }

        const targetRadius = node.targetRadius ?? minRadius;

        // For 2D (plane) layout, use XZ distance
        // For 3D layout, use full XYZ distance
        const currentRadius = constrainToPlane
          ? Math.sqrt(node.x * node.x + node.z * node.z)
          : Math.sqrt(node.x * node.x + node.y * node.y + node.z * node.z);

        if (currentRadius < 0.001) {
          // Node at center - place at target radius with random angle
          const theta = Math.random() * Math.PI * 2;
          if (constrainToPlane) {
            node.x = targetRadius * Math.cos(theta);
            node.z = targetRadius * Math.sin(theta);
          } else {
            const phi = Math.random() * Math.PI;
            node.x = targetRadius * Math.sin(phi) * Math.cos(theta);
            node.y = targetRadius * Math.cos(phi);
            node.z = targetRadius * Math.sin(phi) * Math.sin(theta);
          }
          return;
        }

        if (strength >= 1.0) {
          // Hard constraint: fix to exact radius
          const scale = targetRadius / currentRadius;
          node.x *= scale;
          if (!constrainToPlane) {
            node.y *= scale;
          }
          node.z *= scale;

          // Remove radial velocity component
          if (constrainToPlane) {
            const vRadial = (node.vx * node.x + node.vz * node.z) / currentRadius;
            const normalX = node.x / currentRadius;
            const normalZ = node.z / currentRadius;
            node.vx -= vRadial * normalX;
            node.vz -= vRadial * normalZ;
          } else {
            const vRadial = (node.vx * node.x + node.vy * node.y + node.vz * node.z) / currentRadius;
            node.vx -= (vRadial * node.x) / currentRadius;
            node.vy -= (vRadial * node.y) / currentRadius;
            node.vz -= (vRadial * node.z) / currentRadius;
          }
        } else {
          // Soft constraint: apply force toward target radius
          const radiusDiff = targetRadius - currentRadius;
          const forceStrength = radiusDiff * strength * alpha;

          if (constrainToPlane) {
            node.vx += (forceStrength * node.x) / currentRadius;
            node.vz += (forceStrength * node.z) / currentRadius;
          } else {
            node.vx += (forceStrength * node.x) / currentRadius;
            node.vy += (forceStrength * node.y) / currentRadius;
            node.vz += (forceStrength * node.z) / currentRadius;
          }
        }
      }
    };

    force.initialize = (nodes: TemporalForceNode[]) => {
      force.nodes = nodes;
    };
    force.nodes = [] as TemporalForceNode[];

    return force;
  }

  return {
    config: resolvedConfig,
    computeRadialDistanceForYear: computeRadialDistanceForYearBound,
    computeRadialDistanceForEntityYear: computeRadialDistanceForEntityYearBound,
    computeNodeTargetRadius: computeNodeTargetRadiusBound,
    createRadialForce: createRadialForceBound,
  };
}

// ============================================================================
// LINK PROCESSING UTILITIES
// ============================================================================

import type { GraphLink } from '@/components/genealogy/types';
import type { ForceLink } from './types';

/**
 * Default predicates whose visual direction should be reversed.
 * These represent relationships where the data model direction (subject -> object)
 * is opposite to the intuitive visual flow.
 *
 * Example: "student_of" in data is Student -> Teacher,
 * but visually we want arrows/particles to flow Teacher -> Student (knowledge flows down).
 */
export const DEFAULT_REVERSED_PREDICATES = new Set(['student_of', 'trained_under']);

/**
 * Default predicates that should be invisible (participate in forces but not rendered).
 * Useful for creating gravitational clustering without visual clutter.
 */
export const DEFAULT_INVISIBLE_PREDICATES = new Set([]);

/**
 * Configuration for link processing.
 */
export interface LinkProcessingConfig {
  /**
   * Predicates whose source/target should be swapped for visual direction.
   * Arrows and particles will flow in the reversed direction.
   */
  reversedPredicates?: ReadonlySet<string>;

  /**
   * Predicates that should be invisible (not rendered but still affect forces).
   */
  invisiblePredicates?: ReadonlySet<string>;
}

/**
 * Extract the ID from a link endpoint (handles both string IDs and object references).
 * react-force-graph mutates links by replacing string IDs with node object references.
 */
function getLinkEndpointId(endpoint: string | { id: string }): string {
  return typeof endpoint === 'string' ? endpoint : endpoint.id;
}

/**
 * Process a single link with direction reversal and invisibility settings.
 *
 * @param link - The link to process
 * @param config - Link processing configuration
 * @returns Processed link with normalized IDs, reversed direction if applicable, and invisibility flag
 */
export function processLink(link: GraphLink, config: LinkProcessingConfig = {}): ForceLink {
  const { reversedPredicates = DEFAULT_REVERSED_PREDICATES, invisiblePredicates = DEFAULT_INVISIBLE_PREDICATES } =
    config;

  const sourceId = getLinkEndpointId(link.source);
  const targetId = getLinkEndpointId(link.target);
  const invisible = invisiblePredicates.has(link.type);

  // Swap source/target for reversed predicates so arrows/particles flow intuitively
  if (reversedPredicates.has(link.type)) {
    return {
      ...link,
      source: targetId,
      target: sourceId,
      invisible,
    };
  }

  return {
    ...link,
    source: sourceId,
    target: targetId,
    invisible,
  };
}

/**
 * Process an array of links with direction reversal and invisibility settings.
 *
 * @param links - The links to process
 * @param config - Link processing configuration
 * @returns Processed links with normalized IDs, reversed directions, and invisibility flags
 */
export function processLinks(links: GraphLink[], config: LinkProcessingConfig = {}): ForceLink[] {
  return links.map((link) => processLink(link, config));
}
