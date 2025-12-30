/**
 * Graph View Configuration
 *
 * Defines what node types, predicates, and legend items each graph view supports.
 * This configuration drives the filter controls and legend components.
 */

import type { EntityType, Predicate } from '@/db/schema/genealogy';
import { TITLE_LEVEL_OPTIONS } from '@/utils/genealogy/titleFilter';

import { NODE_COLORS, NODE_COLORS_BY_TITLE_LEVEL, LINK_COLORS, PREDICATE_LABELS } from '@/components/genealogy/types';
import { ANCESTRY_MIN_TITLE_LEVEL, GENERAL_MIN_TITLE_LEVEL } from '@/components/genealogy/graphs/constants';

// ============================================================================
// TYPES
// ============================================================================

export type GraphViewMode = 'general' | 'student-ancestry';

export interface LegendItem {
  label: string;
  color: string;
}

export interface LegendCategory {
  category: string;
  items: LegendItem[];
}

/**
 * Configuration for a graph view mode.
 * Defines what nodes, links, and legend items are available.
 */
export interface GraphViewConfig {
  /** Unique identifier for the view */
  id: GraphViewMode;
  /** Display label for the view selector */
  label: string;
  /** Description shown in the header */
  description: string;
  /** Node types that can appear in this view */
  allowedNodeTypes: EntityType[];
  /** Predicates that can appear in this view (visible or not) */
  allowedPredicates: Predicate[];
  /** Legend configuration */
  legend: {
    /** Node color categories to show */
    nodeCategories: LegendCategory[];
    /** Whether to show node shape legend */
    showNodeShapes: boolean;
    /** Node shapes to display (if showNodeShapes is true) */
    nodeShapes?: { label: string; symbol: string }[];
    /** Whether to show dynamic relationship colors based on filter selection */
    showDynamicRelationships?: boolean;
  };
}

// ============================================================================
// STUDENT ANCESTRY VIEW PREDICATES
// ============================================================================

/** Predicates rendered as visible links in student ancestry view */
export const STUDENT_ANCESTRY_VISIBLE_PREDICATES: ReadonlySet<string> = new Set(['student_of', 'trained_under']);

/** Predicates that affect physics (gravity) but are not rendered in student ancestry view */
export const STUDENT_ANCESTRY_GRAVITY_ONLY_PREDICATES: ReadonlySet<string> = new Set([
  'associated_with',
  'influenced_by',
]);

/** All predicates used in student ancestry view (visible + gravity-only) */
export const STUDENT_ANCESTRY_ALL_PREDICATES: ReadonlySet<string> = new Set([
  ...STUDENT_ANCESTRY_VISIBLE_PREDICATES,
  ...STUDENT_ANCESTRY_GRAVITY_ONLY_PREDICATES,
]);

// ============================================================================
// PREDICATE GROUPS
// ============================================================================

/**
 * Predicates grouped by relationship category.
 * Used for organizing filter controls.
 */
export const PREDICATE_GROUPS: Record<string, Predicate[]> = {
  'Person → Person': [
    'student_of',
    'trained_under',
    'influenced_by',
    'received_title_from',
    'baptized_by',
    'family_of',
  ],
  'Person → Group': [
    'founded',
    'co_founded',
    'leads',
    'regional_coordinator_of',
    'member_of',
    'teaches_at',
    'associated_with',
    'departed_from',
  ],
  'Group → Group': ['part_of', 'split_from_group', 'merged_into', 'evolved_from', 'affiliated_with', 'cooperates_with'],
};

// ============================================================================
// LEGEND DATA
// ============================================================================

/**
 * Generate person title legend items based on the minimum title level for a view.
 * Uses level-based colors from NODE_COLORS_BY_TITLE_LEVEL for consistency with node rendering.
 *
 * @param minLevel - Minimum title level shown in the view (0 = mestre, 1 = contra-mestre, etc.)
 * @returns LegendCategory with filtered title items
 */
function createPersonTitleLegend(minLevel: number): LegendCategory {
  // Filter to only levels that are shown in this view (level <= minLevel means higher or equal rank)
  const visibleLevels = TITLE_LEVEL_OPTIONS.filter((opt) => opt.level <= minLevel);

  const items: LegendItem[] = visibleLevels.map((opt) => ({
    // Use the first part of the label (e.g., "Mestre" from "Mestre/Mestra")
    label: opt.label.split('/')[0],
    color: NODE_COLORS_BY_TITLE_LEVEL[opt.level] ?? NODE_COLORS.person.default,
  }));

  // Always add "Historical" for figures without titles
  items.push({ label: 'Historical', color: NODE_COLORS.person.default });

  return {
    category: 'Person Titles',
    items,
  };
}

