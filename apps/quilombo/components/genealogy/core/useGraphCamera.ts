/**
 * Camera control hook for 3D graph visualization.
 *
 * Provides utilities for camera positioning, zoom, and navigation.
 */

import { useCallback } from 'react';
import type { ForceGraphMethods } from 'react-force-graph-3d';

import type { CameraPosition, ForceLink, ForceNode } from './types';

type GraphRef = ForceGraphMethods<ForceNode, ForceLink> | undefined;

/**
 * Hook for graph camera controls.
 */
export function useGraphCamera(graphRef: React.RefObject<GraphRef>) {
  /**
   * Get current camera position.
   */
  const getCameraPosition = useCallback((): CameraPosition | null => {
    if (!graphRef.current) return null;

    // cameraPosition() with no args is a getter
    const pos = (graphRef.current as unknown as { cameraPosition: () => CameraPosition }).cameraPosition();
    return pos;
  }, [graphRef]);

  /**
   * Move camera to a specific position.
   */
  const moveCameraTo = useCallback(
    (position: CameraPosition, lookAt?: CameraPosition, transitionMs: number = 1000) => {
      if (!graphRef.current) return;

      graphRef.current.cameraPosition(position, lookAt || { x: 0, y: 0, z: 0 }, transitionMs);
    },
    [graphRef]
  );

  /**
   * Focus camera on a specific node, maintaining current viewing angle.
   */
  const focusOnNode = useCallback(
    (node: ForceNode, distance: number = 300, transitionMs: number = 1500) => {
      if (!graphRef.current) return;
      if (node.x === undefined || node.y === undefined || node.z === undefined) return;

      const currentPos = getCameraPosition();
      if (!currentPos) return;

      // Calculate direction vector from node to current camera
      const dirX = currentPos.x - node.x;
      const dirY = currentPos.y - node.y;
      const dirZ = currentPos.z - node.z;
      const dirLength = Math.hypot(dirX, dirY, dirZ);

      let newPos: CameraPosition;

      if (dirLength > 0.1) {
        // Normalize direction and place camera at fixed distance from node
        const scale = distance / dirLength;
        newPos = {
          x: node.x + dirX * scale,
          y: node.y + dirY * scale,
          z: node.z + dirZ * scale,
        };
      } else {
        // Camera is on top of node, default to z-axis offset
        newPos = { x: node.x, y: node.y, z: node.z + distance };
      }

      graphRef.current.cameraPosition(newPos, { x: node.x, y: node.y, z: node.z }, transitionMs);
    },
    [graphRef, getCameraPosition]
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
   * Reset camera to default position (looking at origin from z-axis).
   */
  const resetCamera = useCallback(
    (distance: number = 500, transitionMs: number = 1000) => {
      if (!graphRef.current) return;
      graphRef.current.cameraPosition({ x: 0, y: 0, z: distance }, { x: 0, y: 0, z: 0 }, transitionMs);
    },
    [graphRef]
  );

  return {
    getCameraPosition,
    moveCameraTo,
    focusOnNode,
    zoomToFit,
    resetCamera,
  };
}
