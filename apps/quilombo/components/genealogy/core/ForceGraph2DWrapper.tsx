'use client';

/**
 * Base wrapper component for react-force-graph-2d.
 *
 * Provides common configuration and utilities for 2D graph visualization.
 * Used for the student-ancestry view with canvas-based rendering and era rings.
 */

import { useAtomValue, useSetAtom } from 'jotai';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import ForceGraph2D, { type ForceGraphMethods } from 'react-force-graph-2d';

import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

import {
  mobileDrawerOpenAtom,
  needsRefocusAtom,
  recenterCallbackAtom,
  refocusCallbackAtom,
} from '@/components/genealogy/state';

import { drawEraRings2D } from './eraRings2D';
import { getLinkColor } from './linkRenderers';
import { createNodeCanvasObject } from './nodeRenderers2D';
import { useGraphCamera2D } from './useGraphCamera2D';
import type { ForceGraph2DWrapperProps, ForceLink2D, ForceNode2D } from './types2d';

/**
 * Base wrapper for react-force-graph-2d with common configuration.
 *
 * Features:
 * - Auto-sizing to container
 * - Canvas node rendering with selection state
 * - Era rings background rendering
 * - 2D camera controls via useGraphCamera2D hook
 * - Support for custom forces
 * - Auto-fit on load option
 */

/** Opacity multiplier for dimmed links (when highlighting lineage) */
const DIMMED_LINK_OPACITY = 0.1;

/**
 * Camera offsets for mobile drawer modes (2D version).
 *
 * In 2D, offsets are simpler - just graph-space units applied to centerAt().
 * Positive x = camera moves right (node appears left)
 * Positive y = camera moves down (node appears up)
 */
const BOTTOM_DRAWER_Y_OFFSET = 80;
const RIGHT_DRAWER_X_OFFSET = -80;

