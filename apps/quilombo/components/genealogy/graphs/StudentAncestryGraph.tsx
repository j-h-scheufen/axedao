'use client';

/**
 * Student Ancestry Graph
 *
 * Specialized 3D visualization showing capoeira lineages through student-teacher relationships.
 *
 * Features:
 * - Flat radial layout: oldest mestres at center, decades expand outward as concentric rings
 * - All nodes placed in XZ plane (y=0) aligned with era rings
 * - Filters to persons only (no groups)
 * - Shows student_of and trained_under relationships
 * - Temporal positioning based on birth year
 * - Force-directed angular positioning to cluster connected nodes
 */

import { useMemo } from 'react';
import * as THREE from 'three';
import { forceCollide as forceCollide3d, forceLink as forceLink3d } from 'd3-force-3d';

import type { GraphData, GraphNode } from '@/components/genealogy/types';
import {
  ForceGraph3DWrapper,
  type CustomSceneObject,
  type ForceConfig,
  type ForceGraphData,
  type ForceNode,
} from '@/components/genealogy/core';
import {
  BIRTH_YEAR_OFFSET,
  DEFAULT_LINK_DISTANCE,
  DEFAULT_LINK_FORCE_STRENGTH,
  ERA_CONFIG,
  computeRadialDistanceForEntityYear,
  computeRadialDistanceForYear,
  createLinkStrengthResolver,
  createRadialForce,
  getEraBand,
  getNodeYear,
  processLinks,
} from '@/components/genealogy/core/temporalLayout';

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

// Keep track of node count per era band for even distribution
const bandNodeCounts = new Map<number, number>();

/**
 * Compute flat 2D radial coordinates for temporal layout.
 * All nodes placed in the XZ plane (y=0) to align with era rings.
 * Uses golden angle distribution for even spacing on each ring.
 */
function computeRadialPosition(
  birthYear: number | null,
  nodeIndex: number,
  _totalNodes: number
): { x: number; y: number; z: number } {
  // Apply offset to convert birth year to "active capoeira year"
  const effectiveYear = birthYear !== null ? birthYear + BIRTH_YEAR_OFFSET : ERA_CONFIG.unknownYear;
  const radius = computeRadialDistanceForEntityYear(birthYear);
  const band = getEraBand(effectiveYear);

  // Track how many nodes are on this band's ring
  const currentCount = bandNodeCounts.get(band) || 0;
  bandNodeCounts.set(band, currentCount + 1);

  // Use golden angle for even distribution around the ring
  // Add nodeIndex * 0.1 to ensure different positions even for same band
  const i = currentCount + nodeIndex * 0.1;
  const theta = Math.PI * (1 + Math.sqrt(5)) * i; // Golden angle

  // Flat layout: all nodes at y=0 (XZ plane)
  return {
    x: radius * Math.cos(theta),
    y: 0,
    z: radius * Math.sin(theta),
  };
}

/**
 * Extended graph data with AncestryForceNode type.
 */
interface AncestryGraphData extends Omit<ForceGraphData, 'nodes'> {
  nodes: AncestryForceNode[];
}

// Predicates that create visible connections (teaching lineage)
const VISIBLE_PREDICATES = new Set(['student_of', 'trained_under']);
// Predicates that create invisible connections (gravity/clustering only)
const GRAVITY_ONLY_PREDICATES = new Set(['associated_with', 'influenced_by']);
// All predicates relevant to the ancestry graph
const ANCESTRY_PREDICATES = new Set([...VISIBLE_PREDICATES, ...GRAVITY_ONLY_PREDICATES]);

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

  // Filter to lineage-relevant links (and only between persons)
  const personIds = new Set(personNodes.map((n) => n.id));

  const filteredLinks = data.links.filter((link) => {
    // Check if this is a lineage-relevant relationship
    if (!ANCESTRY_PREDICATES.has(link.type)) {
      return false;
    }

    // Handle both string IDs and object references
    const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
    const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;

    // Only include links between persons
    return personIds.has(sourceId) && personIds.has(targetId);
  });

  // Process links with direction reversal and invisibility
  const ancestryLinks = processLinks(filteredLinks, {
    reversedPredicates: VISIBLE_PREDICATES,
    invisiblePredicates: GRAVITY_ONLY_PREDICATES,
  });

  // Process nodes with initial positions and target radius
  // Initial positions spread nodes on their target shells; force simulation will adjust
  const totalNodes = personNodes.length;
  const processedNodes: AncestryForceNode[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const targetRadius = computeRadialDistanceForEntityYear(year);
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
    links: ancestryLinks,
  };
}

// ============================================================================
// ERA RING VISUALIZATION (Path 1 - Flat 2D Radial Layout)
// ============================================================================

/** Ring visual configuration */
const RING_CONFIG = {
  /** Line color (subtle grey) */
  lineColor: 0x888888,
  /** Line opacity */
  lineOpacity: 0.5,
  /** Number of segments for ring geometry (smoothness) */
  segments: 64,
  /** Label font size */
  labelFontSize: 12,
  /** Label color */
  labelColor: 'rgba(200, 200, 200, 0.9)',
} as const;

/**
 * Era ring definition with label and radius.
 */
interface EraRing {
  id: string;
  label: string;
  radius: number;
  band: number;
}

