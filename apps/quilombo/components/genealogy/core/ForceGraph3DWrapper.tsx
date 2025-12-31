'use client';

/**
 * Base wrapper component for react-force-graph-3d.
 *
 * Provides common configuration and utilities for 3D graph visualization.
 * Specialized graph views should use this as their foundation.
 */

import { useAtomValue, useSetAtom } from 'jotai';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import ForceGraph3D, { type ForceGraphMethods } from 'react-force-graph-3d';

import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

import {
  mobileDrawerOpenAtom,
  needsRefocusAtom,
  recenterCallbackAtom,
  refocusCallbackAtom,
} from '@/components/genealogy/state';

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

/**
 * Camera lookAt offsets for mobile drawer modes.
 *
 * Hybrid approach:
 * - Predictive: Applied immediately on node focus based on screen layout
 * - Reactive: Removed when drawer closes to re-center the node
 */
/** Y-offset for bottom drawer (mobile portrait). Negative = node appears higher. */
const BOTTOM_DRAWER_Y_OFFSET = -100;
/** X-offset for right drawer (mobile landscape). Negative = node appears more to the right. */
const RIGHT_DRAWER_X_OFFSET = -100;

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
  autoFitPadding = 50,
  backgroundColor = '#1a1a2e',
  width,
  height,
  warmupTicks = 0,
  cooldownTicks = 100,
  d3AlphaDecay = 0.02,
  d3VelocityDecay = 0.3,
  showLinkParticles = true,
  showLinkArrows = true,
  initialCameraPosition,
  linkForceConfig,
  nodeScale = 1.0,
  maxVisibleRadius,
}: ForceGraph3DWrapperProps) {
  const graphRef = useRef<ForceGraphMethods<ForceNode, ForceLink> | undefined>(undefined);
  const containerRef = useRef<HTMLDivElement>(null);
  const addedObjectIdsRef = useRef<Set<string>>(new Set());
  const prevSelectedNodeIdRef = useRef<string | null>(null);
  const isClickFocusRef = useRef(false);
  const isFocusingRef = useRef(false); // True while camera is animating to a node
  const focusEndTimeRef = useRef(0); // Timestamp when last focus animation ended
  // Start with null dimensions - don't render graph until we have accurate measurements
  // This prevents the graph from initializing with wrong dimensions (e.g., 800px default on 390px mobile)
  const [dimensions, setDimensions] = useState<{ width: number; height: number } | null>(
    width && height ? { width, height } : null
  );

  // Jotai state for refocus/recenter
  const setNeedsRefocus = useSetAtom(needsRefocusAtom);
  const setRefocusCallback = useSetAtom(refocusCallbackAtom);
  const setRecenterCallback = useSetAtom(recenterCallbackAtom);

  // Predictive: detect drawer placement based on screen layout
  const { isMobile, isPortrait, isLandscape } = useResponsiveLayout();
  const willUseBottomDrawer = isMobile && isPortrait;
  const willUseRightDrawerOnMobile = isMobile && isLandscape;

  // Reactive: track actual drawer state (for re-centering on close)
  const isMobileDrawerOpen = useAtomValue(mobileDrawerOpenAtom);

  // Camera offset: predictive approach - apply offset immediately based on layout
  const cameraOffset = useMemo(() => {
    if (willUseBottomDrawer) {
      return { y: BOTTOM_DRAWER_Y_OFFSET };
    }
    if (willUseRightDrawerOnMobile) {
      return { x: RIGHT_DRAWER_X_OFFSET };
    }
    return {};
  }, [willUseBottomDrawer, willUseRightDrawerOnMobile]);

  // Camera controls
  const { zoomToFit, focusOnNode, getCameraPosition } = useGraphCamera(
    graphRef as React.RefObject<ForceGraphMethods<ForceNode, ForceLink> | undefined>
  );

  // Handle container resize using ResizeObserver for reliable measurements
  // This catches layout changes (flex settling, orientation changes) not just window resize
  useEffect(() => {
    if (width && height) {
      setDimensions({ width, height });
      return;
    }

    const container = containerRef.current;
    if (!container) return;

    const updateDimensions = () => {
      const rect = container.getBoundingClientRect();
      const newWidth = Math.floor(rect.width);
      const newHeight = Math.floor(rect.height);

      // Only update if we have valid dimensions
      if (newWidth > 0 && newHeight > 0) {
        setDimensions((prev) => {
          // Only update if dimensions actually changed to avoid unnecessary re-renders
          if (!prev || prev.width !== newWidth || prev.height !== newHeight) {
            return { width: newWidth, height: newHeight };
          }
          return prev;
        });
      }
    };

    // Initial measurement after a frame to ensure layout is settled
    requestAnimationFrame(updateDimensions);

    // Use ResizeObserver for responsive updates
    const resizeObserver = new ResizeObserver(updateDimensions);
    resizeObserver.observe(container);

    return () => resizeObserver.disconnect();
  }, [width, height]);

  // Apply custom forces (collision, radial, etc.)
  // Note: We skip the 'link' force here because react-force-graph-3d manages its own link force.
  // Replacing it causes "node not found" errors. Use linkForceConfig to customize it instead.
  // We include `dimensions` in deps to ensure forces are applied after graph mounts
  // (graph only mounts when dimensions becomes non-null)
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current || !forces || forces.length === 0) return;

    // Use requestAnimationFrame to ensure graph's internal simulation is initialized
    const frameId = requestAnimationFrame(() => {
      if (!graphRef.current) return;

      for (const forceConfig of forces) {
        // Skip link force - let react-force-graph-3d manage it internally
        if (forceConfig.name === 'link') continue;
        graphRef.current.d3Force(forceConfig.name, forceConfig.force);
      }

      graphRef.current.d3ReheatSimulation();
    });

    return () => cancelAnimationFrame(frameId);
  }, [forces, dimensions]);

  // Configure the library's built-in link force with custom strength/distance resolvers
  // This allows per-predicate configuration (e.g., student_of links stronger than member_of)
  // We include `dimensions` in deps to ensure config is applied after graph mounts
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current || !linkForceConfig) return;

    // Use requestAnimationFrame to ensure graph's internal simulation is initialized
    const frameId = requestAnimationFrame(() => {
      if (!graphRef.current) return;

      const linkForce = graphRef.current.d3Force('link');
      if (!linkForce) return;

      if (linkForceConfig.strength !== undefined) {
        linkForce.strength(linkForceConfig.strength);
      }
      if (linkForceConfig.distance !== undefined) {
        linkForce.distance(linkForceConfig.distance);
      }

      graphRef.current.d3ReheatSimulation();
    });

    return () => cancelAnimationFrame(frameId);
  }, [linkForceConfig, dimensions]);

  // Track if this is the initial mount (vs. a view change)
  const isInitialMountRef = useRef(true);
  const prevInitialCameraPositionRef = useRef(initialCameraPosition);

  // Set initial camera position and trigger zoom-to-fit on mount or view change
  // initialCameraPosition changes when viewMode changes, so we use it to detect view switches
  // We include `dimensions` in deps to ensure this runs after graph mounts
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current) return;

    const isViewChange = !isInitialMountRef.current && prevInitialCameraPositionRef.current !== initialCameraPosition;

    // Set camera position if provided
    if (initialCameraPosition) {
      const camera = graphRef.current.camera();
      if (camera) {
        camera.position.set(initialCameraPosition.x, initialCameraPosition.y, initialCameraPosition.z);
        camera.lookAt(0, 0, 0);
      }
    }

    // Zoom to fit on initial mount or view change
    if ((isInitialMountRef.current && autoFitOnLoad) || isViewChange) {
      zoomToFit(1000, autoFitPadding);
      isInitialMountRef.current = false;
    }

    prevInitialCameraPositionRef.current = initialCameraPosition;
  }, [initialCameraPosition, autoFitOnLoad, autoFitPadding, zoomToFit, dimensions]);

  // Add custom scene objects (e.g., era rings in student ancestry view)
  // We include `dimensions` in deps to ensure objects are added after graph mounts
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
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
  }, [customSceneObjects, dimensions]);

  // Handle node click with camera focus
  const handleNodeClick = useCallback(
    (node: ForceNode) => {
      // Mark that focus is coming from a click (to avoid double-focusing in the effect)
      isClickFocusRef.current = true;
      isFocusingRef.current = true;
      setNeedsRefocus(false);

      focusOnNode(node, 300, 1500, cameraOffset);
      onNodeClick?.(node);

      // Clear focusing flag after animation completes
      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1600);
    },
    [focusOnNode, onNodeClick, setNeedsRefocus, cameraOffset]
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
      focusOnNode(node, 300, 1500, cameraOffset);

      // Clear focusing flag after animation completes
      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1600);
    }

    prevSelectedNodeIdRef.current = validSelectedNodeId;
  }, [validSelectedNodeId, focusOnSelection, graphData.nodes, focusOnNode, setNeedsRefocus, cameraOffset]);

  // Default node renderer
  const defaultNodeThreeObject = useCallback(
    (node: ForceNode) => {
      const isSelected = node.id === validSelectedNodeId;
      // Dim nodes when highlighting is active and this node is not in the highlighted set
      const isDimmed = highlightedNodeIds ? !highlightedNodeIds.has(node.id) : false;

      if (nodeRenderer) {
        return nodeRenderer(node, isSelected);
      }

      return createDefaultNodeObject(node, isSelected, { isDimmed, scale: nodeScale });
    },
    [validSelectedNodeId, nodeRenderer, highlightedNodeIds, nodeScale]
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
      focusOnNode(node, 300, 1500, cameraOffset);

      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now(); // Record when animation ended
      }, 1600);
    }
  }, [validSelectedNodeId, graphData.nodes, focusOnNode, setNeedsRefocus, cameraOffset]);

  // Register the refocus callback in global state for NodeDetailsPanel to use
  useEffect(() => {
    setRefocusCallback(() => refocusOnSelectedNode);
    return () => setRefocusCallback(null);
  }, [refocusOnSelectedNode, setRefocusCallback]);

  // Re-center node when mobile drawer closes (reactive approach for close only)
  // Opening is handled predictively via cameraOffset in focus calls
  const prevDrawerOpenRef = useRef(isMobileDrawerOpen);
  const lastSelectedNodeIdRef = useRef<string | null>(null);

  // Track the last selected node (so we can re-center it after deselection)
  useEffect(() => {
    if (validSelectedNodeId) {
      lastSelectedNodeIdRef.current = validSelectedNodeId;
    }
  }, [validSelectedNodeId]);

  useEffect(() => {
    const wasOpen = prevDrawerOpenRef.current;
    const isNowOpen = isMobileDrawerOpen;
    prevDrawerOpenRef.current = isNowOpen;

    // Only act on drawer CLOSE (was open, now closed)
    if (!(wasOpen && !isNowOpen)) return;

    // Use current selection, or fall back to last selected node (may have been deselected on close)
    const nodeIdToCenter = validSelectedNodeId || lastSelectedNodeIdRef.current;
    if (!nodeIdToCenter) return;

    const node = graphData.nodes.find((n) => n.id === nodeIdToCenter);
    if (!node) return;

    // Re-center node (no offset since drawer is closed)
    isFocusingRef.current = true;
    setNeedsRefocus(false);
    focusOnNode(node, 300, 800, {}); // No offset - center the node

    setTimeout(() => {
      isFocusingRef.current = false;
      focusEndTimeRef.current = Date.now();
    }, 900);
  }, [isMobileDrawerOpen, validSelectedNodeId, graphData.nodes, focusOnNode, setNeedsRefocus]);

  // Recenter callback - returns camera to initial position looking at origin
  // We avoid zoomToFit() because it includes all nodes in bounding box calculation,
  // including outliers at year 2200 band which causes excessive zoom out
  const recenterGraph = useCallback(() => {
    if (!graphRef.current) return;

    // Compute camera distance based on max visible radius
    let cameraDistance: number;
    if (maxVisibleRadius) {
      // Camera distance calculation for typical 75° FOV:
      // distance = radius / tan(FOV/2) ≈ radius * 1.3
      // Add small multiplier (1.15) for minimal padding around the visible area
      cameraDistance = maxVisibleRadius * 1.3 * 1.15;
    } else {
      // Fallback to provided initial position or default
      cameraDistance = initialCameraPosition?.z ?? 500;
    }

    // Set camera position looking at origin
    const targetPosition = { x: 0, y: 0, z: cameraDistance };
    const camera = graphRef.current.camera();
    if (camera) {
      camera.position.set(targetPosition.x, targetPosition.y, targetPosition.z);
      camera.lookAt(0, 0, 0);
    }

    // Animate the camera smoothly to the target position
    graphRef.current.cameraPosition(targetPosition, { x: 0, y: 0, z: 0 }, 1000);
  }, [initialCameraPosition, maxVisibleRadius]);

  // Register the recenter callback in global state for GraphControls to use
  useEffect(() => {
    setRecenterCallback(() => recenterGraph);
    return () => setRecenterCallback(null);
  }, [recenterGraph, setRecenterCallback]);

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
    <div ref={containerRef} className="h-full w-full" style={{ minHeight: 400, backgroundColor }}>
      {dimensions && (
        <ForceGraph3D
          ref={graphRef}
          graphData={graphData}
          width={dimensions.width}
          height={dimensions.height}
          // Node configuration
          nodeId="id"
          nodeLabel={(node: ForceNode) => (node.type === 'group' ? `${node.name} (group)` : node.name)}
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
          // Layout / Simulation
          warmupTicks={warmupTicks}
          cooldownTicks={cooldownTicks}
          d3AlphaDecay={d3AlphaDecay}
          d3VelocityDecay={d3VelocityDecay}
          // Performance
          enableNavigationControls
          showNavInfo={false}
          // Background
          backgroundColor={backgroundColor}
        />
      )}
    </div>
  );
}

export default ForceGraph3DWrapper;
