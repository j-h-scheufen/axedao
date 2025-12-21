/**
 * Core graph visualization components and utilities.
 *
 * 3D components (ForceGraph3DWrapper) for general view
 * 2D components (ForceGraph2DWrapper) for student-ancestry view
 */

// 3D graph components
export { ForceGraph3DWrapper } from './ForceGraph3DWrapper';
export { useGraphCamera } from './useGraphCamera';
export { createDefaultNodeObject, createTextSprite, getNodeColor, getNodeLabel } from './nodeRenderers';
export { getDefaultLinkStyle, getLinkColor, getMinimalLinkStyle } from './linkRenderers';

// 2D graph components
export { ForceGraph2DWrapper } from './ForceGraph2DWrapper';
export { useGraphCamera2D } from './useGraphCamera2D';
export {
  drawNode2D,
  createNodeCanvasObject,
  getNodeColor as getNodeColor2D,
  getNodeLabel as getNodeLabel2D,
} from './nodeRenderers2D';
export { drawEraRings2D, createEraRingsRenderer } from './eraRings2D';

// Temporal layout utilities
export {
  // Configuration
  DEFAULT_TEMPORAL_LAYOUT_CONFIG,
  // Factory
  createTemporalLayout,
  // Constants
  BIRTH_YEAR_OFFSET,
  ERA_CONFIG,
  // Computation functions (deprecated - use createTemporalLayout)
  computeNodeTargetRadius,
  computeRadialDistanceForEntityYear,
  computeRadialDistanceForYear,
  // Force factories
  createLinkStrengthResolver,
  createRadialForce,
  createRadialForce2D,
  // Utility functions
  getEraBand,
  getNodeYear,
  // Link processing utilities
  DEFAULT_INVISIBLE_PREDICATES,
  DEFAULT_REVERSED_PREDICATES,
  processLink,
  processLinks,
} from './temporalLayout';

// 3D types
export type {
  CameraConfig,
  CameraPosition,
  CustomSceneObject,
  ForceConfig,
  ForceGraph3DWrapperProps,
  ForceGraphData,
  ForceLink,
  ForceNode,
  LinkForceConfig,
  LinkStyle,
  LinkStyleResolver,
  NodeRenderer,
} from './types';

// 2D types
export type {
  CameraState2D,
  ForceConfig2D,
  ForceGraph2DWrapperProps,
  ForceGraphData2D,
  ForceLink2D,
  ForceNode2D,
  LinkForceConfig2D,
  NodeRenderer2D,
} from './types2d';

// Temporal layout types
export type {
  LinkProcessingConfig,
  RadialForceConfig,
  RadialForceConfig2D,
  TemporalForceNode,
  TemporalForceNode2D,
  TemporalLayout,
  TemporalLayoutConfig,
} from './temporalLayout';
