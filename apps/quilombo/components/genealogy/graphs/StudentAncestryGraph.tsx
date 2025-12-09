'use client';

/**
 * Student Ancestry Graph
 *
 * Specialized 3D visualization showing capoeira lineages through student-teacher relationships.
 *
 * Features:
 * - Radial spherical layout: oldest mestres at center, decades expand outward
 * - Filters to persons only (no groups)
 * - Shows student_of and trained_under relationships
 * - Temporal positioning based on birth year
 * - Force-directed angular positioning to cluster connected nodes
 */

import { useMemo } from 'react';
import { forceRadial as forceRadial3d, forceCollide as forceCollide3d } from 'd3-force-3d';

import type { GraphData, GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import {
  ForceGraph3DWrapper,
  type ForceConfig,
  type ForceGraphData,
  type ForceNode,
} from '@/components/genealogy/core';

// ============================================================================
// EXTENDED NODE TYPE
// ============================================================================

/**
 * Extended ForceNode with target radius for radial force constraint.
 */
interface AncestryForceNode extends ForceNode {
  /** Target radius for this node based on birth year era */
  targetRadius?: number;
}

// ============================================================================
// FORCE CONFIGURATION
// ============================================================================

/** Node collision radius for preventing overlap */
const NODE_COLLISION_RADIUS = 12;

/** Strength of the radial force (0-1, higher = stronger constraint to shell) */
const RADIAL_FORCE_STRENGTH = 0.9;

// ============================================================================
// ERA-BASED RADIAL TEMPORAL LAYOUT
// ============================================================================
//
// The layout uses an era-based approach rather than linear year-to-distance mapping.
// This provides better visual distribution given the historical data:
// - Foundation Era (pre-1900): Sparse data, ~15 persons across 150 years
// - Modern Era (1900+): Growing data density, will eventually have many more persons
//
// Design:
// - Inner shells: Foundation eras compressed together (50-year bands)
// - Outer shells: Modern decades with consistent spacing
// - Unknown years: Placed in outermost shell
//
// ============================================================================

/** Minimum radius from center (prevents nodes at exact center) */
const MIN_RADIUS = 50;

/** Radius increment per era band */
const ERA_BAND_RADIUS = 40;

/** Additional radius per decade in modern era (post-1900) */
const MODERN_DECADE_RADIUS = 30;

/**
 * Era configuration for the radial layout.
 * Foundation eras use 50-year bands; modern era uses decades.
 */
const ERA_CONFIG = {
  // Foundation eras - inner shells (sparse historical data)
  foundation: [
    { label: 'Pre-1800', startYear: -Infinity, endYear: 1799, band: 0 },
    { label: '1800-1849', startYear: 1800, endYear: 1849, band: 1 },
    { label: '1850-1899', startYear: 1850, endYear: 1899, band: 2 },
  ],
  // Modern era starts at band 3 (year 1900)
  modernStartBand: 3,
  modernStartYear: 1900,
  // Unknown birth years go to this pseudo-decade
  unknownYear: 2020,
} as const;

// ============================================================================
// DATA PROCESSING
// ============================================================================

/**
 * Get the temporal year for a node (birthYear for persons, foundedYear for groups).
 */
function getNodeYear(node: GraphNode): number | null {
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
 * Get the era band for a given year.
 * Foundation eras (pre-1900) use 50-year bands; modern era uses decades.
 */
function getEraBand(year: number): number {
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

/**
 * Compute the radial distance for a given year using era-based bands.
 *
 * The formula creates concentric shells:
 * - Band 0 (Pre-1800): MIN_RADIUS
 * - Band 1 (1800-1849): MIN_RADIUS + ERA_BAND_RADIUS
 * - Band 2 (1850-1899): MIN_RADIUS + 2 * ERA_BAND_RADIUS
 * - Band 3+ (1900s+): MIN_RADIUS + 3 * ERA_BAND_RADIUS + (band - 3) * MODERN_DECADE_RADIUS
 */
function computeRadialDistance(year: number | null): number {
  const effectiveYear = year ?? ERA_CONFIG.unknownYear;
  const band = getEraBand(effectiveYear);

  if (band < ERA_CONFIG.modernStartBand) {
    // Foundation era bands
    return MIN_RADIUS + band * ERA_BAND_RADIUS;
  }

  // Modern era bands (post-1900)
  const foundationRadius = MIN_RADIUS + ERA_CONFIG.modernStartBand * ERA_BAND_RADIUS;
  const modernBands = band - ERA_CONFIG.modernStartBand;
  return foundationRadius + modernBands * MODERN_DECADE_RADIUS;
}

// Keep track of node count per era band for even distribution
const bandNodeCounts = new Map<number, number>();

/**
 * Compute spherical coordinates for radial temporal layout using Fibonacci sphere.
 * Oldest mestres at center, each era band expands outward as a spherical shell.
 * Uses Fibonacci spiral for even distribution on each shell.
 */
function computeRadialPosition(
  year: number | null,
  nodeIndex: number,
  totalNodes: number
): { x: number; y: number; z: number } {
  const effectiveYear = year ?? ERA_CONFIG.unknownYear;
  const radius = computeRadialDistance(year);
  const band = getEraBand(effectiveYear);

  // Track how many nodes are on this band's shell
  const currentCount = bandNodeCounts.get(band) || 0;
  bandNodeCounts.set(band, currentCount + 1);

  // Use Fibonacci sphere for even distribution on this shell
  // Add nodeIndex to ensure different positions even for same band
  const i = currentCount + nodeIndex * 0.1;
  const phi = Math.acos(1 - (2 * (i + 0.5)) / (totalNodes + 1));
  const theta = Math.PI * (1 + Math.sqrt(5)) * i; // Golden angle

  return {
    x: radius * Math.sin(phi) * Math.cos(theta),
    y: radius * Math.sin(phi) * Math.sin(theta),
    z: radius * Math.cos(phi),
  };
}

/**
 * Extended graph data with AncestryForceNode type.
 */
interface AncestryGraphData extends Omit<ForceGraphData, 'nodes'> {
  nodes: AncestryForceNode[];
}

/**
 * Process graph data for radial temporal layout.
 * - Filters to persons only (no groups)
 * - Filters to student_of and trained_under relationships only
 * - Sets initial positions and target radius for radial force constraint
 * - Does NOT fix positions - allows force simulation to adjust angular positioning
 */
function processDataForStudentAncestry(data: GraphData): AncestryGraphData {
  // Filter to persons only
  const personNodes = data.nodes.filter((node) => node.type === 'person');

  // Reset band counts for fresh distribution
  bandNodeCounts.clear();

  // Filter to student_of links only (and only between persons)
  const personIds = new Set(personNodes.map((n) => n.id));

  const studentOfLinks = data.links
    .filter((link) => {
      // Check if this is a student or training relationship
      if (link.type !== 'student_of' && link.type !== 'trained_under') {
        return false;
      }

      // Handle both string IDs (initial format) and object references (after react-force-graph mutation)
      // react-force-graph mutates links by replacing string IDs with node object references
      const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;

      // Only include links between persons
      return personIds.has(sourceId) && personIds.has(targetId);
    })
    .map((link) => {
      // Normalize links to use string IDs so react-force-graph can match them to our processed nodes
      const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;

      // Swap source/target for student_of and trained_under so arrows/particles flow from teacher to student
      // (data model: student -> teacher, but visually we want: teacher -> student)
      if (link.type === 'student_of' || link.type === 'trained_under') {
        return {
          ...link,
          source: targetId,
          target: sourceId,
        };
      }

      return {
        ...link,
        source: sourceId,
        target: targetId,
      };
    });

  // Process nodes with initial positions and target radius
  // Initial positions spread nodes on their target shells; force simulation will adjust
  const totalNodes = personNodes.length;
  const processedNodes: AncestryForceNode[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const targetRadius = computeRadialDistance(year);
    const pos = computeRadialPosition(year, index, totalNodes);

    return {
      ...node,
      // Initial position (not fixed - simulation will adjust)
      x: pos.x,
      y: pos.y,
      z: pos.z,
      // Target radius for radial force constraint
      targetRadius,
      hasTemporalData: year !== null,
    };
  });

  return {
    nodes: processedNodes,
    links: studentOfLinks,
  };
}

// ============================================================================
// COMPONENT
// ============================================================================

interface StudentAncestryGraphProps {
  /** Full graph data (will be filtered to persons + student_of) */
  data: GraphData;
  /** Currently selected node ID */
  selectedNodeId: string | null;
  /** Callback when a node is clicked */
  onNodeClick: (node: GraphNode) => void;
  /** Callback when background is clicked */
  onBackgroundClick: () => void;
  /** Fixed width (auto-sizes if not provided) */
  width?: number;
  /** Fixed height (auto-sizes if not provided) */
  height?: number;
}

/**
 * Student Ancestry Graph - Radial temporal visualization of capoeira lineages.
 *
 * Shows the student-teacher relationships as a spherical graph where:
 * - Oldest mestres (1890s) are at the center
 * - Each decade forms a spherical shell radiating outward
 * - Links show student_of and trained_under relationships
 * - Connected nodes cluster together on their respective shells
 */
export function StudentAncestryGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: StudentAncestryGraphProps) {
  // Process data for radial layout with target radius per node
  const graphData = useMemo(() => processDataForStudentAncestry(data), [data]);

  // Create forces for radial constraint and collision prevention
  const forces = useMemo((): ForceConfig[] => {
    // Radial force: constrains nodes to their target radius (sphere shell)
    // but allows them to move freely on the shell surface
    const radialForce = forceRadial3d((node: AncestryForceNode) => node.targetRadius ?? MIN_RADIUS).strength(
      RADIAL_FORCE_STRENGTH
    );

    // Collision force: prevents nodes from overlapping
    const collideForce = forceCollide3d(NODE_COLLISION_RADIUS);

    return [
      { name: 'radial', force: radialForce },
      { name: 'collide', force: collideForce },
      // Note: The default 'link' force is already enabled by react-force-graph
      // and will pull connected nodes toward each other
    ];
  }, []);

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={forces}
      width={width}
      height={height}
      autoFitOnLoad
      autoFitDelay={800}
      showLinkParticles
      showLinkArrows
      // Slower decay for smoother settling
      d3AlphaDecay={0.01}
      d3VelocityDecay={0.2}
      cooldownTicks={200}
    />
  );
}

export default StudentAncestryGraph;
