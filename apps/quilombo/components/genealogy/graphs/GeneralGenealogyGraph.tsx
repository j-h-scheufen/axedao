'use client';

/**
 * General Genealogy Graph
 *
 * General-purpose 3D visualization showing all nodes and relationships in the genealogy graph.
 *
 * Features:
 * - Shows all node types (people and groups)
 * - Shows all relationship types
 * - Temporal positioning: older entities closer to center (based on birth/founding year)
 * - Soft radial constraint allows nodes some movement while maintaining temporal order
 * - Per-predicate link force strengths for relationship clustering
 * - Useful for exploring all data and connections incrementally as they're imported
 */

import { useMemo } from 'react';
import { forceCollide as forceCollide3d, forceLink as forceLink3d } from 'd3-force-3d';

import type { GraphData, GraphNode } from '@/components/genealogy/types';
import {
  ForceGraph3DWrapper,
  type ForceConfig,
  type ForceGraphData,
  type ForceNode,
} from '@/components/genealogy/core';
import {
  DEFAULT_LINK_DISTANCE,
  DEFAULT_LINK_FORCE_STRENGTH,
  type TemporalForceNode,
  computeRadialDistanceForEntityYear,
  createLinkStrengthResolver,
  createRadialForce,
  getNodeYear,
  processLinks,
} from '@/components/genealogy/core/temporalLayout';

// ============================================================================
// CONFIGURATION
// ============================================================================

/** Node collision radius for preventing overlap */
const NODE_COLLISION_RADIUS = 12;

/** Radial force strength - soft constraint allows movement while maintaining temporal order */
const RADIAL_FORCE_STRENGTH = 0.95;

/**
 * Custom link force strength by predicate type.
 * Override defaults or add new predicates as needed.
 */
const LINK_FORCE_STRENGTH: Record<string, number> = {
  ...DEFAULT_LINK_FORCE_STRENGTH,
  member_of: 0.3,
  co_founded: 0.2,
};

// ============================================================================
// EXTENDED NODE TYPE
// ============================================================================

/**
 * Extended ForceNode with target radius for radial force.
 */
interface GeneralForceNode extends ForceNode, TemporalForceNode {}

/**
 * Extended graph data with GeneralForceNode type.
 */
interface GeneralGraphData extends Omit<ForceGraphData, 'nodes'> {
  nodes: GeneralForceNode[];
}

// ============================================================================
// DATA PROCESSING
// ============================================================================

/**
 * Compute initial 3D spherical coordinates for temporal layout.
 * Uses golden angle distribution for even spacing on each spherical shell.
 */
function computeInitialPosition(
  year: number | null,
  nodeIndex: number,
  totalNodes: number
): { x: number; y: number; z: number } {
  const radius = computeRadialDistanceForEntityYear(year);

  // Golden angle for even distribution on sphere
  const goldenRatio = (1 + Math.sqrt(5)) / 2;
  const theta = 2 * Math.PI * nodeIndex * goldenRatio;
  const phi = Math.acos(1 - (2 * (nodeIndex + 0.5)) / totalNodes);

  return {
    x: radius * Math.sin(phi) * Math.cos(theta),
    y: radius * Math.cos(phi),
    z: radius * Math.sin(phi) * Math.sin(theta),
  };
}

/**
 * Process graph data for 3D temporal layout.
 * - Includes all node types (persons and groups)
 * - Sets initial positions and target radius based on temporal data
 * - Groups without founding year have no target radius (float freely)
 * - Applies link direction reversal for intuitive visual flow
 */
function processDataForGeneralGraph(data: GraphData): GeneralGraphData {
  const totalNodes = data.nodes.length;

  const processedNodes: GeneralForceNode[] = data.nodes.map((node, index) => {
    const year = getNodeYear(node);
    const hasTemporalData = year !== null;

    // Only set target radius for nodes with temporal data
    const targetRadius = hasTemporalData ? computeRadialDistanceForEntityYear(year) : undefined;
    const pos = computeInitialPosition(year, index, totalNodes);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      z: pos.z,
      targetRadius,
      hasTemporalData,
    };
  });

  // Process links with default direction reversal
  const processedLinks = processLinks(data.links);

  return {
    nodes: processedNodes,
    links: processedLinks,
  };
}

// ============================================================================
// COMPONENT
// ============================================================================

interface GeneralGenealogyGraphProps {
  /** Full graph data (all nodes and links) */
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
 * General Genealogy Graph - 3D force-directed visualization with temporal ordering.
 *
 * Shows all nodes (people and groups) and all relationship types with:
 * - Older entities positioned closer to center (based on birth/founding year)
 * - Soft radial constraint (0.95) allowing some movement while maintaining order
 * - Per-predicate link forces for relationship-based clustering
 * - Full 3D movement for exploring the complete dataset
 */
export function GeneralGenealogyGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: GeneralGenealogyGraphProps) {
  // Process data for 3D temporal layout
  const graphData = useMemo(() => processDataForGeneralGraph(data), [data]);

  // Create forces for temporal positioning, collision prevention, and link clustering
  const forces = useMemo((): ForceConfig[] => {
    // Collision force: prevents nodes from overlapping
    const collideForce = forceCollide3d(NODE_COLLISION_RADIUS);

    // Link force: per-link strength based on predicate type
    const linkForce = forceLink3d(graphData.links)
      // biome-ignore lint/suspicious/noExplicitAny: d3-force-3d types are complex
      .id((node: any) => node.id)
      .strength(createLinkStrengthResolver(LINK_FORCE_STRENGTH))
      .distance(DEFAULT_LINK_DISTANCE);

    // Radial force: soft constraint pulls nodes toward their temporal position
    // Only applies to nodes with temporal data (birth/founding year)
    const radialForce = createRadialForce({
      strength: RADIAL_FORCE_STRENGTH, // Soft constraint allows movement
      constrainToPlane: false, // Full 3D layout
      onlyTemporalNodes: true, // Groups without founding year float freely
    });

    return [
      { name: 'collide', force: collideForce },
      { name: 'link', force: linkForce },
      { name: 'radial', force: radialForce },
    ];
  }, [graphData.links]);

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

export default GeneralGenealogyGraph;
