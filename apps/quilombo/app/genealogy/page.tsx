'use client';

import { Chip, Link, Select, SelectItem, Spinner } from '@heroui/react';
import { useAtom } from 'jotai';
import dynamic from 'next/dynamic';
import { useCallback, useMemo } from 'react';

import { type GraphViewMode, GRAPH_VIEW_OPTIONS, getViewConfig } from '@/components/genealogy/config';
import { graphFiltersAtom, graphViewModeAtom, selectedNodeIdAtom } from '@/components/genealogy/state';
import type { GraphNode } from '@/components/genealogy/types';
import { GraphControls, GraphLegend, NodeDetailsPanel, NodeSearch } from '@/components/genealogy/ui';

import { useGenealogyGraph, useNodeDetails } from '@/hooks/useGenealogyData';

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
  // Jotai state
  const [graphView, setGraphView] = useAtom(graphViewModeAtom);
  const [filters, setFilters] = useAtom(graphFiltersAtom);
  const [selectedNodeId, setSelectedNodeId] = useAtom(selectedNodeIdAtom);

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
  const { filteredNodes, filteredStats } = useMemo(() => {
    if (!graphData) return { filteredNodes: [], filteredStats: undefined };

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
    },
    [setSelectedNodeId]
  );

  // Handle background click (deselect)
  const handleBackgroundClick = useCallback(() => {
    setSelectedNodeId(null);
  }, [setSelectedNodeId]);

  // Handle close details panel
  const handleCloseDetails = useCallback(() => {
    setSelectedNodeId(null);
  }, [setSelectedNodeId]);

  // Handle selecting a related node from the details panel
  const handleNodeSelectFromDetails = useCallback(
    (_entityType: string, entityId: string) => {
      setSelectedNodeId(entityId);
    },
    [setSelectedNodeId]
  );

  // Handle search selection
  const handleSearchSelect = useCallback(
    (nodeId: string | null) => {
      setSelectedNodeId(nodeId);
    },
    [setSelectedNodeId]
  );

  // Handle graph view change - clear selection when switching views
  const handleGraphViewChange = useCallback(
    (newView: string) => {
      const viewMode = newView as GraphViewMode;
      const newConfig = getViewConfig(viewMode);
      setGraphView(viewMode);
      setSelectedNodeId(null);
      // Reset filters to new view's defaults
      setFilters({
        nodeTypes: [...newConfig.allowedNodeTypes],
        predicates: [...newConfig.allowedPredicates],
      });
    },
    [setGraphView, setSelectedNodeId, setFilters]
  );

  return (
    <div className="flex h-[calc(100vh-4rem)] flex-col">
      {/* Header */}
      <div className="border-b border-default-200 px-4 py-3">
        <div className="flex items-center justify-between gap-4">
          <div className="shrink-0">
            <h1 className="text-xl font-bold">Capoeira Genealogy</h1>
            <p className="text-small text-default-500">
              Explore the lineages and relationships of the capoeira community
            </p>
          </div>
          <div className="flex shrink-0 items-center gap-3 self-center rounded-xl border border-warning-200 px-3 py-1.5 text-small text-default-500">
            <Chip size="sm" color="warning" variant="flat">
              BETA
            </Chip>
            <span>
              Under actively development. Interested in helping?{' '}
              <Link href="mailto:support@quilombo.net" size="sm" underline="hover">
                Get in touch
              </Link>
            </span>
          </div>
          <div className="flex-1 flex justify-center">
            <NodeSearch
              nodes={filteredNodes}
              selectedNodeId={selectedNodeId}
              onNodeSelect={handleSearchSelect}
              isLoading={isGraphLoading}
              isDisabled={!graphData}
            />
          </div>
          <div className="w-72 shrink-0">
            <Select
              label="Graph View"
              selectedKeys={[graphView]}
              onChange={(e) => handleGraphViewChange(e.target.value)}
              size="sm"
              variant="bordered"
            >
              {GRAPH_VIEW_OPTIONS.map((view) => (
                <SelectItem key={view.key}>{view.label}</SelectItem>
              ))}
            </Select>
          </div>
        </div>
      </div>

      {/* Main content */}
      <div className="relative flex min-h-0 flex-1">
        {/* Left panel - Filters */}
        <div className="w-64 shrink-0 overflow-hidden border-r border-default-200">
          <GraphControls stats={filteredStats} isLoading={isGraphLoading} />
        </div>

        {/* Center - Graph */}
        <div className="relative min-w-0 flex-1 bg-default-50">
          {graphError ? (
            <div className="flex h-full items-center justify-center">
              <div className="text-center">
                <p className="text-danger">Error loading graph</p>
                <p className="text-small text-default-500">{String(graphError)}</p>
              </div>
            </div>
          ) : isGraphLoading ? (
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
              />
              <GraphLegend />
            </div>
          ) : null}
        </div>

        {/* Right panel - Details */}
        <div className="h-full w-80 shrink-0 overflow-y-auto border-l border-default-200">
          <NodeDetailsPanel
            node={selectedNode}
            details={nodeDetails || null}
            allNodes={graphData?.nodes || []}
            isLoading={isDetailsLoading}
            onClose={handleCloseDetails}
            onNodeSelect={handleNodeSelectFromDetails}
          />
        </div>
      </div>
    </div>
  );
}
