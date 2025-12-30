'use client';

import { Button, Chip, Link, Spinner, useDisclosure } from '@heroui/react';
import { useAtom } from 'jotai';
import { Info } from 'lucide-react';
import dynamic from 'next/dynamic';
import { parseAsBoolean, parseAsString, useQueryStates } from 'nuqs';
import { useCallback, useEffect, useMemo, useRef } from 'react';

import { type GraphViewMode, getViewConfig } from '@/components/genealogy/config';
import {
  type GenealogyLanguage,
  genealogyLanguageAtom,
  graphFiltersAtom,
  graphViewModeAtom,
  selectedNodeIdAtom,
  showYourselfAtom,
} from '@/components/genealogy/state';
import type { GraphNode } from '@/components/genealogy/types';
import {
  ControlsDrawer,
  ControlsSidebar,
  DetailsDrawer,
  GenealogyInfoModal,
  GraphLegend,
  NodeSearch,
  ViewModeMenu,
} from '@/components/genealogy/ui';

import { useGenealogyGraph, useNodeDetails } from '@/hooks/useGenealogyData';
import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

// Dynamically import the 3D graph component (requires WebGL, client-side only)
// Single component instance - view mode changes don't cause remount
const GenealogyGraph = dynamic(
  () => import('@/components/genealogy/graphs/GenealogyGraph').then((mod) => mod.GenealogyGraph),
  {
    ssr: false,
    loading: () => (
      <div className="flex h-full items-center justify-center">
        <Spinner size="lg" label="Loading 3D graph..." />
      </div>
    ),
  }
);

