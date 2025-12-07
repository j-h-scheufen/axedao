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
 */

import { useMemo } from 'react';
import { forceManyBody, forceRadial } from 'd3-force-3d';

import type { GraphData, GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import {
  ForceGraph3DWrapper,
  type ForceConfig,
  type ForceGraphData,
  type ForceNode,
} from '@/components/genealogy/core';

// ============================================================================
// RADIAL TEMPORAL LAYOUT CONSTANTS
// ============================================================================

/** Center year for the radial layout (oldest mestres) */
const CENTER_YEAR = 1890;

/** Distance units per decade from center */
const DECADE_RADIUS = 100;

/** Year to use for nodes without temporal data (outer shell) */
const UNKNOWN_YEAR_RADIUS = 2010;

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
 * Compute the radial distance for a given year.
 */
function computeRadialDistance(year: number | null): number {
  const effectiveYear = year ?? UNKNOWN_YEAR_RADIUS;
  const decadesFromCenter = (effectiveYear - CENTER_YEAR) / 10;
  return Math.max(10, decadesFromCenter * DECADE_RADIUS);
}

/**
 * Compute spherical coordinates for radial temporal layout.
 * Oldest mestres at center, each decade expands outward as a spherical shell.
 */
function computeRadialPosition(year: number | null): { x: number; y: number; z: number } {
  const radius = computeRadialDistance(year);

  // Random spherical distribution for initial position
  // theta = azimuthal angle (0 to 2π), phi = polar angle (0 to π)
  const theta = Math.random() * 2 * Math.PI;
  const phi = Math.acos(2 * Math.random() - 1); // Uniform distribution on sphere

  return {
    x: radius * Math.sin(phi) * Math.cos(theta),
    y: radius * Math.sin(phi) * Math.sin(theta),
    z: radius * Math.cos(phi),
  };
}

/**
 * Process graph data for radial temporal layout.
 * - Filters to persons only (no groups)
 * - Filters to student_of and trained_under relationships only
 * - Positions nodes on spherical shells by birth decade
 */
function processDataForStudentAncestry(data: GraphData): ForceGraphData {
  // Filter to persons only
  const personNodes = data.nodes.filter((node) => node.type === 'person');

  // Filter to student_of links only (and only between persons)
  const personIds = new Set(personNodes.map((n) => n.id));
  const studentOfLinks = data.links.filter(
    (link) =>
      (link.type === 'student_of' || link.type === 'trained_under') &&
      personIds.has(link.source) &&
      personIds.has(link.target)
  );

  // Process nodes with radial positions
  const processedNodes: ForceNode[] = personNodes.map((node) => {
    const year = getNodeYear(node);
    const pos = computeRadialPosition(year);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      z: pos.z,
      hasTemporalData: year !== null,
    };
  });

  return {
    nodes: processedNodes,
    links: studentOfLinks,
  };
}

/**
 * Create radial force configuration for temporal shells.
 */
function createRadialForces(): ForceConfig[] {
  // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
  const radialForce = forceRadial<any>()
    .radius((node: ForceNode) => {
      const year = getNodeYear(node);
      return computeRadialDistance(year);
    })
    .strength(0.8); // Strong pull to maintain spherical shells

  // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
  const chargeForce = forceManyBody<any>().strength(-50);

  return [
    {
      name: 'radial',
      force: radialForce,
    },
    {
      name: 'charge',
      force: chargeForce,
    },
  ];
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
 */
export function StudentAncestryGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: StudentAncestryGraphProps) {
  // Process data for radial layout
  const graphData = useMemo(() => processDataForStudentAncestry(data), [data]);

  // Create radial forces
  const forces = useMemo(() => createRadialForces(), []);

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
    />
  );
}

export default StudentAncestryGraph;
