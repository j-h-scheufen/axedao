'use client';

import { Select, SelectItem, Spinner } from '@heroui/react';
import dynamic from 'next/dynamic';
import { useCallback, useState } from 'react';

import { GraphControls, GraphLegend, NodeDetailsPanel } from '@/components/genealogy/ui';
import type { GraphFilters, GraphNode } from '@/components/genealogy/types';
import { entityTypes } from '@/config/constants';

import { useGenealogyGraph, useNodeDetails } from '@/hooks/useGenealogyData';

// Dynamically import the 3D graph components (require WebGL, client-side only)
const StudentAncestryGraph = dynamic(
  () => import('@/components/genealogy/graphs/StudentAncestryGraph').then((mod) => mod.StudentAncestryGraph),
  {
    ssr: false,
    loading: () => (
      <div className="flex h-full items-center justify-center">
        <Spinner size="lg" label="Loading 3D graph..." />
      </div>
    ),
  }
);

const GeneralGenealogyGraph = dynamic(
  () => import('@/components/genealogy/graphs/GeneralGenealogyGraph').then((mod) => mod.GeneralGenealogyGraph),
  {
    ssr: false,
    loading: () => (
      <div className="flex h-full items-center justify-center">
        <Spinner size="lg" label="Loading 3D graph..." />
      </div>
    ),
  }
);

type GraphView = 'general' | 'student-ancestry';

const GRAPH_VIEWS = [
  { key: 'general', label: 'General View - All Nodes & Relationships' },
  { key: 'student-ancestry', label: 'Student Ancestry - Radial Timeline' },
] as const;

export default function GenealogyPage() {
  // Graph view state
  const [graphView, setGraphView] = useState<GraphView>('general');

  // Filter state
  const [filters, setFilters] = useState<GraphFilters>({
    nodeTypes: [...entityTypes],
    predicates: [],
  });

  // Selected node state
  const [selectedNode, setSelectedNode] = useState<GraphNode | null>(null);

  // Fetch graph data
  const { data: graphData, isLoading: isGraphLoading, error: graphError } = useGenealogyGraph(filters);

  // Fetch details for selected node
  const { data: nodeDetails, isLoading: isDetailsLoading } = useNodeDetails(
    selectedNode?.type || null,
    selectedNode?.id || null
  );

  // Handle node selection from graph
  const handleNodeClick = useCallback((node: GraphNode) => {
    setSelectedNode(node);
  }, []);

  // Handle background click (deselect)
  const handleBackgroundClick = useCallback(() => {
    setSelectedNode(null);
  }, []);

  // Handle close details panel
  const handleCloseDetails = useCallback(() => {
    setSelectedNode(null);
  }, []);

  // Handle selecting a related node from the details panel
  const handleNodeSelectFromDetails = useCallback(
    (_entityType: string, entityId: string) => {
      const node = graphData?.nodes.find((n) => n.id === entityId);
      if (node) {
        setSelectedNode(node);
      }
    },
    [graphData?.nodes]
  );

  // Handle filter changes
  const handleFiltersChange = useCallback((newFilters: GraphFilters) => {
    setFilters(newFilters);
  }, []);

  // Handle graph view change - clear selection to reset state
  const handleGraphViewChange = useCallback((newView: GraphView) => {
    setGraphView(newView);
    setSelectedNode(null); // Clear selection when switching views
  }, []);

  return (
    <div className="flex h-[calc(100vh-4rem)] flex-col">
      {/* Header */}
      <div className="border-b border-default-200 px-4 py-3">
        <div className="flex items-center justify-between gap-4">
          <div className="flex-1">
            <h1 className="text-xl font-bold">Capoeira Genealogy</h1>
            <p className="text-small text-default-500">
              Explore the lineages and relationships of the capoeira community
            </p>
          </div>
          <div className="w-80">
            <Select
              label="Graph View"
              selectedKeys={[graphView]}
              onChange={(e) => handleGraphViewChange(e.target.value as GraphView)}
              size="sm"
              variant="bordered"
            >
              {GRAPH_VIEWS.map((view) => (
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
          <GraphControls
            filters={filters}
            onFiltersChange={handleFiltersChange}
            stats={graphData?.stats}
            isLoading={isGraphLoading}
          />
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
            <div key={graphView} className="relative h-full w-full">
              {graphView === 'general' ? (
                <GeneralGenealogyGraph
                  data={graphData}
                  selectedNodeId={selectedNode?.id || null}
                  onNodeClick={handleNodeClick}
                  onBackgroundClick={handleBackgroundClick}
                />
              ) : (
                <StudentAncestryGraph
                  data={graphData}
                  selectedNodeId={selectedNode?.id || null}
                  onNodeClick={handleNodeClick}
                  onBackgroundClick={handleBackgroundClick}
                />
              )}
              <GraphLegend />
            </div>
          ) : null}
        </div>

        {/* Right panel - Details */}
        <div className="w-80 shrink-0 overflow-hidden border-l border-default-200">
          <NodeDetailsPanel
            node={selectedNode}
            details={nodeDetails || null}
            isLoading={isDetailsLoading}
            onClose={handleCloseDetails}
            onNodeSelect={handleNodeSelectFromDetails}
          />
        </div>
      </div>
    </div>
  );
}
