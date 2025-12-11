/**
 * Jotai atoms for genealogy graph state.
 *
 * Centralizes filter and view state for sharing between components
 * (GraphControls, GraphLegend, GenealogyGraph).
 */

import { atom } from 'jotai';

import { type GraphViewMode, GENERAL_VIEW_CONFIG, getViewConfig } from '@/components/genealogy/config';
import type { GraphFilters } from '@/components/genealogy/types';

/**
 * Current graph view mode.
 */
export const graphViewModeAtom = atom<GraphViewMode>('general');

/**
 * Current view configuration (derived from view mode).
 */
export const viewConfigAtom = atom((get) => getViewConfig(get(graphViewModeAtom)));

/**
 * User-selected filters for nodes and predicates.
 * Initialized with all allowed types and predicates for the default view.
 */
export const graphFiltersAtom = atom<GraphFilters>({
  nodeTypes: [...GENERAL_VIEW_CONFIG.allowedNodeTypes],
  predicates: [...GENERAL_VIEW_CONFIG.allowedPredicates],
});

/**
 * Currently selected node ID (for highlighting and details panel).
 */
export const selectedNodeIdAtom = atom<string | null>(null);
