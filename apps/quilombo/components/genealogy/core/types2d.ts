/**
 * Core types for 2D graph visualization components.
 * Used for the student-ancestry view with canvas-based rendering.
 */

import type { GraphLink, GraphNode } from '@/components/genealogy/types';
import type { TemporalLayout } from './temporalLayout';

/**
 * Extended node type with 2D force simulation properties.
 * No z-axis properties compared to 3D version.
 */
export interface ForceNode2D extends GraphNode {
  x?: number;
  y?: number;
  vx?: number;
  vy?: number;
  fx?: number;
  fy?: number;
  /** Whether this node has known temporal data */
  hasTemporalData?: boolean;
  /** Target radius for radial force layout */
  targetRadius?: number;
}

/**
 * Extended link type with resolved source/target references (2D version).
 */
export interface ForceLink2D extends Omit<GraphLink, 'source' | 'target'> {
  source: string | ForceNode2D;
  target: string | ForceNode2D;
  /**
   * If true, link participates in force simulation but is not rendered.
   * Useful for creating gravitational clustering without visual connections.
   */
  invisible?: boolean;
}

/**
 * Internal graph data structure for 2D force simulation.
 */
export interface ForceGraphData2D {
  nodes: ForceNode2D[];
  links: ForceLink2D[];
}

/**
 * Camera/zoom state in 2D space.
 * Matches d3-zoom transform: { k: scale, x: translateX, y: translateY }
 */
export interface CameraState2D {
  /** Zoom scale factor (1 = 100%, 2 = 200%, etc.) */
  k: number;
  /** X translation (pan offset) */
  x: number;
  /** Y translation (pan offset) */
  y: number;
}

/**
 * 2D node renderer function type.
 * Draws directly to canvas context.
 */
export type NodeRenderer2D = (
  node: ForceNode2D,
  ctx: CanvasRenderingContext2D,
  globalScale: number,
  isSelected: boolean,
  isDimmed: boolean
) => void;

/**
 * Canvas background renderer for era rings, guides, etc.
 * Called before nodes/links are rendered.
 */
export type CanvasBackgroundRenderer = (ctx: CanvasRenderingContext2D, globalScale: number) => void;

/**
 * Force configuration for d3-force (2D).
 * Same structure as 3D but uses 2D forces.
 */
export interface ForceConfig2D {
  name: string;
  // biome-ignore lint/suspicious/noExplicitAny: d3-force types are complex
  force: any;
}

/**
 * Configuration for customizing the built-in link force (2D).
 */
export interface LinkForceConfig2D {
  /**
   * Link force distance - how far apart linked nodes want to be.
   */
  distance?: number | ((link: ForceLink2D) => number);

  /**
   * Link force strength - how strongly links pull nodes together.
   */
  strength?: number | ((link: ForceLink2D) => number);
}

/**
 * Props for the ForceGraph2DWrapper component.
 */
export interface ForceGraph2DWrapperProps {
  /** Processed graph data ready for visualization */
  graphData: ForceGraphData2D;

  /** Currently selected node ID */
  selectedNodeId?: string | null;

  /**
   * Set of node IDs to highlight (for lineage highlighting).
   * When provided, nodes NOT in this set will be dimmed.
   */
  highlightedNodeIds?: ReadonlySet<string>;

  /**
   * Whether to auto-focus camera on selected node when selectedNodeId changes.
   * Default: true
   */
  focusOnSelection?: boolean;

  /** Callback when a node is clicked */
  onNodeClick?: (node: ForceNode2D) => void;

  /** Callback when background is clicked */
  onBackgroundClick?: () => void;

  /** Custom node renderer (optional, uses default if not provided) */
  nodeRenderer?: NodeRenderer2D;

  /** Additional forces to apply */
  forces?: ForceConfig2D[];

  /**
   * Temporal layout for era ring rendering.
   * When provided, era rings are drawn as background.
   */
  eraRingsLayout?: TemporalLayout;

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

  /** Simulation warmup ticks */
  warmupTicks?: number;

  /** Simulation cooldown ticks */
  cooldownTicks?: number;

  /** Simulation alpha decay rate */
  d3AlphaDecay?: number;

  /** Simulation velocity decay rate */
  d3VelocityDecay?: number;

  /** Show link directional arrows */
  showLinkArrows?: boolean;

  /** Configuration for the library's built-in link force */
  linkForceConfig?: LinkForceConfig2D;

  /**
   * Scale factor for node sizes.
   * Use values > 1 for larger touch targets on mobile.
   * Default: 1.0
   */
  nodeScale?: number;
}
