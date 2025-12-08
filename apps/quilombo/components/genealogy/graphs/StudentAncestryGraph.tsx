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

import type { GraphData, GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { ForceGraph3DWrapper, type ForceGraphData, type ForceNode } from '@/components/genealogy/core';

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

// Keep track of node count per decade for even distribution
const decadeNodeCounts = new Map<number, number>();

/**
 * Compute spherical coordinates for radial temporal layout using Fibonacci sphere.
 * Oldest mestres at center, each decade expands outward as a spherical shell.
 * Uses Fibonacci spiral for even distribution on each shell.
 */
function computeRadialPosition(
  year: number | null,
  nodeIndex: number,
  totalNodes: number
): { x: number; y: number; z: number } {
  const radius = computeRadialDistance(year);
  const effectiveYear = year ?? UNKNOWN_YEAR_RADIUS;
  const decade = Math.floor(effectiveYear / 10) * 10;

  // Track how many nodes are on this decade shell
  const currentCount = decadeNodeCounts.get(decade) || 0;
  decadeNodeCounts.set(decade, currentCount + 1);

  // Use Fibonacci sphere for even distribution on this shell
  // Add nodeIndex to ensure different positions even for same decade
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
 * Process graph data for radial temporal layout.
 * - Filters to persons only (no groups)
 * - Filters to student_of and trained_under relationships only
 * - Positions nodes on spherical shells by birth decade
 */
function processDataForStudentAncestry(data: GraphData): ForceGraphData {
  // Filter to persons only
  const personNodes = data.nodes.filter((node) => node.type === 'person');

  // Reset decade counts for fresh distribution
  decadeNodeCounts.clear();

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

      return {
        ...link,
        source: sourceId,
        target: targetId,
      };
    });

  // Process nodes with radial positions
  const totalNodes = personNodes.length;
  const processedNodes: ForceNode[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const pos = computeRadialPosition(year, index, totalNodes);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      z: pos.z,
      fx: pos.x, // Fix x position to prevent force simulation from moving it
      fy: pos.y, // Fix y position
      fz: pos.z, // Fix z position
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
 */
export function StudentAncestryGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: StudentAncestryGraphProps) {
  // Process data for radial layout with fixed positions
  const graphData = useMemo(() => processDataForStudentAncestry(data), [data]);

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={[]} // Empty - using fixed positions (fx, fy, fz) instead
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