export default function GenealogyPage() {
  // Responsive layout
  const { isMobile, isDesktop } = useResponsiveLayout();
  const showSidebar = isDesktop; // Sidebar on desktop, drawer on mobile/tablet

  // Info modal
  const { isOpen: isInfoModalOpen, onOpen: onInfoModalOpen, onClose: onInfoModalClose } = useDisclosure();

  // URL query params for deep linking
  const [queryParams, setQueryParams] = useQueryStates({
    view: parseAsString.withDefault('general'),
    node: parseAsString,
    showYourself: parseAsBoolean.withDefault(false),
    about: parseAsBoolean, // Open info modal when true
    lang: parseAsString, // Set language: 'en' or 'pt'
    type: parseAsString, // Filter by node type: 'person' or 'group'
  });

  // Track if initial URL state has been applied
  const initializedRef = useRef(false);

  // Jotai state
  const [graphView, setGraphView] = useAtom(graphViewModeAtom);
  const [filters, setFilters] = useAtom(graphFiltersAtom);
  const [selectedNodeId, setSelectedNodeId] = useAtom(selectedNodeIdAtom);
  const [showYourself, setShowYourself] = useAtom(showYourselfAtom);
  const [, setLanguage] = useAtom(genealogyLanguageAtom);

  // Initialize state from URL params on mount
  useEffect(() => {
    if (initializedRef.current) return;
    initializedRef.current = true;

    // Apply view mode from URL
    const viewMode = (queryParams.view as GraphViewMode) || 'general';
    const newConfig = getViewConfig(viewMode);

    if (viewMode !== graphView) {
      setGraphView(viewMode);
    }

    // Apply type filter if specified (filter nodeTypes to single type)
    const typeFilter = queryParams.type as 'person' | 'group' | null;
    const allowedNodeTypes =
      typeFilter && newConfig.allowedNodeTypes.includes(typeFilter) ? [typeFilter] : [...newConfig.allowedNodeTypes];

    setFilters({
      nodeTypes: allowedNodeTypes,
      predicates: [...newConfig.allowedPredicates],
    });

    // Apply showYourself from URL (only in student-ancestry view)
    if (queryParams.showYourself && queryParams.view === 'student-ancestry') {
      setShowYourself(true);
    }

    // Apply node selection from URL (after data loads)
    if (queryParams.node) {
      setSelectedNodeId(queryParams.node);
    }

    // Apply language from URL param
    if (queryParams.lang === 'en' || queryParams.lang === 'pt') {
      setLanguage(queryParams.lang as GenealogyLanguage);
    }

    // Open info modal if about=true in URL
    if (queryParams.about) {
      onInfoModalOpen();
    }
  }, [
    queryParams,
    graphView,
    setGraphView,
    setFilters,
    setShowYourself,
    setSelectedNodeId,
    setLanguage,
    onInfoModalOpen,
  ]);

  // Track when initial URL-to-atom sync is complete
  // This only checks that the view mode matches - user filter changes should not affect this
  const isInitialized = useMemo(() => {
    const targetView = (queryParams.view as GraphViewMode) || 'general';

    // Only verify the view mode matches - user filter changes are valid after initialization
    return graphView === targetView;
  }, [queryParams.view, graphView]);

  // Sync showYourself atom changes to URL (after initial load)
  useEffect(() => {
    // Skip during initialization
    if (!initializedRef.current) return;

    // Only sync if different from current URL state
    if (showYourself !== queryParams.showYourself) {
      setQueryParams((prev) => ({ ...prev, showYourself }));
    }
  }, [showYourself, queryParams.showYourself, setQueryParams]);

  // Fetch all graph data (no server-side filtering)
  // TODO: Re-enable server-side filtering when dataset grows significantly (10,000+ nodes)
  const { data: graphData, isLoading: isGraphLoading, error: graphError } = useGenealogyGraph();

  // Find selected node from graph data
  const selectedNode = useMemo(() => {
    if (!selectedNodeId || !graphData) return null;
    return graphData.nodes.find((n) => n.id === selectedNodeId) || null;
  }, [selectedNodeId, graphData]);

  // Compute filtered nodes and stats for display in GraphControls
  // This mirrors the filtering logic in GenealogyGraph
  const { filteredNodes, filteredNodeIds, filteredStats } = useMemo(() => {
    if (!graphData) return { filteredNodes: [], filteredNodeIds: new Set<string>(), filteredStats: undefined };

    const nodeTypeSet = new Set(filters.nodeTypes);
    const predicateSet = new Set(filters.predicates);

    const nodes = graphData.nodes.filter((node) => nodeTypeSet.has(node.type));
    const nodeIds = new Set(nodes.map((n) => n.id));

    const links = graphData.links.filter((link) => {
      const sourceId = typeof link.source === 'string' ? link.source : (link.source as { id: string }).id;
      const targetId = typeof link.target === 'string' ? link.target : (link.target as { id: string }).id;
      if (!nodeIds.has(sourceId) || !nodeIds.has(targetId)) return false;
      if (!predicateSet.has(link.type)) return false;
      return true;
    });

    return {
      filteredNodes: nodes,
      filteredNodeIds: nodeIds,
      filteredStats: {
        totalNodes: nodes.length,
        totalLinks: links.length,
        personCount: nodes.filter((n) => n.type === 'person').length,
        groupCount: nodes.filter((n) => n.type === 'group').length,
      },
    };
  }, [graphData, filters]);

  // Fetch details for selected node
  const { data: nodeDetails, isLoading: isDetailsLoading } = useNodeDetails(
    selectedNode?.type || null,
    selectedNode?.id || null
  );

  // Handle node selection from graph
  const handleNodeClick = useCallback(
    (node: GraphNode) => {
      setSelectedNodeId(node.id);
      setQueryParams((prev) => ({ ...prev, node: node.id }));
    },
    [setSelectedNodeId, setQueryParams]
  );

  // Handle background click (deselect)
  const handleBackgroundClick = useCallback(() => {
    setSelectedNodeId(null);
    setQueryParams((prev) => ({ ...prev, node: null }));
  }, [setSelectedNodeId, setQueryParams]);

  // Handle close details panel
  const handleCloseDetails = useCallback(() => {
    setSelectedNodeId(null);
    setQueryParams((prev) => ({ ...prev, node: null }));
  }, [setSelectedNodeId, setQueryParams]);

  // Handle selecting a related node from the details panel
  const handleNodeSelectFromDetails = useCallback(
    (_entityType: string, entityId: string) => {
      setSelectedNodeId(entityId);
      setQueryParams((prev) => ({ ...prev, node: entityId }));
    },
    [setSelectedNodeId, setQueryParams]
  );

  // Handle search selection
  const handleSearchSelect = useCallback(
    (nodeId: string | null) => {
      setSelectedNodeId(nodeId);
      setQueryParams((prev) => ({ ...prev, node: nodeId }));
    },
    [setSelectedNodeId, setQueryParams]
  );

  // Handle graph view change - clear selection when switching views
  const handleGraphViewChange = useCallback(
    (newView: string) => {
      const viewMode = newView as GraphViewMode;
      const newConfig = getViewConfig(viewMode);
      setGraphView(viewMode);
      setSelectedNodeId(null);
      setShowYourself(false); // Reset showYourself when changing views
      // Reset filters to new view's defaults
      setFilters({
        nodeTypes: [...newConfig.allowedNodeTypes],
        predicates: [...newConfig.allowedPredicates],
      });
      // Update URL params
      setQueryParams({ view: viewMode, node: null, showYourself: false });
    },
    [setGraphView, setSelectedNodeId, setShowYourself, setFilters, setQueryParams]
  );

  return (
    <div className="flex h-[calc(100vh-4rem)] flex-col">
      {/* Header - responsive layout */}
      <div className="border-b border-default-200 px-4 py-3">
        <div className={`flex items-center gap-4 ${isMobile ? 'flex-col' : 'justify-between'}`}>
          {/* Title section */}
          <div className={`flex items-center gap-2 ${isMobile ? 'w-full justify-center' : 'shrink-0'}`}>
            <div className={isMobile ? 'text-center' : ''}>
              <h1 className="text-xl font-bold">Capoeira Genealogy</h1>
              {!isMobile && (
                <p className="text-small text-default-500">
                  Explore the lineages and relationships of the capoeira community
                </p>
              )}
            </div>
            <Button
              isIconOnly
              variant="light"
              size="sm"
              onPress={onInfoModalOpen}
              aria-label="About this project"
              className="text-primary"
            >
              <Info className="h-5 w-5" />
            </Button>
          </div>

          {/* Beta badge - hidden on mobile */}
          {!isMobile && (
            <div className="flex shrink-0 items-center gap-3 self-center rounded-xl border border-warning-200 px-3 py-1.5 text-small text-default-500">
              <Chip size="sm" color="warning" variant="flat">
                BETA
              </Chip>
              <span>
                Under active development. Interested?{' '}
                <Link href="mailto:support@quilombo.net" size="sm" underline="hover">
                  Get in touch
                </Link>
              </span>
            </div>
          )}

          {/* Search and View selector - responsive */}
          <div className={`flex items-center gap-2 ${isMobile ? 'w-full' : 'flex-1 justify-end'}`}>
            <NodeSearch
              nodes={filteredNodes}
              selectedNodeId={selectedNodeId}
              onNodeSelect={handleSearchSelect}
              isLoading={isGraphLoading}
              isDisabled={!graphData}
              className={isMobile ? 'flex-1' : 'w-80'}
            />
            <ViewModeMenu
              value={graphView}
              onChange={handleGraphViewChange}
              isCompact={isMobile}
              isDisabled={!graphData}
            />
          </div>
        </div>
      </div>

      {/* Main content - flex layout with optional sidebar */}
      <div className="flex min-h-0 flex-1">
        {/* Desktop: Sidebar that pushes content */}
        {showSidebar && <ControlsSidebar stats={filteredStats} isLoading={isGraphLoading} nodeIds={filteredNodeIds} />}

        {/* Graph container */}
        <div className="relative flex-1 bg-default-50">
          {/* Graph area */}
          {graphError ? (
            <div className="flex h-full items-center justify-center">
              <div className="text-center">
                <p className="text-danger">Error loading graph</p>
                <p className="text-small text-default-500">{String(graphError)}</p>
              </div>
            </div>
          ) : !isInitialized || isGraphLoading ? (
            <div className="flex h-full items-center justify-center">
              <Spinner size="lg" label="Loading genealogy data..." />
            </div>
          ) : graphData ? (
            <div className="relative h-full w-full">
              <GenealogyGraph
                data={graphData}
                selectedNodeId={selectedNodeId}
                onNodeClick={handleNodeClick}
                onBackgroundClick={handleBackgroundClick}
                nodeScale={isMobile ? 1.5 : 1.0}
              />
              <GraphLegend />
            </div>
          ) : null}

          {/* Mobile/Tablet: Overlay drawer */}
          {!showSidebar && (
            <ControlsDrawer stats={filteredStats} isLoading={isGraphLoading} nodeIds={filteredNodeIds} />
          )}

          {/* Details Drawer - right/bottom overlay based on device */}
          <DetailsDrawer
            node={selectedNode}
            details={nodeDetails || null}
            allNodes={graphData?.nodes || []}
            isLoading={isDetailsLoading}
            onClose={handleCloseDetails}
            onNodeSelect={handleNodeSelectFromDetails}
          />
        </div>
      </div>

      {/* Info Modal */}
      <GenealogyInfoModal isOpen={isInfoModalOpen} onClose={onInfoModalClose} />
    </div>
  );
}
