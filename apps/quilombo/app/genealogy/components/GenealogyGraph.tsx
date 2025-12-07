'use client';

import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import ForceGraph3D, { type ForceGraphMethods } from 'react-force-graph-3d';
import * as THREE from 'three';
import { forceRadial } from 'd3-force-3d';

import type { GraphData, GraphLink, GraphNode, GroupMetadata, PersonMetadata } from '../types';
import { LINK_COLORS, NODE_COLORS, PREDICATE_LABELS } from '../types';

/** Visual indicator opacity for nodes without known dates */
const UNKNOWN_DATE_OPACITY = 0.6;

// ============================================================================
// RADIAL TEMPORAL LAYOUT CONSTANTS
// ============================================================================

/** Center year for the radial layout (oldest mestres) */
const CENTER_YEAR = 1890;

/** Distance units per decade from center */
const DECADE_RADIUS = 100;

/** Year to use for nodes without temporal data (outer shell) */
const UNKNOWN_YEAR_RADIUS = 2010;

interface GenealogyGraphProps {
  data: GraphData;
  selectedNodeId: string | null;
  onNodeClick: (node: GraphNode) => void;
  onBackgroundClick: () => void;
  width?: number;
  height?: number;
}

// Type for the internal graph data format used by ForceGraph3D
interface InternalNode extends GraphNode {
  x?: number;
  y?: number;
  z?: number;
  vx?: number;
  vy?: number;
  vz?: number;
  fx?: number;
  fy?: number;
  fz?: number;
  /** Whether this node has known temporal data */
  hasTemporalData?: boolean;
}

interface InternalLink extends Omit<GraphLink, 'source' | 'target'> {
  source: string | InternalNode;
  target: string | InternalNode;
}

interface InternalGraphData {
  nodes: InternalNode[];
  links: InternalLink[];
}

/**
 * Get node color based on type and style/title.
 */
function getNodeColor(node: GraphNode): string {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    const title = metadata.title as keyof (typeof NODE_COLORS)['person'] | undefined;
    return title && NODE_COLORS.person[title] ? NODE_COLORS.person[title] : NODE_COLORS.person.default;
  }

  if (node.type === 'group') {
    const metadata = node.metadata as GroupMetadata;
    const style = metadata.style as keyof (typeof NODE_COLORS)['group'] | undefined;
    return style && NODE_COLORS.group[style] ? NODE_COLORS.group[style] : NODE_COLORS.group.default;
  }

  return '#868E96';
}

/**
 * Get link color based on predicate type.
 */
function getLinkColor(link: InternalLink): string {
  const predicate = link.type as keyof typeof LINK_COLORS;
  return LINK_COLORS[predicate] || LINK_COLORS.default;
}

/**
 * Create a text sprite for labels.
 * Uses depthTest: false and high renderOrder to ensure labels render on top of links.
 */
function createTextSprite(
  text: string,
  fontSize: number = 12,
  textColor: string = 'white',
  backgroundColor?: string
): THREE.Sprite {
  const canvas = document.createElement('canvas');
  const context = canvas.getContext('2d') as CanvasRenderingContext2D;

  // Set canvas size based on text
  context.font = `bold ${fontSize * 4}px Arial`;
  const metrics = context.measureText(text);
  const textWidth = metrics.width;

  canvas.width = textWidth + 20;
  canvas.height = fontSize * 6;

  // Draw background if specified (for link labels)
  if (backgroundColor) {
    context.fillStyle = backgroundColor;
    context.globalAlpha = 0.7;
    context.fillRect(0, 0, canvas.width, canvas.height);
    context.globalAlpha = 1.0;
  }

  // Draw text
  context.font = `bold ${fontSize * 4}px Arial`;
  context.fillStyle = textColor;
  context.textAlign = 'center';
  context.textBaseline = 'middle';
  context.fillText(text, canvas.width / 2, canvas.height / 2);

  const texture = new THREE.CanvasTexture(canvas);
  texture.needsUpdate = true;

  const material = new THREE.SpriteMaterial({
    map: texture,
    transparent: true,
    depthTest: false, // Always render on top of other objects
    depthWrite: false, // Don't write to depth buffer
  });

  const sprite = new THREE.Sprite(material);
  sprite.scale.set(canvas.width / 10, canvas.height / 10, 1);
  sprite.renderOrder = 999; // Ensure labels render last (on top of links)

  return sprite;
}

/**
 * Get display label for a node (title + apelido for persons, name for groups).
 */
function getNodeLabel(node: GraphNode): string {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    const title = metadata.title ? metadata.title.charAt(0).toUpperCase() + metadata.title.slice(1) : '';
    const apelido = metadata.apelido || node.name;
    return title ? `${title} ${apelido}` : apelido;
  }
  return node.name;
}

// ============================================================================
// TEMPORAL POSITIONING HELPERS
// ============================================================================

/**
 * Get the temporal year for a node (birthYear for persons, foundedYear for groups).
 * Returns null if no temporal data is available.
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
 * Compute spherical coordinates for radial temporal layout.
 * Oldest mestres at center, each decade expands outward as a spherical shell.
 */
