/**
 * Camera control hook for 2D graph visualization.
 *
 * Provides utilities for panning, zooming, and focusing on nodes.
 * Much simpler than 3D version - no vector math needed for screen-space offsets.
 */

import { useCallback } from 'react';
import type { ForceGraphMethods } from 'react-force-graph-2d';

import type { CameraState2D, ForceLink2D, ForceNode2D } from './types2d';

type GraphRef2D = ForceGraphMethods<ForceNode2D, ForceLink2D> | undefined;

/**
 * Hook for 2D graph camera controls.
 */
export function useGraphCamera2D(graphRef: React.RefObject<GraphRef2D>) {
  /**
   * Get current camera/zoom state.
   * Combines zoom level and center position.
   */
  const getCameraState = useCallback((): CameraState2D | null => {
    if (!graphRef.current) return null;

    // zoom() with no args returns the current zoom scale (number)
    const k = graphRef.current.zoom();
    // centerAt() with no args returns the current center position
    const center = graphRef.current.centerAt();

    if (k === undefined || !center) return null;

    return {
      k,
      x: center.x,
      y: center.y,
    };
  }, [graphRef]);

  /**
   * Get current zoom scale.
   */
  const getZoomScale = useCallback((): number => {
    const state = getCameraState();
    return state?.k ?? 1;
  }, [getCameraState]);

  /**
   * Pan to center on a specific point.
   */
  const centerAt = useCallback(
    (x: number, y: number, transitionMs: number = 1000) => {
      if (!graphRef.current) return;
      graphRef.current.centerAt(x, y, transitionMs);
    },
    [graphRef]
  );

  /**
   * Set zoom scale.
   */
  const zoom = useCallback(
    (scale: number, transitionMs: number = 1000) => {
      if (!graphRef.current) return;
      graphRef.current.zoom(scale, transitionMs);
    },
    [graphRef]
  );

  /**
   * Focus on a specific node with optional screen-space offset.
   *
   * In 2D, the offset is straightforward:
   * - offset.x > 0: node appears to the left (camera panned right)
   * - offset.y > 0: node appears higher (camera panned down)
   *
   * This is the inverse of where we want the node to appear, because
   * we're moving the camera, not the node.
   *
   * @param node The node to focus on
   * @param transitionMs Animation duration
   * @param offset Screen-space offset to shift where the node appears
   * @param zoomScale Target zoom scale (undefined = maintain current zoom)
   */
  const focusOnNode = useCallback(
    (node: ForceNode2D, transitionMs: number = 1000, offset: { x?: number; y?: number } = {}, zoomScale?: number) => {
      if (!graphRef.current) return;
      if (node.x === undefined || node.y === undefined) return;

      const offsetX = offset.x ?? 0;
      const offsetY = offset.y ?? 0;

      // Center on node position adjusted by offset
      // The offset is in graph-space units (will be scaled by zoom)
      const targetX = node.x + offsetX;
      const targetY = node.y + offsetY;

      graphRef.current.centerAt(targetX, targetY, transitionMs);

      // Optionally adjust zoom
      if (zoomScale !== undefined) {
        graphRef.current.zoom(zoomScale, transitionMs);
      }
    },
    [graphRef]
  );

  /**
   * Zoom to fit entire graph in view.
   */
  const zoomToFit = useCallback(
    (transitionMs: number = 1000, padding: number = 50) => {
      if (!graphRef.current) return;
      graphRef.current.zoomToFit(transitionMs, padding);
    },
    [graphRef]
  );

  /**
   * Reset camera to center (origin) with default zoom.
   */
  const resetCamera = useCallback(
    (transitionMs: number = 1000) => {
      if (!graphRef.current) return;
      graphRef.current.centerAt(0, 0, transitionMs);
      graphRef.current.zoom(1, transitionMs);
    },
    [graphRef]
  );

  return {
    getCameraState,
    getZoomScale,
    centerAt,
    zoom,
    focusOnNode,
    zoomToFit,
    resetCamera,
  };
}