/** Person title legend for general view (professor and above) */
const GENERAL_PERSON_TITLE_LEGEND = createPersonTitleLegend(GENERAL_MIN_TITLE_LEVEL);

/** Person title legend for ancestry view (contra-mestre and above) */
const ANCESTRY_PERSON_TITLE_LEGEND = createPersonTitleLegend(ANCESTRY_MIN_TITLE_LEVEL);

const LINEAGE_LINK_LEGEND: LegendCategory = {
  category: 'Lineage Links',
  items: [
    { label: PREDICATE_LABELS.student_of, color: LINK_COLORS.student_of },
    { label: PREDICATE_LABELS.trained_under, color: LINK_COLORS.trained_under },
    // Note: influenced_by is gravity-only (affects layout but not rendered as visible links)
  ],
};

// ============================================================================
// VIEW CONFIGURATIONS
// ============================================================================

export const GENERAL_VIEW_CONFIG: GraphViewConfig = {
  id: 'general',
  label: 'General View',
  description: 'All nodes and relationships in 3D space',
  allowedNodeTypes: ['person', 'group'],
  allowedPredicates: [
    // Person-to-Person
    'student_of',
    'trained_under',
    'influenced_by',
    'received_title_from',
    'baptized_by',
    'family_of',
    // Person-to-Group
    'founded',
    'co_founded',
    'leads',
    'regional_coordinator_of',
    'member_of',
    'teaches_at',
    'associated_with',
    'departed_from',
    // Group-to-Group
    'part_of',
    'split_from_group',
    'merged_into',
    'evolved_from',
    'affiliated_with',
    'cooperates_with',
  ],
  legend: {
    nodeCategories: [GENERAL_PERSON_TITLE_LEGEND],
    showNodeShapes: false,
    showDynamicRelationships: true,
  },
};

export const STUDENT_ANCESTRY_VIEW_CONFIG: GraphViewConfig = {
  id: 'student-ancestry',
  label: 'Student Ancestry',
  description: 'Radial timeline of teaching lineages',
  allowedNodeTypes: ['person'],
  // Only visible predicates shown in filter menu (gravity-only predicates are handled by the graph component)
  allowedPredicates: [...STUDENT_ANCESTRY_VISIBLE_PREDICATES] as Predicate[],
  legend: {
    nodeCategories: [ANCESTRY_PERSON_TITLE_LEGEND, LINEAGE_LINK_LEGEND],
    showNodeShapes: false,
  },
};

/**
 * Map of view mode to configuration.
 */
export const VIEW_CONFIGS: Record<GraphViewMode, GraphViewConfig> = {
  general: GENERAL_VIEW_CONFIG,
  'student-ancestry': STUDENT_ANCESTRY_VIEW_CONFIG,
};

/**
 * Get configuration for a view mode.
 */
export function getViewConfig(viewMode: GraphViewMode): GraphViewConfig {
  return VIEW_CONFIGS[viewMode];
}

/**
 * Get predicate groups filtered to only include predicates allowed in the view.
 */
export function getFilteredPredicateGroups(config: GraphViewConfig): Record<string, Predicate[]> {
  const allowedSet = new Set(config.allowedPredicates);
  const filtered: Record<string, Predicate[]> = {};

  for (const [groupName, predicates] of Object.entries(PREDICATE_GROUPS)) {
    const allowedInGroup = predicates.filter((p) => allowedSet.has(p));
    if (allowedInGroup.length > 0) {
      filtered[groupName] = allowedInGroup;
    }
  }

  return filtered;
}

/**
 * View selector options for the dropdown.
 */
export const GRAPH_VIEW_OPTIONS = [
  { key: GENERAL_VIEW_CONFIG.id, label: `${GENERAL_VIEW_CONFIG.label} - ${GENERAL_VIEW_CONFIG.description}` },
  {
    key: STUDENT_ANCESTRY_VIEW_CONFIG.id,
    label: `${STUDENT_ANCESTRY_VIEW_CONFIG.label} - ${STUDENT_ANCESTRY_VIEW_CONFIG.description}`,
  },
] as const;
