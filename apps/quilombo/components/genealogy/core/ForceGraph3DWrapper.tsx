'use client';

/**
 * Base wrapper component for react-force-graph-3d.
 *
 * Provides common configuration and utilities for 3D graph visualization.
 * Specialized graph views should use this as their foundation.
 */

import { useSetAtom } from 'jotai';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import ForceGraph3D, { type ForceGraphMethods } from 'react-force-graph-3d';

import { needsRefocusAtom, refocusCallbackAtom } from '@/components/genealogy/state';

import { createDefaultNodeObject } from './nodeRenderers';
import { getLinkColor } from './linkRenderers';
import { useGraphCamera } from './useGraphCamera';
import type { ForceGraph3DWrapperProps, ForceLink, ForceNode } from './types';

/**
 * Base wrapper for react-force-graph-3d with common configuration.
 *
 * Features:
 * - Auto-sizing to container
 * - Default node rendering with selection state
 * - Default link styling
 * - Camera controls via useGraphCamera hook
 * - Support for custom forces
 * - Auto-fit on load option
 */
/** Opacity multiplier for dimmed links (when highlighting lineage) */
const DIMMED_LINK_OPACITY = 0.1;

export function ForceGraph3DWrapper({
  graphData,
  selectedNodeId,
  highlightedNodeIds,
  focusOnSelection = true,
  onNodeClick,
  onBackgroundClick,
  nodeRenderer,
  forces,
  customSceneObjects,
  autoFitOnLoad = true,
  autoFitDelay = 800,
  autoFitPadding = 50,
  backgroundColor = '#1a1a2e',
  width,
  height,
  cooldownTicks = 100,
  d3AlphaDecay = 0.02,
  d3VelocityDecay = 0.3,
  showLinkParticles = true,
  showLinkArrows = true,
  initialCameraPosition,
  linkForceConfig,
}: ForceGraph3DWrapperProps) {
  const graphRef = useRef<ForceGraphMethods<ForceNode, ForceLink> | undefined>(undefined);
  const containerRef = useRef<HTMLDivElement>(null);
  const addedObjectIdsRef = useRef<Set<string>>(new Set());
  const prevSelectedNodeIdRef = useRef<string | null>(null);
  const isClickFocusRef = useRef(false);
  const isFocusingRef = useRef(false); // True while camera is animating to a node
  const focusEndTimeRef = useRef(0); // Timestamp when last focus animation ended
  const [dimensions, setDimensions] = useState({ width: width || 800, height: height || 600 });

  // Jotai setters for refocus state
  const setNeedsRefocus = useSetAtom(needsRefocusAtom);
  const setRefocusCallback = useSetAtom(refocusCallbackAtom);

  // Camera controls
  const { zoomToFit, focusOnNode, getCameraPosition } = useGraphCamera(
    graphRef as React.RefObject<ForceGraphMethods<ForceNode, ForceLink> | undefined>
  );

  // Handle container resize
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

  // Apply custom forces (collision, radial, etc.)
  // Note: We skip the 'link' force here because react-force-graph-3d manages its own link force.
  // Replacing it causes "node not found" errors. Use linkForceConfig to customize it instead.
  useEffect(() => {
    if (!graphRef.current || !forces || forces.length === 0) return;

    for (const forceConfig of forces) {
      // Skip link force - let react-force-graph-3d manage it internally
      if (forceConfig.name === 'link') continue;
      graphRef.current.d3Force(forceConfig.name, forceConfig.force);
    }

    graphRef.current.d3ReheatSimulation();
  }, [forces]);

  // Configure the library's built-in link force with custom strength/distance resolvers
  // This allows per-predicate configuration (e.g., student_of links stronger than member_of)
  useEffect(() => {
    if (!graphRef.current || !linkForceConfig) return;

    const linkForce = graphRef.current.d3Force('link');
    if (!linkForce) return;

    if (linkForceConfig.strength !== undefined) {
      linkForce.strength(linkForceConfig.strength);
    }
    if (linkForceConfig.distance !== undefined) {
      linkForce.distance(linkForceConfig.distance);
    }

    graphRef.current.d3ReheatSimulation();
  }, [linkForceConfig]);

  // Set initial camera position
  useEffect(() => {
    if (!graphRef.current || !initialCameraPosition) return;

    const camera = graphRef.current.camera();
    if (camera) {
      camera.position.set(initialCameraPosition.x, initialCameraPosition.y, initialCameraPosition.z);
      camera.lookAt(0, 0, 0);
    }
  }, [initialCameraPosition]);

  // Auto-fit on load
  useEffect(() => {
    if (!autoFitOnLoad) return;

    const timer = setTimeout(() => {
      zoomToFit(1000, autoFitPadding);
    }, autoFitDelay);

    return () => clearTimeout(timer);
  }, [autoFitOnLoad, autoFitDelay, autoFitPadding, zoomToFit]);

  // Add custom scene objects
  useEffect(() => {
    if (!graphRef.current || !customSceneObjects || customSceneObjects.length === 0) return;

    const scene = graphRef.current.scene();
    if (!scene) return;

    // Track which objects we need to add/remove
    const newObjectIds = new Set(customSceneObjects.map((obj) => obj.id));

    // Remove objects that are no longer in the list
    for (const existingId of addedObjectIdsRef.current) {
      if (!newObjectIds.has(existingId)) {
        const objectToRemove = scene.getObjectByName(existingId);
        if (objectToRemove) {
          scene.remove(objectToRemove);
        }
        addedObjectIdsRef.current.delete(existingId);
      }
    }

    // Add new objects
    for (const { id, object } of customSceneObjects) {
      if (!addedObjectIdsRef.current.has(id)) {
        object.name = id; // Set name for later retrieval
        scene.add(object);
        addedObjectIdsRef.current.add(id);
      }
    }

    // Cleanup on unmount
    return () => {
      for (const id of addedObjectIdsRef.current) {
        const objectToRemove = scene.getObjectByName(id);
        if (objectToRemove) {
          scene.remove(objectToRemove);
        }
      }
      addedObjectIdsRef.current.clear();
    };
  }, [customSceneObjects]);

  // Handle node click with camera focus
  const handleNodeClick = useCallback(
    (node: ForceNode) => {
      // Mark that focus is coming from a click (to avoid double-focusing in the effect)
      isClickFocusRef.current = true;
      isFocusingRef.current = true;
      setNeedsRefocus(false);

      focusOnNode(node, 300, 1500);
      onNodeClick?.(node);

      // Clear focusing flag after animation completes
      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1600);
    },
    [focusOnNode, onNodeClick, setNeedsRefocus]
  );

  // Handle background click
  const handleBackgroundClick = useCallback(() => {
    setNeedsRefocus(false);
    onBackgroundClick?.();
  }, [onBackgroundClick, setNeedsRefocus]);

  // Validate selectedNodeId exists in current graph data
  // This prevents issues when switching views where the selected node might not exist
  const validSelectedNodeId = useMemo(() => {
    if (!selectedNodeId) return null;
    const nodeExists = graphData.nodes.some((n) => n.id === selectedNodeId);
    return nodeExists ? selectedNodeId : null;
  }, [selectedNodeId, graphData.nodes]);

  // Focus on selected node when it changes from external source (e.g., search)
  // Skip if the change came from clicking a node (handleNodeClick already focuses)
  useEffect(() => {
    if (!focusOnSelection || !validSelectedNodeId) {
      prevSelectedNodeIdRef.current = validSelectedNodeId;
      setNeedsRefocus(false);
      return;
    }

    // Skip if selection hasn't changed
    if (validSelectedNodeId === prevSelectedNodeIdRef.current) {
      return;
    }

    // Skip if this change came from a click (already focused in handleNodeClick)
    if (isClickFocusRef.current) {
      isClickFocusRef.current = false;
      prevSelectedNodeIdRef.current = validSelectedNodeId;
      return;
    }

    // Find the node and focus on it
    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (node) {
      isFocusingRef.current = true;
      setNeedsRefocus(false);
      focusOnNode(node, 300, 1500);

      // Clear focusing flag after animation completes
      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1600);
    }

    prevSelectedNodeIdRef.current = validSelectedNodeId;
  }, [validSelectedNodeId, focusOnSelection, graphData.nodes, focusOnNode, setNeedsRefocus]);

  // Default node renderer
  const defaultNodeThreeObject = useCallback(
    (node: ForceNode) => {
      const isSelected = node.id === validSelectedNodeId;
      // Dim nodes when highlighting is active and this node is not in the highlighted set
      const isDimmed = highlightedNodeIds ? !highlightedNodeIds.has(node.id) : false;

      if (nodeRenderer) {
        return nodeRenderer(node, isSelected);
      }

      return createDefaultNodeObject(node, isSelected, { isDimmed });
    },
    [validSelectedNodeId, nodeRenderer, highlightedNodeIds]
  );

  // Link color resolver - includes opacity via rgba when highlighting is active
  const linkColorResolver = useCallback(
    (link: ForceLink) => {
      const baseColor = getLinkColor(link);

      if (!highlightedNodeIds) return baseColor; // No highlighting active

      const sourceId = typeof link.source === 'string' ? link.source : (link.source as ForceNode).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as ForceNode).id;

      // Both endpoints must be highlighted for the link to remain bright
      const isHighlighted = highlightedNodeIds.has(sourceId) && highlightedNodeIds.has(targetId);

      if (isHighlighted) return baseColor;

      // Dim the link by returning rgba with low alpha
      // Convert hex to rgba with dimmed opacity
      const hex = baseColor.replace('#', '');
      const r = Number.parseInt(hex.substring(0, 2), 16);
      const g = Number.parseInt(hex.substring(2, 4), 16);
      const b = Number.parseInt(hex.substring(4, 6), 16);
      return `rgba(${r}, ${g}, ${b}, ${DIMMED_LINK_OPACITY})`;
    },
    [highlightedNodeIds]
  );

  // Link visibility resolver - hides links marked as invisible
  // These links still participate in the force simulation (gravity) but aren't rendered
  const linkVisibilityResolver = useCallback((link: ForceLink) => {
    return !link.invisible;
  }, []);

  // Refocus callback - centers camera on the currently selected node
  const refocusOnSelectedNode = useCallback(() => {
    if (!validSelectedNodeId) return;

    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (node) {
      isFocusingRef.current = true;
      setNeedsRefocus(false);
      focusOnNode(node, 300, 1500);

      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now(); // Record when animation ended
      }, 1600);
    }
  }, [validSelectedNodeId, graphData.nodes, focusOnNode, setNeedsRefocus]);

  // Register the refocus callback in global state for NodeDetailsPanel to use
  useEffect(() => {
    setRefocusCallback(() => refocusOnSelectedNode);
    return () => setRefocusCallback(null);
  }, [refocusOnSelectedNode, setRefocusCallback]);

  // Detect camera movement when a node is selected (user dragged/rotated the view)
  // We poll the camera position periodically to detect if it has moved away from the node
  useEffect(() => {
    if (!validSelectedNodeId || !graphRef.current) return;

    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (!node || node.x === undefined || node.y === undefined || node.z === undefined) return;

    // Capture node position at effect setup time (TypeScript narrowing doesn't work in closures)
    const nodeX = node.x;
    const nodeY = node.y;
    const nodeZ = node.z;

    let lastCameraPos = getCameraPosition();
    let interval: ReturnType<typeof setInterval> | null = null;

    const checkCameraMove = () => {
      // Don't check while we're actively focusing or within 1 second after focus ends
      if (isFocusingRef.current) return;
      if (Date.now() - focusEndTimeRef.current < 1000) {
        lastCameraPos = getCameraPosition(); // Reset baseline
        return;
      }

      const currentPos = getCameraPosition();
      if (!currentPos || !lastCameraPos) {
        lastCameraPos = currentPos;
        return;
      }

      // Check if camera moved significantly
      const dx = currentPos.x - lastCameraPos.x;
      const dy = currentPos.y - lastCameraPos.y;
      const dz = currentPos.z - lastCameraPos.z;
      const cameraMoveDistance = Math.sqrt(dx * dx + dy * dy + dz * dz);

      if (cameraMoveDistance > 125) {
        // Camera has moved, check if node is still centered
        // Calculate vector from camera to node
        const toNodeX = nodeX - currentPos.x;
        const toNodeY = nodeY - currentPos.y;
        const toNodeZ = nodeZ - currentPos.z;

        // Get camera's forward direction (it looks at the controls target, usually origin or last lookAt)
        // For simplicity, we just check if the node is roughly in front of the camera
        // by checking if the distance from camera to node changed significantly
        const distToNode = Math.sqrt(toNodeX * toNodeX + toNodeY * toNodeY + toNodeZ * toNodeZ);

        // If we're far from the node or have rotated significantly, show refocus button
        if (distToNode > 400 || cameraMoveDistance > 50) {
          setNeedsRefocus(true);
        }

        lastCameraPos = currentPos;
      }
    };

    interval = setInterval(checkCameraMove, 200);

    return () => {
      if (interval) clearInterval(interval);
    };
  }, [validSelectedNodeId, graphData.nodes, getCameraPosition, setNeedsRefocus]);

  return (
    <div ref={containerRef} className="h-full w-full" style={{ minHeight: 400 }}>
      <ForceGraph3D
        ref={graphRef}
        graphData={graphData}
        width={dimensions.width}
        height={dimensions.height}
        // Node configuration
        nodeId="id"
        nodeLabel={(node: ForceNode) => `${node.name} (${node.type})`}
        nodeThreeObject={defaultNodeThreeObject}
        nodeThreeObjectExtend={false}
        // Link configuration
        linkVisibility={linkVisibilityResolver}
        linkColor={linkColorResolver}
        linkWidth={1.5}
        linkOpacity={0.6}
        linkDirectionalArrowLength={showLinkArrows ? 3 : 0}
        linkDirectionalArrowRelPos={1}
        linkDirectionalParticles={showLinkParticles ? 1 : 0}
        linkDirectionalParticleWidth={2}
        linkDirectionalParticleSpeed={0.005}
        // Interaction
        onNodeClick={handleNodeClick}
        onBackgroundClick={handleBackgroundClick}
        // Layout
        cooldownTicks={cooldownTicks}
        d3AlphaDecay={d3AlphaDecay}
        d3VelocityDecay={d3VelocityDecay}
        // Performance
        enableNavigationControls
        showNavInfo={false}
        // Background
        backgroundColor={backgroundColor}
      />
    </div>
  );
}

export default ForceGraph3DWrapper;
