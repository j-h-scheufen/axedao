'use client';

/**
 * Unified Genealogy Graph Component
 *
 * Supports multiple view modes with different graph implementations:
 * - General view: 3D spherical layout using ForceGraph3DWrapper
 * - Student Ancestry view: 2D flat radial layout using ForceGraph2DWrapper
 *
 * Following react-force-graph best practices:
 * - Separate 2D and 3D graph instances for optimal UX per view
 * - useMemo for stable data references
 */

import { useAtomValue } from 'jotai';
import { useMemo } from 'react';
import { forceCollide } from 'd3-force';
import { forceCollide as forceCollide3d } from 'd3-force-3d';

import {
  STUDENT_ANCESTRY_ALL_PREDICATES,
  STUDENT_ANCESTRY_GRAVITY_ONLY_PREDICATES,
  STUDENT_ANCESTRY_VISIBLE_PREDICATES,
} from '@/components/genealogy/config';
import { graphFiltersAtom, graphSettingsAtom, graphViewModeAtom, showYourselfAtom } from '@/components/genealogy/state';
import type { GraphData, GraphNode, PersonMetadata } from '@/components/genealogy/types';
import { currentUserProfileIdAtom } from '@/hooks/state/currentUser';
import { useUserAncestry } from '@/hooks/useGenealogyData';
import { shouldIncludePersonNode } from '@/utils/genealogy';
import {
  ForceGraph2DWrapper,
  ForceGraph3DWrapper,
  type ForceConfig,
  type ForceConfig2D,
  type ForceGraphData,
  type ForceGraphData2D,
  type ForceNode,
  type ForceNode2D,
  type LinkForceConfig,
  type LinkForceConfig2D,
  type TemporalLayout,
} from '@/components/genealogy/core';
import {
  ANCESTRY_COLLISION_RADIUS,
  ANCESTRY_LINK_STRENGTH,
  ANCESTRY_MIN_TITLE_LEVEL,
  GENERAL_COLLISION_RADIUS,
  GENERAL_LINK_STRENGTH,
  GENERAL_MIN_TITLE_LEVEL,
  GENERAL_VIEW_LAYOUT_CONFIG,
  SIMULATION_CONFIG,
  STUDENT_ANCESTRY_LAYOUT_CONFIG,
} from './constants';
import {
  BIRTH_YEAR_OFFSET,
  createLinkStrengthResolver,
  createTemporalLayout,
  getEraBand,
  getNodeYear,
  processLinks,
} from '@/components/genealogy/core/temporalLayout';

// ============================================================================
// TYPES
// ============================================================================

interface GenealogyGraphProps {
  /** Raw graph data from API */
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
  /** Scale factor for node sizes (use > 1 for larger touch targets on mobile) */
  nodeScale?: number;
}

/**
 * Extended ForceNode with temporal layout properties (3D).
 */
interface TemporalForceNode extends ForceNode {
  targetRadius?: number;
  hasTemporalData?: boolean;
}

/**
 * Extended ForceNode with temporal layout properties (2D).
 */
interface TemporalForceNode2D extends ForceNode2D {
  targetRadius?: number;
  hasTemporalData?: boolean;
}

interface ProcessedGraphData extends Omit<ForceGraphData, 'nodes'> {
  nodes: TemporalForceNode[];
}

interface ProcessedGraphData2D extends Omit<ForceGraphData2D, 'nodes'> {
  nodes: TemporalForceNode2D[];
}

// ============================================================================
// DATA PROCESSING
// ============================================================================

/**
 * Compute initial 3D spherical coordinates (for general view).
 */
