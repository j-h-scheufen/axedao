/**
 * Core 3D graph visualization components and utilities.
 */

export { ForceGraph3DWrapper } from './ForceGraph3DWrapper';
export { useGraphCamera } from './useGraphCamera';
export { createDefaultNodeObject, createTextSprite, getNodeColor, getNodeLabel } from './nodeRenderers';
export { getDefaultLinkStyle, getLinkColor, getMinimalLinkStyle } from './linkRenderers';

// Temporal layout utilities
export {
  // Configuration constants
  BIRTH_YEAR_OFFSET,
  DEFAULT_LINK_DISTANCE,
  DEFAULT_LINK_FORCE_STRENGTH,
  ERA_BAND_RADIUS,
  ERA_CONFIG,
  MIN_RADIUS,
  MODERN_DECADE_RADIUS,
  // Computation functions
  computeNodeTargetRadius,
  computeRadialDistanceForEntityYear,
  computeRadialDistanceForYear,
  // Force factories
  createLinkStrengthResolver,
  createRadialForce,
  // Utility functions
  getEraBand,
  getNodeYear,
  // Link processing utilities
  DEFAULT_INVISIBLE_PREDICATES,
  DEFAULT_REVERSED_PREDICATES,
  processLink,
  processLinks,
} from './temporalLayout';

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

export type { LinkProcessingConfig, RadialForceConfig, TemporalForceNode } from './temporalLayout';
