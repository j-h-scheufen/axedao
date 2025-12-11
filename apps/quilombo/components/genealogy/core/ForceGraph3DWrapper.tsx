'use client';

/**
 * Base wrapper component for react-force-graph-3d.
 *
 * Provides common configuration and utilities for 3D graph visualization.
 * Specialized graph views should use this as their foundation.
 */

import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import ForceGraph3D, { type ForceGraphMethods } from 'react-force-graph-3d';

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
export function ForceGraph3DWrapper({
  graphData,
  selectedNodeId,
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
  const [dimensions, setDimensions] = useState({ width: width || 800, height: height || 600 });

  // Camera controls
  const { zoomToFit, focusOnNode } = useGraphCamera(
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
      focusOnNode(node, 300, 1500);
      onNodeClick?.(node);
    },
    [focusOnNode, onNodeClick]
  );

  // Handle background click
  const handleBackgroundClick = useCallback(() => {
    onBackgroundClick?.();
  }, [onBackgroundClick]);

  // Validate selectedNodeId exists in current graph data
  // This prevents issues when switching views where the selected node might not exist
  const validSelectedNodeId = useMemo(() => {
    if (!selectedNodeId) return null;
    const nodeExists = graphData.nodes.some((n) => n.id === selectedNodeId);
    return nodeExists ? selectedNodeId : null;
  }, [selectedNodeId, graphData.nodes]);

  // Default node renderer
  const defaultNodeThreeObject = useCallback(
    (node: ForceNode) => {
      const isSelected = node.id === validSelectedNodeId;

      if (nodeRenderer) {
        return nodeRenderer(node, isSelected);
      }

      return createDefaultNodeObject(node, isSelected);
    },
    [validSelectedNodeId, nodeRenderer]
  );

  // Link color resolver
  const linkColorResolver = useCallback((link: ForceLink) => {
    return getLinkColor(link);
  }, []);

  // Link visibility resolver - hides links marked as invisible
  // These links still participate in the force simulation (gravity) but aren't rendered
  const linkVisibilityResolver = useCallback((link: ForceLink) => {
    return !link.invisible;
  }, []);

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
