/**
 * Genealogy Graph Types
 *
 * Types for the 3D visualization of capoeira genealogy data.
 * Aligned with the database schema in db/schema/genealogy.ts.
 */

import type { ConfidenceLevel, EntityType, Predicate, StatementProperties } from '@/db/schema/genealogy';

/**
 * Node in the graph visualization.
 * Represents either a person or a group.
 */
export interface GraphNode {
  id: string;
  name: string;
  type: EntityType;
  metadata: PersonMetadata | GroupMetadata;
}

export interface PersonMetadata {
  fullName?: string | null;
  apelido?: string | null;
  title?: string | null;
  style?: string | null;
  birthYear?: number | null;
  deathYear?: number | null;
  avatar?: string | null;
  bio?: string | null;
}

export interface GroupMetadata {
  style?: string | null;
  foundedYear?: number | null;
  logo?: string | null;
  description?: string | null;
  isActive?: boolean | null;
}

/**
 * Link/edge in the graph visualization.
 * Represents a statement (relationship) between two entities.
 */
export interface GraphLink {
  source: string;
  target: string;
  type: Predicate;
  metadata: LinkMetadata;
}

export interface LinkMetadata {
  confidence?: ConfidenceLevel;
  startedAt?: string | null;
  endedAt?: string | null;
  properties?: StatementProperties;
  source?: string | null; // Citation/reference
}

/**
 * Complete graph data structure returned from API.
 */
export interface GraphData {
  nodes: GraphNode[];
  links: GraphLink[];
  stats: GraphStats;
}

export interface GraphStats {
  totalNodes: number;
  totalLinks: number;
  personCount: number;
  groupCount: number;
}

/**
 * Filter configuration for the graph.
 */
export interface GraphFilters {
  nodeTypes: EntityType[];
  predicates: Predicate[];
}

/**
 * Node details with relationships.
 * Returned when fetching details for a selected node.
 */
export interface NodeDetails {
  type: EntityType;
  data: PersonDetails | GroupDetails;
  relationships: {
    outgoing: StatementDetail[];
    incoming: StatementDetail[];
  };
}

export interface PersonDetails {
  id: string;
  name?: string | null;
  apelido?: string | null;
  title?: string | null;
  style?: string | null;
  birthYear?: number | null;
  birthYearPrecision?: string | null;
  birthPlace?: string | null;
  deathYear?: number | null;
  deathYearPrecision?: string | null;
  deathPlace?: string | null;
  avatar?: string | null;
  bio?: string | null;
  achievements?: string | null;
}

export interface GroupDetails {
  id: string;
  description?: string | null;
  style?: string | null;
  foundedYear?: number | null;
  foundedYearPrecision?: string | null;
  foundedLocation?: string | null;
  philosophy?: string | null;
  logo?: string | null;
  isActive?: boolean | null;
  nameAliases?: string[] | null;
}

export interface StatementDetail {
  id: string;
  subjectType: EntityType;
  subjectId: string;
  predicate: Predicate;
  objectType: EntityType;
  objectId: string;
  startedAt?: string | null;
  endedAt?: string | null;
  confidence?: ConfidenceLevel;
  source?: string | null;
  notes?: string | null;
  properties?: StatementProperties;
}

/**
 * Full person profile with all bilingual fields.
 * Used for the Full Details modal display.
 */
export interface PersonFullProfile {
  id: string;
  name?: string | null;
  apelido?: string | null;
  apelidoContext?: string | null;
  title?: string | null;
  portrait?: string | null;
  publicLinks?: string[] | null;
  style?: string | null;
  styleNotesEn?: string | null;
  styleNotesPt?: string | null;
  birthYear?: number | null;
  birthYearPrecision?: string | null;
  birthPlace?: string | null;
  deathYear?: number | null;
  deathYearPrecision?: string | null;
  deathPlace?: string | null;
  bioEn?: string | null;
  bioPt?: string | null;
  achievementsEn?: string | null;
  achievementsPt?: string | null;
  notesEn?: string | null;
  notesPt?: string | null;
  createdAt?: string | null;
  updatedAt?: string | null;
}

/**
 * Name history entry for groups.
 */
export interface NameHistoryEntry {
  name: string;
  startedAt: string;
  endedAt?: string;
  changeReason?: string;
  context?: string;
}

/**
 * Full group profile with all bilingual fields.
 * Used for the Full Details modal display.
 */
export interface GroupFullProfile {
  id: string;
  name: string;
  descriptionEn?: string | null;
  descriptionPt?: string | null;
  style?: string | null;
  styleNotesEn?: string | null;
  styleNotesPt?: string | null;
  logo?: string | null;
  publicLinks?: string[] | null;
  nameAliases?: string[] | null;
  foundedYear?: number | null;
  foundedYearPrecision?: string | null;
  foundedLocation?: string | null;
  philosophyEn?: string | null;
  philosophyPt?: string | null;
  historyEn?: string | null;
  historyPt?: string | null;
  nameHistory?: NameHistoryEntry[] | null;
  notesEn?: string | null;
  notesPt?: string | null;
  legalStructure?: string | null;
  isHeadquarters?: boolean | null;
  isActive?: boolean | null;
  dissolvedAt?: string | null;
  createdAt?: string | null;
  updatedAt?: string | null;
}