/**
 * Generate era ring definitions for all eras that have data.
 * Returns rings from foundation eras through 2020s.
 */
function generateEraRings(): EraRing[] {
  const rings: EraRing[] = [];

  // Foundation eras (bands 1-2 only) - skip Pre-1800 (band 0) as it clutters the center
  for (const era of ERA_CONFIG.foundation) {
    // Skip Pre-1800 era ring
    if (era.startYear === -Infinity) continue;

    rings.push({
      id: `era-ring-${era.band}`,
      label: era.label,
      radius: computeRadialDistanceForYear(era.startYear),
      band: era.band,
    });
  }

  // Modern era decades (1900s through 2020s) - use actual decade positions (no birth offset)
  for (let decade = 1900; decade <= 2020; decade += 10) {
    const band = getEraBand(decade);
    rings.push({
      id: `era-ring-${band}`,
      label: `${decade}s`,
      radius: computeRadialDistanceForYear(decade),
      band,
    });
  }

  return rings;
}

/**
 * Create a text sprite for era labels.
 * Positioned at the edge of the ring on the X axis.
 */
function createEraLabelSprite(text: string, radius: number): THREE.Sprite {
  const canvas = document.createElement('canvas');
  const context = canvas.getContext('2d') as CanvasRenderingContext2D;

  // Set canvas size
  const fontSize = RING_CONFIG.labelFontSize * 4; // Scale up for clarity
  context.font = `bold ${fontSize}px Arial`;
  const metrics = context.measureText(text);
  const textWidth = metrics.width;

  canvas.width = textWidth + 24;
  canvas.height = fontSize * 1.4;

  // Draw semi-transparent background
  context.fillStyle = 'rgba(26, 26, 46, 0.75)';
  context.roundRect(0, 0, canvas.width, canvas.height, 6);
  context.fill();

  // Draw text
  context.font = `bold ${fontSize}px Arial`;
  context.fillStyle = RING_CONFIG.labelColor;
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
  // Position at edge of ring on X axis, slightly outside
  sprite.position.set(radius + 12, 0, 0);
  sprite.renderOrder = 1000;

  return sprite;
}

/**
 * Create a single horizontal ring (circle) at y=0 for an era.
 */
function createEraRingObject(ring: EraRing): THREE.Group {
  const group = new THREE.Group();

  // Create the ring as a circle in the XZ plane (y=0)
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

  // Add label at edge of ring
  const label = createEraLabelSprite(ring.label, ring.radius);
  group.add(label);

  return group;
}

/**
 * Generate all era ring scene objects.
 */
function generateEraRingObjects(): CustomSceneObject[] {
  const rings = generateEraRings();

  return rings.map((ring) => ({
    id: ring.id,
    object: createEraRingObject(ring),
  }));
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
  /** Show translucent era shells with labels (default: true) */
  showEraShells?: boolean;
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
  showEraShells = true,
}: StudentAncestryGraphProps) {
  // Process data for radial layout with target radius per node
  const graphData = useMemo(() => processDataForStudentAncestry(data), [data]);

  // Create forces for radial constraint, collision prevention, and Y-plane constraint
  const forces = useMemo((): ForceConfig[] => {
    // Collision force: prevents nodes from overlapping
    const collideForce = forceCollide3d(NODE_COLLISION_RADIUS);

    // Link force: per-link strength based on predicate type
    // student_of/trained_under pull nodes together
    // associated_with has light strength (cluster contemporaries angularly)
    const linkForce = forceLink3d(graphData.links)
      // biome-ignore lint/suspicious/noExplicitAny: d3-force-3d types are complex
      .id((node: any) => node.id)
      .strength(createLinkStrengthResolver(DEFAULT_LINK_FORCE_STRENGTH))
      .distance(DEFAULT_LINK_DISTANCE);

    // Radial constraint force: pin nodes to y=0 plane AND fix radial distance
    // This converts all forces to angular-only movement on the XZ plane
    // Nodes can slide around their era ring but cannot move closer/further from center
    const radialForce = createRadialForce({
      strength: 1.0, // Hard constraint for ancestry graph
      constrainToPlane: true, // 2D layout on XZ plane
      onlyTemporalNodes: false, // All nodes get positioned
    });

    return [
      { name: 'collide', force: collideForce },
      { name: 'link', force: linkForce },
      { name: 'radial', force: radialForce }, // Runs last: fixes y=0 and radial distance
    ];
  }, [graphData.links]);

  // Generate era ring scene objects (concentric circles with labels)
  const eraRingObjects = useMemo(() => {
    if (!showEraShells) return undefined;
    return generateEraRingObjects();
  }, [showEraShells]);

  // Initial camera position: 45 degrees above the XZ plane
  // Distance of 300 units, at 45° angle: y = distance * sin(45°), xz = distance * cos(45°)
  const initialCameraPosition = useMemo(() => {
    const distance = 300;
    const angle = Math.PI / 4; // 45 degrees in radians
    return {
      x: distance * Math.cos(angle),
      y: distance * Math.sin(angle),
      z: distance * Math.cos(angle),
    };
  }, []);

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={forces}
      customSceneObjects={eraRingObjects}
      initialCameraPosition={initialCameraPosition}
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
