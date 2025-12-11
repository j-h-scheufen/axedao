/**
 * Graph View Configuration
 *
 * Defines what node types, predicates, and legend items each graph view supports.
 * This configuration drives the filter controls and legend components.
 */

import type { EntityType, Predicate } from '@/db/schema/genealogy';

import { NODE_COLORS, LINK_COLORS, PREDICATE_LABELS } from '@/components/genealogy/types';

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
  'Person → Person': ['student_of', 'trained_under', 'influenced_by', 'granted_title_to', 'baptized_by', 'family_of'],
  'Person → Group': [
    'founded',
    'co_founded',
    'leads',
    'regional_coordinator_of',
    'member_of',
    'teaches_at',
    'cultural_pioneer_of',
    'associated_with',
    'departed_from',
  ],
  'Group → Group': ['part_of', 'split_from_group', 'merged_into', 'evolved_from', 'affiliated_with', 'cooperates_with'],
};

// ============================================================================
// LEGEND DATA
// ============================================================================

const PERSON_TITLE_LEGEND: LegendCategory = {
  category: 'Person Titles',
  items: [
    { label: 'Mestre', color: NODE_COLORS.person.mestre },
    { label: 'Contra-Mestre', color: NODE_COLORS.person['contra-mestre'] },
    { label: 'Professor', color: NODE_COLORS.person.professor },
    { label: 'Instrutor', color: NODE_COLORS.person.instrutor },
    { label: 'Graduado', color: NODE_COLORS.person.graduado },
    { label: 'Aluno', color: NODE_COLORS.person.aluno },
    { label: 'Historical', color: NODE_COLORS.person.default },
  ],
};

const GROUP_STYLE_LEGEND: LegendCategory = {
  category: 'Group Styles',
  items: [
    { label: 'Angola', color: NODE_COLORS.group.angola },
    { label: 'Regional', color: NODE_COLORS.group.regional },
    { label: 'Contemporânea', color: NODE_COLORS.group.contemporanea },
    { label: 'Mixed', color: NODE_COLORS.group.mixed },
  ],
};

const LINEAGE_LINK_LEGEND: LegendCategory = {
  category: 'Lineage Links',
  items: [
    { label: PREDICATE_LABELS.student_of, color: LINK_COLORS.student_of },
    { label: PREDICATE_LABELS.trained_under, color: LINK_COLORS.trained_under },
    { label: PREDICATE_LABELS.influenced_by, color: LINK_COLORS.influenced_by },
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
    'granted_title_to',
    'baptized_by',
    'family_of',
    // Person-to-Group
    'founded',
    'co_founded',
    'leads',
    'regional_coordinator_of',
    'member_of',
    'teaches_at',
    'cultural_pioneer_of',
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
    nodeCategories: [PERSON_TITLE_LEGEND, GROUP_STYLE_LEGEND],
    showNodeShapes: true,
    nodeShapes: [
      { label: 'Person', symbol: '●' },
      { label: 'Group', symbol: '⬡' },
    ],
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
    nodeCategories: [PERSON_TITLE_LEGEND, LINEAGE_LINK_LEGEND],
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
