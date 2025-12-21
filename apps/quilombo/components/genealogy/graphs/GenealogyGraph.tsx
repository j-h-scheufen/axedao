'use client';

/**
 * Unified Genealogy Graph Component
 *
 * Single ForceGraph3D instance that supports multiple view modes.
 * View mode controls data filtering, layout style, and visual elements.
 *
 * Following react-force-graph best practices:
 * - Single graph instance, dynamic graphData changes
 * - No remounting on view switch (avoids animation tick crashes)
 * - useMemo for stable data references
 */

import { useAtomValue } from 'jotai';
import { useMemo } from 'react';
import * as THREE from 'three';
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
  ForceGraph3DWrapper,
  type CameraPosition,
  type CustomSceneObject,
  type ForceConfig,
  type ForceGraphData,
  type ForceNode,
  type LinkForceConfig,
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
  ERA_CONFIG,
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
}

/**
 * Extended ForceNode with temporal layout properties.
 */
interface TemporalForceNode extends ForceNode {
  targetRadius?: number;
  hasTemporalData?: boolean;
}

interface ProcessedGraphData extends Omit<ForceGraphData, 'nodes'> {
  nodes: TemporalForceNode[];
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
 * Compute flat radial coordinates (for student ancestry view).
 * All nodes in XZ plane (y=0).
 */
function computeFlatRadialPosition(
  layout: TemporalLayout,
  birthYear: number | null,
  nodeIndex: number,
  bandNodeCounts: Map<number, number>
): { x: number; y: number; z: number } {
  const effectiveYear = birthYear !== null ? birthYear + BIRTH_YEAR_OFFSET : ERA_CONFIG.unknownYear;
  const radius = layout.computeRadialDistanceForEntityYear(birthYear);
  const band = getEraBand(effectiveYear);

  const currentCount = bandNodeCounts.get(band) || 0;
  bandNodeCounts.set(band, currentCount + 1);

  const i = currentCount + nodeIndex * 0.1;
  const theta = Math.PI * (1 + Math.sqrt(5)) * i;

  return {
    x: radius * Math.cos(theta),
    y: 0,
    z: radius * Math.sin(theta),
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
 * Process data for Student Ancestry view - persons only, flat radial layout.
 */
function processForStudentAncestryView(layout: TemporalLayout, data: GraphData): ProcessedGraphData {
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

  const processedNodes: TemporalForceNode[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const targetRadius = layout.computeRadialDistanceForYear(year ?? ERA_CONFIG.unknownYear);
    const pos = computeFlatRadialPosition(layout, year, index, bandNodeCounts);

    return {
      ...node,
      x: pos.x,
      y: pos.y,
      z: pos.z,
      targetRadius,
      hasTemporalData: year !== null,
    };
  });

  return { nodes: processedNodes, links: ancestryLinks };
}

// ============================================================================
// ERA RING VISUALIZATION (Student Ancestry only)
// ============================================================================

const RING_CONFIG = {
  lineColor: 0x888888,
  lineOpacity: 0.5,
  segments: 64,
  labelFontSize: 12,
  labelColor: 'rgba(200, 200, 200, 0.9)',
} as const;

const SLAVERY_ERA_CONFIG = {
  abolitionYear: 1888,
  discColor: 0x3d2817,
  discOpacity: 0.18,
  abolitionRingColor: 0xc9a227,
  abolitionRingOpacity: 0.85,
  abolitionLabel: 'Abolição (1888)',
  labelColor: 'rgba(201, 162, 39, 0.95)',
} as const;

interface EraRing {
  id: string;
  label: string;
  radius: number;
  band: number;
}

function generateEraRings(layout: TemporalLayout): EraRing[] {
  const rings: EraRing[] = [];

  for (const era of ERA_CONFIG.foundation) {
    if (era.startYear === -Infinity) continue;
    rings.push({
      id: `era-ring-${era.band}`,
      label: era.label,
      radius: layout.computeRadialDistanceForYear(era.startYear),
      band: era.band,
    });
  }

  for (let decade = 1900; decade <= 2020; decade += 10) {
    const band = getEraBand(decade);
    rings.push({
      id: `era-ring-${band}`,
      label: `${decade}s`,
      radius: layout.computeRadialDistanceForYear(decade),
      band,
    });
  }

  return rings;
}

function createTextSprite(text: string, radius: number, color: string, xOffset: number = 12): THREE.Sprite {
  const canvas = document.createElement('canvas');
  const context = canvas.getContext('2d') as CanvasRenderingContext2D;

  const fontSize = RING_CONFIG.labelFontSize * 4;
  context.font = `bold ${fontSize}px Arial`;
  const metrics = context.measureText(text);
  const textWidth = metrics.width;

  canvas.width = textWidth + 24;
  canvas.height = fontSize * 1.4;

  context.fillStyle = 'rgba(26, 26, 46, 0.75)';
  context.roundRect(0, 0, canvas.width, canvas.height, 6);
  context.fill();

  context.font = `bold ${fontSize}px Arial`;
  context.fillStyle = color;
  context.textAlign = 'center';
  context.textBaseline = 'middle';
  context.fillText(text, canvas.width / 2, canvas.height / 2);

  const texture = new THREE.CanvasTexture(canvas);
  texture.needsUpdate = true;

  const material = new THREE.SpriteMaterial({
    map: texture,
    transparent: true,
    depthTest: false,
    depthWrite: false,
  });

  const sprite = new THREE.Sprite(material);
  sprite.scale.set(canvas.width / 10, canvas.height / 10, 1);
  sprite.position.set(radius + xOffset, 0, 0);
  sprite.renderOrder = 1000;

  return sprite;
}

function createSlaveryEraObject(layout: TemporalLayout): THREE.Group {
  const group = new THREE.Group();
  const abolitionRadius = layout.computeRadialDistanceForYear(SLAVERY_ERA_CONFIG.abolitionYear);

  // Filled disc for slavery period
  const discGeometry = new THREE.CircleGeometry(abolitionRadius, RING_CONFIG.segments);
  const discMaterial = new THREE.MeshBasicMaterial({
    color: SLAVERY_ERA_CONFIG.discColor,
    transparent: true,
    opacity: SLAVERY_ERA_CONFIG.discOpacity,
    side: THREE.DoubleSide,
    depthWrite: false,
  });
  const disc = new THREE.Mesh(discGeometry, discMaterial);
  disc.rotation.x = -Math.PI / 2;
  disc.position.y = -0.1;
  disc.renderOrder = -1;
  group.add(disc);

  // Golden abolition ring
  const ringPoints: THREE.Vector3[] = [];
  for (let i = 0; i <= RING_CONFIG.segments; i++) {
    const theta = (i / RING_CONFIG.segments) * Math.PI * 2;
    ringPoints.push(new THREE.Vector3(abolitionRadius * Math.cos(theta), 0, abolitionRadius * Math.sin(theta)));
  }
  const ringGeometry = new THREE.BufferGeometry().setFromPoints(ringPoints);
  const ringMaterial = new THREE.LineBasicMaterial({
    color: SLAVERY_ERA_CONFIG.abolitionRingColor,
    transparent: true,
    opacity: SLAVERY_ERA_CONFIG.abolitionRingOpacity,
  });
  const ring = new THREE.Line(ringGeometry, ringMaterial);
  ring.renderOrder = 100;
  group.add(ring);

  // Abolition label - positioned on right side like other era labels
  const label = createTextSprite(SLAVERY_ERA_CONFIG.abolitionLabel, abolitionRadius, SLAVERY_ERA_CONFIG.labelColor);
  label.renderOrder = 1001;
  group.add(label);

  return group;
}

function createEraRingObject(ring: EraRing): THREE.Group {
  const group = new THREE.Group();

  const points: THREE.Vector3[] = [];
  for (let i = 0; i <= RING_CONFIG.segments; i++) {
    const theta = (i / RING_CONFIG.segments) * Math.PI * 2;
    points.push(new THREE.Vector3(ring.radius * Math.cos(theta), 0, ring.radius * Math.sin(theta)));
  }

  const geometry = new THREE.BufferGeometry().setFromPoints(points);
  const material = new THREE.LineBasicMaterial({
    color: RING_CONFIG.lineColor,
    transparent: true,
    opacity: RING_CONFIG.lineOpacity,
  });
  const line = new THREE.Line(geometry, material);
  group.add(line);

  const label = createTextSprite(ring.label, ring.radius, RING_CONFIG.labelColor);
  group.add(label);

  return group;
}

function generateEraRingObjects(layout: TemporalLayout): CustomSceneObject[] {
  const objects: CustomSceneObject[] = [];

  objects.push({
    id: 'slavery-era',
    object: createSlaveryEraObject(layout),
  });

  const rings = generateEraRings(layout);
  for (const ring of rings) {
    objects.push({
      id: ring.id,
      object: createEraRingObject(ring),
    });
  }

  return objects;
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

  // Select the appropriate layout for the current view
  const currentLayout = isStudentAncestryView ? studentAncestryLayout : generalLayout;

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

  // Process filtered data based on view mode (applies view-specific transformations)
  const graphData = useMemo((): ProcessedGraphData => {
    if (viewMode === 'student-ancestry') {
      return processForStudentAncestryView(studentAncestryLayout, filteredData);
    }
    return processForGeneralView(generalLayout, filteredData);
  }, [filteredData, viewMode, generalLayout, studentAncestryLayout]);

  // Create forces based on view mode
  const forces = useMemo((): ForceConfig[] => {
    if (viewMode === 'student-ancestry') {
      // Flat ancestry view: larger collision radius, hard radial + plane constraint
      const collideForce = forceCollide3d(ANCESTRY_COLLISION_RADIUS);
      const radialForce = studentAncestryLayout.createRadialForce({
        strength: 1.0,
        constrainToPlane: true,
        onlyTemporalNodes: false,
      });
      return [
        { name: 'collide', force: collideForce },
        { name: 'radial', force: radialForce },
      ];
    }

    // General view: standard collision radius, soft radial constraint, full 3D
    const collideForce = forceCollide3d(GENERAL_COLLISION_RADIUS);
    const radialForce = generalLayout.createRadialForce({
      strength: 1.0,
      constrainToPlane: false,
      onlyTemporalNodes: false, // Constrain all nodes, including those without dates (default to 2020)
    });
    return [
      { name: 'collide', force: collideForce },
      { name: 'radial', force: radialForce },
    ];
  }, [viewMode, generalLayout, studentAncestryLayout]);

  // Link force configuration based on view mode
  const linkForceConfig = useMemo((): LinkForceConfig => {
    const strength =
      viewMode === 'general'
        ? createLinkStrengthResolver(GENERAL_LINK_STRENGTH)
        : createLinkStrengthResolver(ANCESTRY_LINK_STRENGTH);

    return { strength, distance: currentLayout.config.linkDistance };
  }, [viewMode, currentLayout]);

  // Scene objects (era rings) - only for student ancestry view
  const customSceneObjects = useMemo((): CustomSceneObject[] | undefined => {
    if (viewMode === 'student-ancestry') {
      return generateEraRingObjects(studentAncestryLayout);
    }
    return undefined;
  }, [viewMode, studentAncestryLayout]);

  // Camera position - different per view
  const initialCameraPosition = useMemo((): CameraPosition | undefined => {
    if (viewMode === 'student-ancestry') {
      const distance = 300;
      const angle = Math.PI / 4;
      return {
        x: distance * Math.cos(angle),
        y: distance * Math.sin(angle),
        z: distance * Math.cos(angle),
      };
    }
    return undefined; // Auto-fit for general view
  }, [viewMode]);

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

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      highlightedNodeIds={highlightedNodeIds}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={forces}
      linkForceConfig={linkForceConfig}
      customSceneObjects={customSceneObjects}
      initialCameraPosition={initialCameraPosition}
      width={width}
      height={height}
      autoFitOnLoad
      autoFitDelay={800}
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
