'use client';

/**
 * General Genealogy Graph
 *
 * General-purpose 3D visualization showing all nodes and relationships in the genealogy graph.
 *
 * Features:
 * - Shows all node types (people and groups)
 * - Shows all relationship types
 * - Default force-directed layout (no custom positioning)
 * - Useful for exploring all data and connections incrementally as they're imported
 */

import type { GraphData, GraphNode } from '@/components/genealogy/types';
import { ForceGraph3DWrapper, type ForceGraphData } from '@/components/genealogy/core';

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
 * General Genealogy Graph - Standard force-directed visualization of all genealogy data.
 *
 * Shows all nodes (people and groups) and all relationship types using the default
 * force-directed layout. Useful for exploring the complete dataset and inspecting
 * nodes as they're added through the import pipeline.
 */
export function GeneralGenealogyGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: GeneralGenealogyGraphProps) {
  // Use data directly - no filtering or special processing
  const graphData: ForceGraphData = {
    nodes: data.nodes,
    links: data.links,
  };

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={[]} // Use default forces only
      width={width}
      height={height}
      autoFitOnLoad
      autoFitDelay={800}
      showLinkParticles
      showLinkArrows
    />
  );
}

export default GeneralGenealogyGraph;
