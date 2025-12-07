'use client';

import { useQuery } from '@tanstack/react-query';

import type { GraphData, GraphFilters, NodeDetails } from '@/components/genealogy/types';

const QUERY_KEYS = {
  graph: (filters: GraphFilters) => ['genealogy-graph', filters] as const,
  nodeDetails: (entityType: string, entityId: string) => ['genealogy-node', entityType, entityId] as const,
};

/**
 * Fetch graph data with optional filters.
 */
export function useGenealogyGraph(filters: GraphFilters) {
  return useQuery<GraphData>({
    queryKey: QUERY_KEYS.graph(filters),
    queryFn: async () => {
      const params = new URLSearchParams();

      if (filters.nodeTypes.length > 0) {
        params.set('nodeTypes', filters.nodeTypes.join(','));
      }
      if (filters.predicates.length > 0) {
        params.set('predicates', filters.predicates.join(','));
      }

      const res = await fetch(`/api/genealogy/graph?${params.toString()}`);
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || 'Failed to fetch graph data');
      }
      return res.json();
    },
    staleTime: 1000 * 60 * 5, // 5 minutes
    gcTime: 1000 * 60 * 30, // 30 minutes
  });
}

/**
 * Fetch details for a specific node (person or group).
 */
export function useNodeDetails(entityType: string | null, entityId: string | null) {
  return useQuery<NodeDetails>({
    queryKey: QUERY_KEYS.nodeDetails(entityType || '', entityId || ''),
    queryFn: async () => {
      if (!entityType || !entityId) {
        throw new Error('Entity type and ID are required');
      }

      const res = await fetch(`/api/genealogy/${entityType}s/${entityId}?includeRelationships=true`);
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || 'Failed to fetch node details');
      }

      const data = await res.json();

      // Transform API response to NodeDetails format
      // API returns { data: PersonProfile | GroupProfile, relationships: { outgoing, incoming } }
      return {
        type: entityType,
        data: data.data,
        relationships: data.relationships || { outgoing: [], incoming: [] },
      } as NodeDetails;
    },
    enabled: !!entityType && !!entityId,
    staleTime: 1000 * 60 * 5,
  });
}