function computeSphericalPosition(
  layout: TemporalLayout,
  year: number | null,
  nodeIndex: number,
  totalNodes: number
): { x: number; y: number; z: number } {
  const radius = layout.computeRadialDistanceForEntityYear(year);
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
 * Compute flat radial coordinates for 2D view (student ancestry view).
 * Uses XY plane for 2D canvas rendering.
 */
function computeFlatRadialPosition2D(
  layout: TemporalLayout,
  birthYear: number | null,
  nodeIndex: number,
  bandNodeCounts: Map<number, number>
): { x: number; y: number } {
  const effectiveYear = birthYear !== null ? birthYear + BIRTH_YEAR_OFFSET : layout.config.unknownYear;
  const radius = layout.computeRadialDistanceForEntityYear(birthYear);
  const band = getEraBand(effectiveYear);

  const currentCount = bandNodeCounts.get(band) || 0;
  bandNodeCounts.set(band, currentCount + 1);

  const i = currentCount + nodeIndex * 0.1;
  const theta = Math.PI * (1 + Math.sqrt(5)) * i;

  return {
    x: radius * Math.cos(theta),
    y: radius * Math.sin(theta),
  };
}

/**
 * Process data for General view - all nodes, 3D spherical layout.
 */
function processForGeneralView(layout: TemporalLayout, data: GraphData): ProcessedGraphData {
  const totalNodes = data.nodes.length;

  const processedNodes: TemporalForceNode[] = data.nodes.map((node, index) => {
    const year = getNodeYear(node);
    const hasTemporalData = year !== null;
    const targetRadius = layout.computeRadialDistanceForEntityYear(year); // null -> 2020 default
    const pos = computeSphericalPosition(layout, year, index, totalNodes);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      z: pos.z,
      targetRadius,
      hasTemporalData,
    };
  });

  const processedLinks = processLinks(data.links);

  return { nodes: processedNodes, links: processedLinks };
}

/**
 * Process data for Student Ancestry view - persons only, flat radial layout (2D version).
 * Uses XY plane for canvas-based 2D rendering.
 */
function processForStudentAncestryView2D(layout: TemporalLayout, data: GraphData): ProcessedGraphData2D {
  // Filter to persons only
  const personNodes = data.nodes.filter((node) => node.type === 'person');
  const personIds = new Set(personNodes.map((n) => n.id));

  // Fresh band counts for this processing run
  const bandNodeCounts = new Map<number, number>();

  // Filter to ancestry-relevant links between persons
  const filteredLinks = data.links.filter((link) => {
    if (!STUDENT_ANCESTRY_ALL_PREDICATES.has(link.type)) return false;
    const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
    const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;
    return personIds.has(sourceId) && personIds.has(targetId);
  });

  const ancestryLinks = processLinks(filteredLinks, {
    reversedPredicates: STUDENT_ANCESTRY_VISIBLE_PREDICATES,
    invisiblePredicates: STUDENT_ANCESTRY_GRAVITY_ONLY_PREDICATES,
  });

  const processedNodes: TemporalForceNode2D[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const targetRadius = layout.computeRadialDistanceForYear(year ?? layout.config.unknownYear);
    const pos = computeFlatRadialPosition2D(layout, year, index, bandNodeCounts);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      targetRadius,
      hasTemporalData: year !== null,
    };
  });

  return { nodes: processedNodes, links: ancestryLinks };
}

// ============================================================================
// COMPONENT
// ============================================================================

/**
 * Unified Genealogy Graph - supports multiple view modes without remounting.
 *
 * Filtering is applied in two stages:
 * 1. View-mode filtering: Each view has inherent constraints (e.g., student-ancestry shows only persons)
 * 2. User filtering: Additional filtering based on user selections in GraphControls
 *
 * TODO: When dataset grows significantly (10,000+ nodes), consider moving filtering to server-side
 *
 * View modes:
 * - general: All nodes and relationships, 3D spherical temporal layout
 * - student-ancestry: Persons only, flat radial timeline with era rings
 */