/**
 * Visual styling configuration for nodes.
 */
export const NODE_COLORS = {
  person: {
    mestre: '#FFD700', // Gold
    'contra-mestre': '#C0C0C0', // Silver
    professor: '#4DABF7', // Blue
    instrutor: '#51CF66', // Green
    graduado: '#868E96', // Gray
    aluno: '#ADB5BD', // Light gray
    default: '#A0522D', // Warm bronze/sepia - historical figures pre-title system
  },
  group: {
    angola: '#FA5252', // Red
    regional: '#4C6EF5', // Blue
    contemporanea: '#9775FA', // Purple
    mixed: '#FD7E14', // Orange
    default: '#339AF0', // Default blue
  },
} as const;

/**
 * Visual styling configuration for links.
 */
export const LINK_COLORS = {
  // Person-to-Person: Training & Lineage
  student_of: '#FFD700', // Gold - most important relationship
  trained_under: '#F06595', // Pink
  influenced_by: '#CC5DE8', // Purple
  // Person-to-Person: Recognition
  received_title_from: '#5C7CFA', // Blue
  baptized_by: '#339AF0', // Light blue
  // Person-to-Person: Family
  family_of: '#22B8CF', // Cyan
  // Person-to-Group: Founding & Leadership
  founded: '#20C997', // Teal
  co_founded: '#51CF66', // Green
  leads: '#94D82D', // Lime
  regional_coordinator_of: '#FCC419', // Yellow
  // Person-to-Group: Membership & Affiliation
  member_of: '#FF922B', // Orange
  teaches_at: '#F76707', // Dark orange
  cultural_pioneer_of: '#FA5252', // Red
  associated_with: '#E64980', // Pink-red
  departed_from: '#7950F2', // Violet
  // Group-to-Group: Hierarchical
  part_of: '#4C6EF5', // Indigo
  // Group-to-Group: Evolution
  split_from_group: '#228BE6', // Blue
  merged_into: '#15AABF', // Cyan
  evolved_from: '#82C91E', // Lime green
  // Group-to-Group: Affiliation
  affiliated_with: '#FAB005', // Amber
  cooperates_with: '#FD7E14', // Orange
  // Default
  default: '#868E96', // Gray
} as const;

/**
 * Human-readable labels for predicates (outgoing direction).
 * E.g., "A is student_of B" → "Student of"
 */
export const PREDICATE_LABELS: Record<Predicate, string> = {
  // Person-to-Person
  student_of: 'Student of',
  trained_under: 'Trained under',
  influenced_by: 'Influenced by',
  received_title_from: 'Received title from',
  baptized_by: 'Baptized by',
  family_of: 'Family of',
  // Person-to-Group
  founded: 'Founded',
  co_founded: 'Co-founded',
  leads: 'Leads',
  regional_coordinator_of: 'Regional coordinator of',
  member_of: 'Member of',
  teaches_at: 'Teaches at',
  cultural_pioneer_of: 'Cultural pioneer of',
  associated_with: 'Associated with',
  departed_from: 'Departed from',
  // Group-to-Group
  part_of: 'Part of',
  split_from_group: 'Split from',
  merged_into: 'Merged into',
  evolved_from: 'Evolved from',
  affiliated_with: 'Affiliated with',
  cooperates_with: 'Cooperates with',
};

/**
 * Human-readable labels for predicates (incoming/inverse direction).
 * E.g., "A is student_of B" from B's perspective → "Teacher of"
 */
export const PREDICATE_LABELS_INVERSE: Record<Predicate, string> = {
  // Person-to-Person
  student_of: 'Teacher of',
  trained_under: 'Trained',
  influenced_by: 'Influenced',
  received_title_from: 'Granted title to',
  baptized_by: 'Baptized',
  family_of: 'Family of',
  // Person-to-Group
  founded: 'Founded by',
  co_founded: 'Co-founded by',
  leads: 'Led by',
  regional_coordinator_of: 'Regional coordinator',
  member_of: 'Member',
  teaches_at: 'Teacher',
  cultural_pioneer_of: 'Cultural pioneer',
  associated_with: 'Associated with',
  departed_from: 'Departed by',
  // Group-to-Group
  part_of: 'Contains',
  split_from_group: 'Split into',
  merged_into: 'Merged from',
  evolved_from: 'Evolved into',
  affiliated_with: 'Affiliated with',
  cooperates_with: 'Cooperates with',
};
