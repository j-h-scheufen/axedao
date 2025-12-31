'use client';

import { useQuery } from '@tanstack/react-query';

import type { GraphData, NodeDetails } from '@/components/genealogy/types';

const QUERY_KEYS = {
  graph: ['genealogy-graph'] as const,
  nodeDetails: (entityType: string, entityId: string) => ['genealogy-node', entityType, entityId] as const,
  ancestors: (personId: string) => ['genealogy-ancestors', personId] as const,
};

/**
 * Fetch all graph data for visualization.
 *
 * Returns all nodes and links without server-side filtering.
 * Filtering is applied client-side based on view mode and user selections.
 *
 * TODO: When the dataset grows significantly (10,000+ nodes), consider:
 * - Re-enabling server-side filtering via API query params
 * - Implementing pagination or lazy loading
 * - Using a more efficient data transfer format
 */
export function useGenealogyGraph() {
  return useQuery<GraphData>({
    queryKey: QUERY_KEYS.graph,
    queryFn: async () => {
      const res = await fetch('/api/public/genealogy/graph');
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

      const res = await fetch(`/api/public/genealogy/${entityType}s/${entityId}?includeRelationships=true`);
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

/**
 * Fetch ancestor IDs for a person profile.
 * Used by the "Show Yourself" feature to display user's lineage on the graph.
 *
 * Traverses student_of and trained_under relationships recursively.
 *
 * @param profileId - The person profile ID to fetch ancestors for (null/undefined disables query)
 * @param options - Query options
 * @param options.maxDepth - Maximum depth to traverse (default: 50)
 * @param options.enabled - Whether the query is enabled (default: true when profileId exists)
 * @returns Query result with ancestorIds array
 */
export function useUserAncestry(
  profileId: string | null | undefined,
  options?: { maxDepth?: number; enabled?: boolean }
) {
  const { maxDepth = 50, enabled = true } = options || {};

  return useQuery<{ ancestorIds: string[] }>({
    queryKey: QUERY_KEYS.ancestors(profileId || ''),
    queryFn: async () => {
      if (!profileId) {
        return { ancestorIds: [] };
      }

      const params = new URLSearchParams();
      if (maxDepth !== 50) {
        params.set('maxDepth', maxDepth.toString());
      }

      const url = `/api/genealogy/persons/${profileId}/ancestors${params.toString() ? `?${params}` : ''}`;
      const res = await fetch(url);

      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || 'Failed to fetch ancestry data');
      }

      return res.json();
    },
    enabled: !!profileId && enabled,
    staleTime: 1000 * 60 * 10, // 10 minutes - ancestry data is relatively stable
    gcTime: 1000 * 60 * 60, // 1 hour
  });
}