export function GenealogyGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
  nodeScale,
}: GenealogyGraphProps) {
  // Jotai state
  const viewMode = useAtomValue(graphViewModeAtom);
  const filters = useAtomValue(graphFiltersAtom);
  const settings = useAtomValue(graphSettingsAtom);

  // View mode and title level filtering
  const isStudentAncestryView = viewMode === 'student-ancestry';
  const minTitleLevel = isStudentAncestryView ? ANCESTRY_MIN_TITLE_LEVEL : GENERAL_MIN_TITLE_LEVEL;

  // "Show Yourself" feature state (ancestry view only)
  const showYourself = useAtomValue(showYourselfAtom);
  const userProfileId = useAtomValue(currentUserProfileIdAtom);

  // Fetch user's ancestry when "Show Yourself" is enabled
  const { data: ancestryData } = useUserAncestry(userProfileId, {
    enabled: showYourself && isStudentAncestryView && !!userProfileId,
  });

  // Create temporal layouts for each view mode
  const generalLayout = useMemo(() => createTemporalLayout(GENERAL_VIEW_LAYOUT_CONFIG), []);
  const studentAncestryLayout = useMemo(() => createTemporalLayout(STUDENT_ANCESTRY_LAYOUT_CONFIG), []);

  // Apply user filters to the raw data first
  // Empty arrays mean "show none" - filters are always explicit
  const filteredData = useMemo((): GraphData => {
    const nodeTypeSet = new Set(filters.nodeTypes);
    const predicateSet = new Set(filters.predicates);

    // Filter nodes by type
    let filteredNodes = data.nodes.filter((node) => nodeTypeSet.has(node.type));

    // Apply person filtering based on view mode:
    // - Both views: include persons meeting the title level threshold
    // - Both views: include historical/deceased figures to preserve lineage continuity
    // - Both views: always include the current user's node (if viewing their ancestry)
    filteredNodes = filteredNodes.filter((node) => {
      // Groups pass through (no person filtering)
      if (node.type !== 'person') {
        return true;
      }

      // Apply person filtering using centralized logic
      const meta = node.metadata as PersonMetadata;
      return shouldIncludePersonNode(node.id, meta.title, meta.birthYear, meta.deathYear, {
        minTitleLevel,
        includeHistorical: true,
        currentUserProfileId: userProfileId,
      });
    });

    const filteredNodeIds = new Set(filteredNodes.map((n) => n.id));

    // Filter links: must connect filtered nodes and match predicate filter
    const filteredLinks = data.links.filter((link) => {
      const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;

      // Both endpoints must exist in filtered nodes
      if (!filteredNodeIds.has(sourceId) || !filteredNodeIds.has(targetId)) {
        return false;
      }

      // Link type must be in the selected predicates
      if (!predicateSet.has(link.type)) {
        return false;
      }

      return true;
    });

    return {
      nodes: filteredNodes,
      links: filteredLinks,
      stats: {
        totalNodes: filteredNodes.length,
        totalLinks: filteredLinks.length,
        personCount: filteredNodes.filter((n) => n.type === 'person').length,
        groupCount: filteredNodes.filter((n) => n.type === 'group').length,
      },
    };
  }, [data, filters, minTitleLevel, userProfileId]);

  // Process filtered data for 3D (general view only now)
  const graphData3D = useMemo((): ProcessedGraphData => {
    return processForGeneralView(generalLayout, filteredData);
  }, [filteredData, generalLayout]);

  // Process filtered data for 2D (student ancestry view)
  const graphData2D = useMemo((): ProcessedGraphData2D => {
    return processForStudentAncestryView2D(studentAncestryLayout, filteredData);
  }, [filteredData, studentAncestryLayout]);

  // Create forces for 3D general view
  const forces3D = useMemo((): ForceConfig[] => {
    const collideForce = forceCollide3d(GENERAL_COLLISION_RADIUS);
    const radialForce = generalLayout.createRadialForce({
      strength: 1.0,
      constrainToPlane: false,
      onlyTemporalNodes: false,
    });
    return [
      { name: 'collide', force: collideForce },
      { name: 'radial', force: radialForce },
    ];
  }, [generalLayout]);

  // Create forces for 2D student ancestry view
  const forces2D = useMemo((): ForceConfig2D[] => {
    const collideForce = forceCollide(ANCESTRY_COLLISION_RADIUS);
    const radialForce = studentAncestryLayout.createRadialForce2D({
      strength: 1.0,
      onlyTemporalNodes: false,
    });
    return [
      { name: 'collide', force: collideForce },
      { name: 'radial', force: radialForce },
    ];
  }, [studentAncestryLayout]);

  // Link force configuration for 3D
  const linkForceConfig3D = useMemo((): LinkForceConfig => {
    const strength = createLinkStrengthResolver(GENERAL_LINK_STRENGTH);
    return { strength, distance: generalLayout.config.linkDistance };
  }, [generalLayout]);

  // Link force configuration for 2D
  const linkForceConfig2D = useMemo((): LinkForceConfig2D => {
    const strength = createLinkStrengthResolver(ANCESTRY_LINK_STRENGTH);
    return { strength, distance: studentAncestryLayout.config.linkDistance };
  }, [studentAncestryLayout]);

  // Zoom-to-fit padding for 3D view
  const autoFitPadding3D = 35;
  // Zoom-to-fit padding for 2D view
  const autoFitPadding2D = 50;

  // Compute highlighted node IDs for "Highlight Your Lineage" feature
  // When enabled, user's node + ancestors are highlighted, others are dimmed
  // Title-level filtering is already applied at the view level (filteredData)
  const highlightedNodeIds = useMemo((): ReadonlySet<string> | undefined => {
    // Only compute when feature is enabled in student ancestry view
    if (!showYourself || !isStudentAncestryView || !userProfileId) {
      return undefined;
    }

    const highlighted = new Set<string>();

    // Include the user's node
    highlighted.add(userProfileId);

    // Include all ancestors (only those in the filtered view will be visible anyway)
    if (ancestryData?.ancestorIds) {
      for (const ancestorId of ancestryData.ancestorIds) {
        highlighted.add(ancestorId);
      }
    }

    return highlighted;
  }, [showYourself, isStudentAncestryView, userProfileId, ancestryData]);

  // Render 2D wrapper for student-ancestry view
  if (isStudentAncestryView) {
    return (
      <ForceGraph2DWrapper
        graphData={graphData2D}
        selectedNodeId={selectedNodeId}
        highlightedNodeIds={highlightedNodeIds}
        onNodeClick={onNodeClick}
        onBackgroundClick={onBackgroundClick}
        forces={forces2D}
        linkForceConfig={linkForceConfig2D}
        eraRingsLayout={studentAncestryLayout}
        autoFitPadding={autoFitPadding2D}
        width={width}
        height={height}
        nodeScale={nodeScale}
        autoFitOnLoad
        showLinkArrows
        showLinkParticles={settings.showAnimations}
        warmupTicks={SIMULATION_CONFIG.warmupTicks}
        cooldownTicks={SIMULATION_CONFIG.cooldownTicks}
        d3AlphaDecay={SIMULATION_CONFIG.d3AlphaDecay}
        d3VelocityDecay={SIMULATION_CONFIG.d3VelocityDecay}
      />
    );
  }

  // Render 3D wrapper for general view
  return (
    <ForceGraph3DWrapper
      graphData={graphData3D}
      selectedNodeId={selectedNodeId}
      highlightedNodeIds={highlightedNodeIds}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={forces3D}
      linkForceConfig={linkForceConfig3D}
      autoFitPadding={autoFitPadding3D}
      width={width}
      height={height}
      nodeScale={nodeScale}
      autoFitOnLoad
      showLinkParticles={settings.showAnimations}
      showLinkArrows
      warmupTicks={SIMULATION_CONFIG.warmupTicks}
      cooldownTicks={SIMULATION_CONFIG.cooldownTicks}
      d3AlphaDecay={SIMULATION_CONFIG.d3AlphaDecay}
      d3VelocityDecay={SIMULATION_CONFIG.d3VelocityDecay}
    />
  );
}

export default GenealogyGraph;