function computeRadialPosition(year: number | null): { x: number; y: number; z: number; radius: number } {
  const effectiveYear = year ?? UNKNOWN_YEAR_RADIUS;
  const decadesFromCenter = (effectiveYear - CENTER_YEAR) / 10;
  const radius = Math.max(10, decadesFromCenter * DECADE_RADIUS); // Minimum radius of 10

  // Random spherical distribution for initial position
  // theta = azimuthal angle (0 to 2π), phi = polar angle (0 to π)
  const theta = Math.random() * 2 * Math.PI;
  const phi = Math.acos(2 * Math.random() - 1); // Uniform distribution on sphere

  return {
    x: radius * Math.sin(phi) * Math.cos(theta),
    y: radius * Math.sin(phi) * Math.sin(theta),
    z: radius * Math.cos(phi),
    radius,
  };
}

/**
 * Pre-process graph data for radial temporal layout.
 * - Filters to persons only (no groups)
 * - Filters to student_of relationships only
 * - Positions nodes on spherical shells by birth decade
 */
function processGraphDataForRadialLayout(data: GraphData): InternalGraphData {
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
  const processedNodes: InternalNode[] = personNodes.map((node) => {
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
    links: studentOfLinks as InternalLink[],
  };
}

/**
 * 3D Force-directed graph visualization for genealogy data.
 */
export function GenealogyGraph({
  data,
  selectedNodeId,
  onNodeClick,
  onBackgroundClick,
  width,
  height,
}: GenealogyGraphProps) {
  const graphRef = useRef<ForceGraphMethods<InternalNode, InternalLink> | undefined>(undefined);
  const containerRef = useRef<HTMLDivElement>(null);
  const [dimensions, setDimensions] = useState({ width: width || 800, height: height || 600 });

  // Handle resize
  useEffect(() => {
    if (width && height) {
      setDimensions({ width, height });
      return;
    }

    const updateDimensions = () => {
      if (containerRef.current) {
        const rect = containerRef.current.getBoundingClientRect();
        setDimensions({
          width: rect.width || 800,
          height: rect.height || 600,
        });
      }
    };

    updateDimensions();
    window.addEventListener('resize', updateDimensions);
    return () => window.removeEventListener('resize', updateDimensions);
  }, [width, height]);

  // Process graph data for radial temporal layout (persons + student_of only)
  const graphData = useMemo(() => processGraphDataForRadialLayout(data), [data]);

  // Apply radial force to keep nodes at their temporal shell
  useEffect(() => {
    if (!graphRef.current) return;

    // Create radial force that pulls nodes toward their birth-year shell
    // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
    const radialForce = forceRadial<any>()
      .radius((node: InternalNode) => {
        const year = getNodeYear(node);
        const effectiveYear = year ?? UNKNOWN_YEAR_RADIUS;
        const decadesFromCenter = (effectiveYear - CENTER_YEAR) / 10;
        return Math.max(10, decadesFromCenter * DECADE_RADIUS);
      })
      .strength(0.8); // Strong pull to maintain spherical shells

    // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
    graphRef.current.d3Force('radial', radialForce as any);

    // Weaken the centering force so radial force dominates
    const centerForce = graphRef.current.d3Force('center');
    if (centerForce) {
      // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
      (centerForce as any).strength?.(0.01);
    }

    // Adjust charge to spread nodes on their shells
    const chargeForce = graphRef.current.d3Force('charge');
    if (chargeForce) {
      // biome-ignore lint/suspicious/noExplicitAny: d3-force types don't align with react-force-graph internal types
      (chargeForce as any).strength(-50);
    }

    graphRef.current.d3ReheatSimulation();
  }, []);

  // Zoom to fit graph after initial load
  useEffect(() => {
    if (!graphRef.current) return;

    const timer = setTimeout(() => {
      graphRef.current?.zoomToFit(1000, 50);
    }, 800);

    return () => clearTimeout(timer);
  }, []);

  // Center camera on clicked node - maintain current viewing angle, just reposition
  const handleNodeClick = useCallback(
    (node: InternalNode) => {
      if (graphRef.current && node.x !== undefined && node.y !== undefined && node.z !== undefined) {
        const cameraDistance = 300; // Fixed distance from node to camera

        // Get current camera position to maintain viewing angle
        // Note: cameraPosition() with no args is a getter that returns current position,
        // but the TypeScript types only show the setter signature
        const currentPos = (
          graphRef.current as unknown as { cameraPosition: () => { x: number; y: number; z: number } }
        ).cameraPosition();

        // Calculate direction vector from node to current camera
        const dirX = currentPos.x - node.x;
        const dirY = currentPos.y - node.y;
        const dirZ = currentPos.z - node.z;
        const dirLength = Math.hypot(dirX, dirY, dirZ);

        let newPos: { x: number; y: number; z: number };

        if (dirLength > 0.1) {
          // Normalize direction and place camera at fixed distance from node
          const scale = cameraDistance / dirLength;
          newPos = {
            x: node.x + dirX * scale,
            y: node.y + dirY * scale,
            z: node.z + dirZ * scale,
          };
        } else {
          // Camera is on top of node, default to z-axis offset
          newPos = { x: node.x, y: node.y, z: node.z + cameraDistance };
        }

        graphRef.current.cameraPosition(
          newPos, // new camera position
          { x: node.x, y: node.y, z: node.z }, // lookAt target
          1500 // ms transition duration
        );
      }
      onNodeClick(node);
    },
    [onNodeClick]
  );

  const handleBackgroundClick = useCallback(() => {
    onBackgroundClick();
  }, [onBackgroundClick]);

  // Custom node object: sphere with text label underneath
  const nodeThreeObject = useCallback(
    (node: InternalNode) => {
      const color = getNodeColor(node);
      const isSelected = node.id === selectedNodeId;
      const sphereRadius = node.type === 'group' ? 6 : 4;
      const hasTemporalData = node.hasTemporalData !== false; // Default to true if undefined

      // Create a group to hold sphere and label
      const group = new THREE.Group();

      // Create sphere - reduce opacity for nodes without temporal data
      const geometry = new THREE.SphereGeometry(sphereRadius, 16, 16);
      const baseOpacity = hasTemporalData ? 0.85 : UNKNOWN_DATE_OPACITY;
      const material = new THREE.MeshLambertMaterial({
        color: color,
        transparent: true,
        opacity: isSelected ? 1.0 : baseOpacity,
      });
      const sphere = new THREE.Mesh(geometry, material);

      // Add emissive glow for selected node
      if (isSelected) {
        const glowMaterial = new THREE.MeshBasicMaterial({
          color: 0xffffff,
          transparent: true,
          opacity: 0.3,
        });
        const glowSphere = new THREE.Mesh(new THREE.SphereGeometry(sphereRadius * 1.3, 16, 16), glowMaterial);
        group.add(glowSphere);
      }

      // Add dashed ring indicator for nodes without temporal data
      if (!hasTemporalData) {
        const ringGeometry = new THREE.RingGeometry(sphereRadius * 1.4, sphereRadius * 1.6, 16);
        const ringMaterial = new THREE.MeshBasicMaterial({
          color: 0xffffff,
          transparent: true,
          opacity: 0.4,
          side: THREE.DoubleSide,
        });
        const ring = new THREE.Mesh(ringGeometry, ringMaterial);
        group.add(ring);
      }

      group.add(sphere);

      // Create text label
      const label = getNodeLabel(node);
      const textSprite = createTextSprite(label, 10);
      textSprite.position.set(0, -(sphereRadius + 5), 0); // Position below sphere
      group.add(textSprite);

      return group;
    },
    [selectedNodeId]
  );

  // Custom link object: render label at midpoint (disabled for now, enable later)
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const _linkThreeObject = useCallback((link: InternalLink) => {
    const label = PREDICATE_LABELS[link.type as keyof typeof PREDICATE_LABELS] || link.type;
    const color = getLinkColor(link);
    const sprite = createTextSprite(label, 8, 'white', color);
    return sprite;
  }, []);

  // Position link label at the midpoint of the link (disabled for now, enable later)
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const _linkPositionUpdate = useCallback(
    (
      obj: THREE.Object3D,
      { start, end }: { start: { x: number; y: number; z: number }; end: { x: number; y: number; z: number } }
    ) => {
      const middlePos = {
        x: start.x + (end.x - start.x) / 2,
        y: start.y + (end.y - start.y) / 2,
        z: start.z + (end.z - start.z) / 2,
      };
      obj.position.set(middlePos.x, middlePos.y, middlePos.z);
    },
    []
  );

  return (
    <div ref={containerRef} className="h-full w-full" style={{ minHeight: 400 }}>
      <ForceGraph3D
        ref={graphRef}
        graphData={graphData}
        width={dimensions.width}
        height={dimensions.height}
        // Node configuration
        nodeId="id"
        nodeLabel={(node: InternalNode) => `${node.name} (${node.type})`}
        nodeThreeObject={nodeThreeObject}
        nodeThreeObjectExtend={false}
        // Link configuration
        linkColor={getLinkColor}
        linkWidth={1.5}
        linkOpacity={0.6}
        linkDirectionalArrowLength={3}
        linkDirectionalArrowRelPos={1}
        linkDirectionalParticles={1}
        linkDirectionalParticleWidth={2}
        linkDirectionalParticleSpeed={0.005}
        // Link labels disabled for now - enable with: linkThreeObject, linkThreeObjectExtend, linkPositionUpdate
        // Interaction
        onNodeClick={handleNodeClick}
        onBackgroundClick={handleBackgroundClick}
        // Layout
        cooldownTicks={100}
        d3AlphaDecay={0.02}
        d3VelocityDecay={0.3}
        // Performance
        enableNavigationControls
        showNavInfo={false}
        // Background
        backgroundColor="#1a1a2e"
      />
    </div>
  );
}

export default GenealogyGraph;
