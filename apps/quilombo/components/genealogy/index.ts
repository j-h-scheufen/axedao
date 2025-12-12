/**
 * Genealogy visualization components.
 *
 * Note: Graph components (StudentAncestryGraph, ForceGraph3DWrapper) use WebGL
 * and must be dynamically imported with { ssr: false } in pages.
 *
 * Example:
 *   const StudentAncestryGraph = dynamic(
 *     () => import('@/components/genealogy/graphs/StudentAncestryGraph'),
 *     { ssr: false }
 *   );
 */

// Types
export * from './types';

// UI components (SSR-safe)
export { GraphControls, GraphLegend, NodeDetailsPanel } from './ui';

// Core types (SSR-safe)
export type {
  CameraConfig,
  CameraPosition,
  ForceConfig,
  ForceGraph3DWrapperProps,
  ForceGraphData,
  ForceLink,
  ForceNode,
  LinkStyle,
  LinkStyleResolver,
  NodeRenderer,
} from './core';
