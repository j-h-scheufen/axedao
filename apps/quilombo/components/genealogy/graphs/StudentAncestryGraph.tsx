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

import type { GraphData, GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import {
  ForceGraph3DWrapper,
  type CustomSceneObject,
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

/**
 * Link force strength by predicate type.
 * - student_of/trained_under: Zero strength to prevent pulling across generations
 * - associated_with: Low strength for angular clustering of contemporaries
 */
const LINK_FORCE_STRENGTH_BY_TYPE: Record<string, number> = {
  student_of: 0.6,
  trained_under: 0.4,
  associated_with: 0.025,
  influenced_by: 0.02,
  default: 0, // Very light default
};

/** Distance for link force - how far apart linked nodes want to be */
const LINK_FORCE_DISTANCE = 30;

/**
 * Years to add to birth year for positioning.
 * Capoeiristas typically started training around age 10-15, so we offset
 * to show them in the era when they were actively practicing.
 */
const BIRTH_YEAR_OFFSET = 10;

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
const MIN_RADIUS = 20;

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
 * Compute the radial distance for a given calendar year (no offset applied).
 * Used for drawing era rings at their actual decade positions.
 *
 * Uses continuous proportional placement within each era band:
 * - Foundation eras (pre-1900): Proportional within 50-year bands
 * - Modern era (1900+): Proportional within 10-year decades
 */
function computeRadialDistanceForYear(year: number): number {
  // Foundation eras (pre-1900)
  for (const era of ERA_CONFIG.foundation) {
    if (year >= era.startYear && year <= era.endYear) {
      const bandStartRadius = MIN_RADIUS + era.band * ERA_BAND_RADIUS;
      const bandEndRadius = MIN_RADIUS + (era.band + 1) * ERA_BAND_RADIUS;

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

  // Modern era (1900+) - proportional within decades
  const decadesSince1900 = (year - ERA_CONFIG.modernStartYear) / 10;
  const foundationRadius = MIN_RADIUS + ERA_CONFIG.modernStartBand * ERA_BAND_RADIUS;
  return foundationRadius + decadesSince1900 * MODERN_DECADE_RADIUS;
}

/**
 * Compute the radial distance for a given birth year using PROPORTIONAL placement.
 *
 * Applies BIRTH_YEAR_OFFSET to position nodes at their "active capoeira years"
 * rather than birth year (capoeiristas typically started training around age 10-15).
 *
 * Example: birth year 1889 + 10 offset = 1899 → placed near the END of band 2 (1850-1899),
 * very close to the 1900s ring, not at the start of band 2.
 */
function computeRadialDistanceForBirthYear(birthYear: number | null): number {
  // Apply offset to convert birth year to "active capoeira year"
  const effectiveYear = birthYear !== null ? birthYear + BIRTH_YEAR_OFFSET : ERA_CONFIG.unknownYear;
  return computeRadialDistanceForYear(effectiveYear);
}

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
  const radius = computeRadialDistanceForBirthYear(birthYear);
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
  // Include: student_of, trained_under (visible)
  // Include: associated_with (invisible - for gravity/clustering only)
  const personIds = new Set(personNodes.map((n) => n.id));

  // Predicates that create visible connections (teaching lineage)
  const VISIBLE_PREDICATES = new Set(['student_of', 'trained_under']);
  // Predicates that create invisible connections (gravity/clustering only)
  const GRAVITY_ONLY_PREDICATES = new Set(['associated_with', 'influenced_by']);

  const ancestryLinks = data.links
    .filter((link) => {
      // Check if this is a lineage-relevant relationship
      if (!VISIBLE_PREDICATES.has(link.type) && !GRAVITY_ONLY_PREDICATES.has(link.type)) {
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

      // Mark gravity-only links as invisible
      const invisible = GRAVITY_ONLY_PREDICATES.has(link.type);

      // Swap source/target for student_of and trained_under so arrows/particles flow from teacher to student
      // (data model: student -> teacher, but visually we want: teacher -> student)
      if (VISIBLE_PREDICATES.has(link.type)) {
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
    });

  // Process nodes with initial positions and target radius
  // Initial positions spread nodes on their target shells; force simulation will adjust
  const totalNodes = personNodes.length;
  const processedNodes: AncestryForceNode[] = personNodes.map((node, index) => {
    const year = getNodeYear(node);
    const targetRadius = computeRadialDistanceForBirthYear(year);
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
    // student_of/trained_under have zero strength (don't pull across generations)
    // associated_with has light strength (cluster contemporaries angularly)
    const linkForce = forceLink3d(graphData.links)
      // biome-ignore lint/suspicious/noExplicitAny: d3-force-3d types are complex
      .id((node: any) => node.id)
      // biome-ignore lint/suspicious/noExplicitAny: d3-force-3d link type
      .strength((link: any) => {
        const linkType = link.type as string;
        return LINK_FORCE_STRENGTH_BY_TYPE[linkType] ?? LINK_FORCE_STRENGTH_BY_TYPE.default;
      })
      .distance(LINK_FORCE_DISTANCE);

    // Custom force: pin nodes to y=0 plane AND fix radial distance
    // This converts all forces to angular-only movement on the XZ plane
    // Nodes can slide around their era ring but cannot move closer/further from center
    const constrainForce = () => {
      // biome-ignore lint/suspicious/noExplicitAny: custom d3-force implementation
      const force: any = (_alpha: number) => {
        const nodes = force.nodes || [];
        for (const node of nodes) {
          // Pin to y=0 plane
          node.y = 0;
          node.vy = 0;

          // Fix radial distance: project position onto target radius circle
          const targetRadius = node.targetRadius ?? MIN_RADIUS;
          const currentRadius = Math.sqrt(node.x * node.x + node.z * node.z);

          if (currentRadius > 0.001) {
            // Scale position to target radius (preserves angle, fixes distance)
            const scale = targetRadius / currentRadius;
            node.x *= scale;
            node.z *= scale;

            // Also project velocity to be tangential only (remove radial component)
            // This allows nodes to slide around the ring but not move in/out
            const vRadial = (node.vx * node.x + node.vz * node.z) / currentRadius;
            const normalX = node.x / currentRadius;
            const normalZ = node.z / currentRadius;
            node.vx -= vRadial * normalX;
            node.vz -= vRadial * normalZ;
          } else {
            // Node at center - place at target radius with small random angle
            const angle = Math.random() * Math.PI * 2;
            node.x = targetRadius * Math.cos(angle);
            node.z = targetRadius * Math.sin(angle);
          }
        }
      };
      force.initialize = (nodes: AncestryForceNode[]) => {
        force.nodes = nodes;
      };
      force.nodes = [] as AncestryForceNode[];
      return force;
    };

    return [
      { name: 'collide', force: collideForce },
      { name: 'link', force: linkForce },
      { name: 'constrain', force: constrainForce() }, // Runs last: fixes y=0 and radial distance
    ];
  }, [graphData.links]);

  // Generate era ring scene objects (concentric circles with labels)
  const eraRingObjects = useMemo(() => {
    if (!showEraShells) return undefined;
    return generateEraRingObjects();
  }, [showEraShells]);

  return (
    <ForceGraph3DWrapper
      graphData={graphData}
      selectedNodeId={selectedNodeId}
      onNodeClick={onNodeClick}
      onBackgroundClick={onBackgroundClick}
      forces={forces}
      customSceneObjects={eraRingObjects}
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
