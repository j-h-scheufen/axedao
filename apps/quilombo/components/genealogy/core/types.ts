/**
 * Core types for 3D graph visualization components.
 */

import type * as THREE from 'three';

import type { GraphLink, GraphNode } from '@/components/genealogy/types';

/**
 * Extended node type with force simulation properties.
 */
export interface ForceNode extends GraphNode {
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

/**
 * Extended link type with resolved source/target references.
 */
export interface ForceLink extends Omit<GraphLink, 'source' | 'target'> {
  source: string | ForceNode;
  target: string | ForceNode;
}

/**
 * Internal graph data structure for force simulation.
 */
export interface ForceGraphData {
  nodes: ForceNode[];
  links: ForceLink[];
}

/**
 * Camera position in 3D space.
 */
export interface CameraPosition {
  x: number;
  y: number;
  z: number;
}

/**
 * Camera configuration for initial view.
 */
export interface CameraConfig {
  position?: CameraPosition;
  lookAt?: CameraPosition;
  transitionDuration?: number;
}

/**
 * Link visual style configuration.
 */
export interface LinkStyle {
  color?: string;
  width?: number;
  opacity?: number;
  curvature?: number;
  arrowLength?: number;
  particles?: number;
  particleWidth?: number;
  particleSpeed?: number;
}

/**
 * Node renderer function type.
 */
export type NodeRenderer = (node: ForceNode, isSelected: boolean) => THREE.Object3D;

/**
 * Link style resolver function type.
 */
export type LinkStyleResolver = (link: ForceLink) => LinkStyle;

/**
 * Force configuration for d3-force-3d.
 */
export interface ForceConfig {
  name: string;
  // biome-ignore lint/suspicious/noExplicitAny: d3-force types are complex
  force: any;
}

/**
 * Custom scene objects to add to the 3D scene.
 * These are added once when the graph initializes.
 */
export interface CustomSceneObject {
  /** Unique identifier for the object (for cleanup/updates) */
  id: string;
  /** The Three.js object to add to the scene */
  object: THREE.Object3D;
}

/**
 * Props for the base ForceGraph3DWrapper component.
 */
export interface ForceGraph3DWrapperProps {
  /** Processed graph data ready for visualization */
  graphData: ForceGraphData;

  /** Currently selected node ID */
  selectedNodeId?: string | null;

  /** Callback when a node is clicked */
  onNodeClick?: (node: ForceNode) => void;

  /** Callback when background is clicked */
  onBackgroundClick?: () => void;

  /** Custom node renderer */
  nodeRenderer?: NodeRenderer;

  /** Custom link style resolver */
  linkStyleResolver?: LinkStyleResolver;

  /** Additional forces to apply */
  forces?: ForceConfig[];

  /** Custom Three.js objects to add to the scene (e.g., era shells, guides) */
  customSceneObjects?: CustomSceneObject[];

  /** Whether to auto-fit graph on load */
  autoFitOnLoad?: boolean;

  /** Auto-fit delay in ms */
  autoFitDelay?: number;

  /** Auto-fit padding */
  autoFitPadding?: number;

  /** Background color */
  backgroundColor?: string;

  /** Fixed width (auto-sizes if not provided) */
  width?: number;

  /** Fixed height (auto-sizes if not provided) */
  height?: number;

  /** Simulation cooldown ticks */
  cooldownTicks?: number;

  /** Simulation alpha decay rate */
  d3AlphaDecay?: number;

  /** Simulation velocity decay rate */
  d3VelocityDecay?: number;

  /** Show link directional particles */
  showLinkParticles?: boolean;

  /** Show link directional arrows */
  showLinkArrows?: boolean;
}