export function ForceGraph2DWrapper({
  graphData,
  selectedNodeId,
  highlightedNodeIds,
  focusOnSelection = true,
  onNodeClick,
  onBackgroundClick,
  nodeRenderer,
  forces,
  eraRingsLayout,
  autoFitOnLoad = true,
  autoFitPadding = 50,
  backgroundColor = '#1a1a2e',
  width,
  height,
  warmupTicks = 0,
  cooldownTicks = 100,
  d3AlphaDecay = 0.02,
  d3VelocityDecay = 0.3,
  showLinkArrows = true,
  showLinkParticles = false,
  linkForceConfig,
  nodeScale = 1.0,
}: ForceGraph2DWrapperProps) {
  const graphRef = useRef<ForceGraphMethods<ForceNode2D, ForceLink2D> | undefined>(undefined);
  const containerRef = useRef<HTMLDivElement>(null);
  const prevSelectedNodeIdRef = useRef<string | null>(null);
  const isClickFocusRef = useRef(false);
  const isFocusingRef = useRef(false);
  const focusEndTimeRef = useRef(0);

  // Start with null dimensions - don't render graph until we have accurate measurements
  const [dimensions, setDimensions] = useState<{ width: number; height: number } | null>(
    width && height ? { width, height } : null
  );

  // Jotai state for refocus/recenter
  const setNeedsRefocus = useSetAtom(needsRefocusAtom);
  const setRefocusCallback = useSetAtom(refocusCallbackAtom);
  const setRecenterCallback = useSetAtom(recenterCallbackAtom);

  // Detect drawer placement based on screen layout
  const { isMobile, isPortrait, isLandscape } = useResponsiveLayout();
  const willUseBottomDrawer = isMobile && isPortrait;
  const willUseRightDrawerOnMobile = isMobile && isLandscape;

  // Track actual drawer state (for re-centering on close)
  const isMobileDrawerOpen = useAtomValue(mobileDrawerOpenAtom);

  // Camera offset for drawer compensation
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
  const { zoomToFit, focusOnNode, getCameraState } = useGraphCamera2D(
    graphRef as React.RefObject<ForceGraphMethods<ForceNode2D, ForceLink2D> | undefined>
  );

  // Handle container resize
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

      if (newWidth > 0 && newHeight > 0) {
        setDimensions((prev) => {
          if (!prev || prev.width !== newWidth || prev.height !== newHeight) {
            return { width: newWidth, height: newHeight };
          }
          return prev;
        });
      }
    };

    requestAnimationFrame(updateDimensions);

    const resizeObserver = new ResizeObserver(updateDimensions);
    resizeObserver.observe(container);

    return () => resizeObserver.disconnect();
  }, [width, height]);

  // Apply custom forces
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current || !forces || forces.length === 0) return;

    const frameId = requestAnimationFrame(() => {
      if (!graphRef.current) return;

      for (const forceConfig of forces) {
        if (forceConfig.name === 'link') continue;
        graphRef.current.d3Force(forceConfig.name, forceConfig.force);
      }

      graphRef.current.d3ReheatSimulation();
    });

    return () => cancelAnimationFrame(frameId);
  }, [forces, dimensions]);

  // Configure link force
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current || !linkForceConfig) return;

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

  // Track initial mount
  const isInitialMountRef = useRef(true);

  // Zoom to fit on initial mount
  // biome-ignore lint/correctness/useExhaustiveDependencies: dimensions triggers re-run when graph mounts
  useEffect(() => {
    if (!graphRef.current || !isInitialMountRef.current || !autoFitOnLoad) return;

    const frameId = requestAnimationFrame(() => {
      zoomToFit(1000, autoFitPadding);
      isInitialMountRef.current = false;
    });

    return () => cancelAnimationFrame(frameId);
  }, [autoFitOnLoad, autoFitPadding, zoomToFit, dimensions]);

  // Handle node click with camera focus
  const handleNodeClick = useCallback(
    (node: ForceNode2D) => {
      isClickFocusRef.current = true;
      isFocusingRef.current = true;
      setNeedsRefocus(false);

      focusOnNode(node, 1000, cameraOffset);
      onNodeClick?.(node);

      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1100);
    },
    [focusOnNode, onNodeClick, setNeedsRefocus, cameraOffset]
  );

  // Handle background click
  const handleBackgroundClick = useCallback(() => {
    setNeedsRefocus(false);
    onBackgroundClick?.();
  }, [onBackgroundClick, setNeedsRefocus]);

  // Validate selectedNodeId exists in current graph data
  const validSelectedNodeId = useMemo(() => {
    if (!selectedNodeId) return null;
    const nodeExists = graphData.nodes.some((n) => n.id === selectedNodeId);
    return nodeExists ? selectedNodeId : null;
  }, [selectedNodeId, graphData.nodes]);

  // Focus on selected node when it changes from external source
  useEffect(() => {
    if (!focusOnSelection || !validSelectedNodeId) {
      prevSelectedNodeIdRef.current = validSelectedNodeId;
      setNeedsRefocus(false);
      return;
    }

    if (validSelectedNodeId === prevSelectedNodeIdRef.current) {
      return;
    }

    if (isClickFocusRef.current) {
      isClickFocusRef.current = false;
      prevSelectedNodeIdRef.current = validSelectedNodeId;
      return;
    }

    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (node) {
      isFocusingRef.current = true;
      setNeedsRefocus(false);
      focusOnNode(node, 1000, cameraOffset);

      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1100);
    }

    prevSelectedNodeIdRef.current = validSelectedNodeId;
  }, [validSelectedNodeId, focusOnSelection, graphData.nodes, focusOnNode, setNeedsRefocus, cameraOffset]);

  // Node canvas renderer
  const nodeCanvasObject = useMemo(() => {
    if (nodeRenderer) {
      return (node: ForceNode2D, ctx: CanvasRenderingContext2D, globalScale: number) => {
        const isSelected = node.id === validSelectedNodeId;
        const isDimmed = highlightedNodeIds ? !highlightedNodeIds.has(node.id) : false;
        nodeRenderer(node, ctx, globalScale, isSelected, isDimmed);
      };
    }
    return createNodeCanvasObject(validSelectedNodeId, highlightedNodeIds, nodeScale);
  }, [validSelectedNodeId, nodeRenderer, highlightedNodeIds, nodeScale]);

  // Link color resolver
  const linkColorResolver = useCallback(
    (link: ForceLink2D) => {
      const baseColor = getLinkColor(link);

      if (!highlightedNodeIds) return baseColor;

      const sourceId = typeof link.source === 'string' ? link.source : (link.source as ForceNode2D).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as ForceNode2D).id;

      const isHighlighted = highlightedNodeIds.has(sourceId) && highlightedNodeIds.has(targetId);

      if (isHighlighted) return baseColor;

      const hex = baseColor.replace('#', '');
      const r = Number.parseInt(hex.substring(0, 2), 16);
      const g = Number.parseInt(hex.substring(2, 4), 16);
      const b = Number.parseInt(hex.substring(4, 6), 16);
      return `rgba(${r}, ${g}, ${b}, ${DIMMED_LINK_OPACITY})`;
    },
    [highlightedNodeIds]
  );

  // Link visibility resolver
  const linkVisibilityResolver = useCallback((link: ForceLink2D) => {
    return !link.invisible;
  }, []);

  // Era rings background renderer
  const handleRenderFramePre = useCallback(
    (ctx: CanvasRenderingContext2D, globalScale: number) => {
      if (eraRingsLayout) {
        drawEraRings2D(ctx, eraRingsLayout, globalScale);
      }
    },
    [eraRingsLayout]
  );

  // Refocus callback
  const refocusOnSelectedNode = useCallback(() => {
    if (!validSelectedNodeId) return;

    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (node) {
      isFocusingRef.current = true;
      setNeedsRefocus(false);
      focusOnNode(node, 1000, cameraOffset);

      setTimeout(() => {
        isFocusingRef.current = false;
        focusEndTimeRef.current = Date.now();
      }, 1100);
    }
  }, [validSelectedNodeId, graphData.nodes, focusOnNode, setNeedsRefocus, cameraOffset]);

  // Register refocus callback
  useEffect(() => {
    setRefocusCallback(() => refocusOnSelectedNode);
    return () => setRefocusCallback(null);
  }, [refocusOnSelectedNode, setRefocusCallback]);

  // Re-center node when mobile drawer closes
  const prevDrawerOpenRef = useRef(isMobileDrawerOpen);
  const lastSelectedNodeIdRef = useRef<string | null>(null);

  useEffect(() => {
    if (validSelectedNodeId) {
      lastSelectedNodeIdRef.current = validSelectedNodeId;
    }
  }, [validSelectedNodeId]);

  useEffect(() => {
    const wasOpen = prevDrawerOpenRef.current;
    const isNowOpen = isMobileDrawerOpen;
    prevDrawerOpenRef.current = isNowOpen;

    if (!(wasOpen && !isNowOpen)) return;

    const nodeIdToCenter = validSelectedNodeId || lastSelectedNodeIdRef.current;
    if (!nodeIdToCenter) return;

    const node = graphData.nodes.find((n) => n.id === nodeIdToCenter);
    if (!node) return;

    isFocusingRef.current = true;
    setNeedsRefocus(false);
    focusOnNode(node, 800, {});

    setTimeout(() => {
      isFocusingRef.current = false;
      focusEndTimeRef.current = Date.now();
    }, 900);
  }, [isMobileDrawerOpen, validSelectedNodeId, graphData.nodes, focusOnNode, setNeedsRefocus]);

  // Recenter callback - centers at origin with computed zoom level
  // We avoid zoomToFit() because it centers on the bounding box of all nodes,
  // not on the origin where the era rings are centered
  const recenterGraph = useCallback(() => {
    if (!graphRef.current || !dimensions) return;

    // Center at origin (where era rings are centered)
    graphRef.current.centerAt(0, 0, 500);

    // Compute zoom to fit the max visible radius (excluding outlier nodes)
    if (eraRingsLayout) {
      const maxRadius = eraRingsLayout.getMaxVisibleRadius();
      const containerSize = Math.min(dimensions.width, dimensions.height);
      // Compute zoom: fit maxRadius in half the container (with padding)
      // Multiply by 1.2 to zoom slightly closer than the exact fit
      const targetZoom = ((containerSize / 2 - autoFitPadding) / maxRadius) * 1.2;
      graphRef.current.zoom(targetZoom, 1000);
    } else {
      // Fallback: use zoomToFit if no layout available
      zoomToFit(1000, autoFitPadding);
    }
  }, [zoomToFit, autoFitPadding, dimensions, eraRingsLayout]);

  // Register recenter callback
  useEffect(() => {
    setRecenterCallback(() => recenterGraph);
    return () => setRecenterCallback(null);
  }, [recenterGraph, setRecenterCallback]);

  // Detect camera movement when a node is selected
  useEffect(() => {
    if (!validSelectedNodeId || !graphRef.current) return;

    const node = graphData.nodes.find((n) => n.id === validSelectedNodeId);
    if (!node || node.x === undefined || node.y === undefined) return;

    let lastCameraState = getCameraState();
    let interval: ReturnType<typeof setInterval> | null = null;

    const checkCameraMove = () => {
      if (isFocusingRef.current) return;
      if (Date.now() - focusEndTimeRef.current < 1000) {
        lastCameraState = getCameraState();
        return;
      }

      const currentState = getCameraState();
      if (!currentState || !lastCameraState) {
        lastCameraState = currentState;
        return;
      }

      // Check if camera panned significantly
      const dx = currentState.x - lastCameraState.x;
      const dy = currentState.y - lastCameraState.y;
      const panDistance = Math.sqrt(dx * dx + dy * dy);

      if (panDistance > 50) {
        setNeedsRefocus(true);
        lastCameraState = currentState;
      }
    };

    interval = setInterval(checkCameraMove, 200);

    return () => {
      if (interval) clearInterval(interval);
    };
  }, [validSelectedNodeId, graphData.nodes, getCameraState, setNeedsRefocus]);

  return (
    <div ref={containerRef} className="h-full w-full" style={{ minHeight: 400, backgroundColor }}>
      {dimensions && (
        <ForceGraph2D
          ref={graphRef}
          graphData={graphData}
          width={dimensions.width}
          height={dimensions.height}
          // Node configuration
          nodeId="id"
          nodeLabel={(node: ForceNode2D) => `${node.name} (${node.type})`}
          nodeCanvasObject={nodeCanvasObject}
          nodeCanvasObjectMode={() => 'replace'}
          // Link configuration
          linkVisibility={linkVisibilityResolver}
          linkColor={linkColorResolver}
          linkWidth={1.5}
          linkDirectionalArrowLength={showLinkArrows ? 4 : 0}
          linkDirectionalArrowRelPos={1}
          linkDirectionalParticles={showLinkParticles ? 1 : 0}
          linkDirectionalParticleSpeed={0.005}
          // Interaction
          onNodeClick={handleNodeClick}
          onBackgroundClick={handleBackgroundClick}
          // Canvas rendering
          onRenderFramePre={handleRenderFramePre}
          // Layout / Simulation
          warmupTicks={warmupTicks}
          cooldownTicks={cooldownTicks}
          d3AlphaDecay={d3AlphaDecay}
          d3VelocityDecay={d3VelocityDecay}
          // Performance
          enablePanInteraction
          enableZoomInteraction
          // Background
          backgroundColor={backgroundColor}
        />
      )}
    </div>
  );
}

export default ForceGraph2DWrapper;
