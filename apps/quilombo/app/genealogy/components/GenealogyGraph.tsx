'use client';

import { useCallback, useEffect, useRef, useState } from 'react';
import ForceGraph3D, { type ForceGraphMethods } from 'react-force-graph-3d';
import * as THREE from 'three';

import type { GraphData, GraphLink, GraphNode, GroupMetadata, PersonMetadata } from '../types';
import { LINK_COLORS, NODE_COLORS, PREDICATE_LABELS } from '../types';

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

      // Create a group to hold sphere and label
      const group = new THREE.Group();

      // Create sphere
      const geometry = new THREE.SphereGeometry(sphereRadius, 16, 16);
      const material = new THREE.MeshLambertMaterial({
        color: color,
        transparent: true,
        opacity: isSelected ? 1.0 : 0.85,
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

  // Transform data to internal format
  const graphData: InternalGraphData = {
    nodes: data.nodes as InternalNode[],
    links: data.links as InternalLink[],
  };

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
