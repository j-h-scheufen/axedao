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

/**
 * Tracks whether the selected node needs refocusing (camera moved away).
 */
export const needsRefocusAtom = atom<boolean>(false);

/**
 * Holds the refocus callback function set by the graph component.
 * When called, it will center the camera on the selected node.
 */
export const refocusCallbackAtom = atom<(() => void) | null>(null);

/**
 * Holds the recenter callback function set by the graph component.
 * When called, it will zoom to fit the entire graph in view.
 */
export const recenterCallbackAtom = atom<(() => void) | null>(null);

/**
 * Graph settings - independent of view configuration.
 */
export interface GraphSettings {
  /** Show link particle animations */
  showAnimations: boolean;
}

/**
 * User graph settings (persisted across view changes).
 */
export const graphSettingsAtom = atom<GraphSettings>({
  showAnimations: false,
});

// ============================================================================
// "Show Yourself" Feature - Display user's node with filtered ancestors
// ============================================================================

/**
 * Whether to show the current user's node on the graph.
 * When enabled, displays user's person profile + filtered ancestors.
 * Only applicable in 'student-ancestry' view mode.
 */
export const showYourselfAtom = atom<boolean>(false);

// ============================================================================
// Details Drawer State - for camera offset when drawer covers graph
// ============================================================================

/**
 * Whether the details drawer is open on mobile (portrait or landscape).
 * Used by the graph to re-center the node when the drawer closes.
 */
export const mobileDrawerOpenAtom = atom<boolean>(false);
