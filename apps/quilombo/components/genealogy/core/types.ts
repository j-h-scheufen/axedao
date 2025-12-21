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
  /**
   * If true, link participates in force simulation but is not rendered.
   * Useful for creating gravitational clustering without visual connections.
   */
  invisible?: boolean;
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

  /**
   * Set of node IDs to highlight (for lineage highlighting).
   * When provided, nodes NOT in this set will be dimmed.
   * Links connecting highlighted nodes will remain bright.
   */
  highlightedNodeIds?: ReadonlySet<string>;

  /**
   * Whether to auto-focus camera on selected node when selectedNodeId changes.
   * When true, camera will animate to focus on the newly selected node.
   * Default: true
   */
  focusOnSelection?: boolean;

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

  /** Auto-fit padding */
  autoFitPadding?: number;

  /** Background color */
  backgroundColor?: string;

  /** Fixed width (auto-sizes if not provided) */
  width?: number;

  /** Fixed height (auto-sizes if not provided) */
  height?: number;

  /** Simulation warmup ticks (pre-compute before rendering to reduce initial chaos) */
  warmupTicks?: number;

  /** Simulation cooldown ticks (stop simulation after this many rendered frames) */
  cooldownTicks?: number;

  /** Simulation alpha decay rate (higher = faster settling) */
  d3AlphaDecay?: number;

  /** Simulation velocity decay rate (higher = more friction = calmer motion) */
  d3VelocityDecay?: number;

  /** Show link directional particles */
  showLinkParticles?: boolean;

  /** Show link directional arrows */
  showLinkArrows?: boolean;

  /** Initial camera position (x, y, z coordinates) */
  initialCameraPosition?: CameraPosition;

  /**
   * Configuration for the library's built-in link force.
   * Use this to customize per-predicate strength/distance without replacing the force.
   */
  linkForceConfig?: LinkForceConfig;
}

/**
 * Configuration for customizing the built-in link force.
 * Applied to react-force-graph's internal link force after initialization.
 */
export interface LinkForceConfig {
  /**
   * Link force distance - how far apart linked nodes want to be.
   * Can be a number or a function that returns a number per link.
   */
  distance?: number | ((link: ForceLink) => number);

  /**
   * Link force strength - how strongly links pull nodes together.
   * Can be a number or a function that returns a number per link.
   * Use this for per-predicate strength (e.g., student_of: 0.6, member_of: 0.3).
   */
  strength?: number | ((link: ForceLink) => number);
}
