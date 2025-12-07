/**
 * Genealogy Schema - Capoeira Identity & Lineage Data
 *
 * This schema is fully self-contained with NO foreign keys pointing to the public schema.
 * All FKs flow FROM public TO genealogy:
 * - users.profile_id → genealogy.person_profiles.id
 * - groups.profile_id → genealogy.group_profiles.id
 *
 * This allows genealogy data to exist independently (historical figures, unclaimed profiles).
 */
import {
  boolean,
  date,
  index,
  integer,
  jsonb,
  pgSchema,
  text,
  timestamp,
  uniqueIndex,
  uuid,
  varchar,
} from 'drizzle-orm/pg-core';

import {
  confidenceLevels,
  datePrecisions,
  entityTypes,
  legalStructures,
  predicates,
  styles,
  titles,
} from '@/config/constants';
import type { SocialLink } from '../schema';

// Create the genealogy schema
export const genealogySchema = pgSchema('genealogy');

// ============================================================================
// ENUMS
// ============================================================================

export const entityTypeEnum = genealogySchema.enum('entity_type', [...entityTypes]);
export const datePrecisionEnum = genealogySchema.enum('date_precision', [...datePrecisions]);
export const confidenceEnum = genealogySchema.enum('confidence', [...confidenceLevels]);
export const legalStructureEnum = genealogySchema.enum('legal_structure', [...legalStructures]);
export const predicateEnum = genealogySchema.enum('predicate', [...predicates]);

// Reuse public schema enums for title and style (referenced via string literals)
// These are defined in the public schema but we need compatible types
export const genealogyTitleEnum = genealogySchema.enum('title', [...titles]);
export const genealogyStyleEnum = genealogySchema.enum('style', [...styles]);

// ============================================================================
// PERSON PROFILES TABLE
// ============================================================================

/**
 * Person profiles for capoeira identity/lineage data.
 * Linked from public.users via users.profile_id FK.
 * Historical figures exist only here with no linked user.
 */
export const personProfiles = genealogySchema.table(
  'person_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Identity (moved from users)
    name: varchar('name', { length: 255 }),
    apelido: varchar('apelido', { length: 100 }), // capoeira nickname (was users.nickname)
    title: genealogyTitleEnum('title'),
    avatar: varchar('avatar', { length: 500 }),
    links: jsonb('links').$type<SocialLink[]>().default([]),

    // Capoeira-specific (new)
    style: genealogyStyleEnum('style'),
    styleNotes: text('style_notes'), // e.g., "Transitioned from Regional to Angola in 1985"

    // Life dates
    birthYear: integer('birth_year'),
    birthYearPrecision: datePrecisionEnum('birth_year_precision').default('unknown'),
    birthPlace: varchar('birth_place', { length: 255 }), // City, Country or just Country
    deathYear: integer('death_year'), // null if alive
    deathYearPrecision: datePrecisionEnum('death_year_precision').default('unknown'),
    deathPlace: varchar('death_place', { length: 255 }),

    // Extended content
    bio: text('bio'), // Biography/background
    achievements: text('achievements'), // Awards, recognitions, notable accomplishments

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (t) => [
    index('person_profiles_apelido_idx').on(t.apelido),
    index('person_profiles_title_idx').on(t.title),
    index('person_profiles_style_idx').on(t.style),
  ]
);

// ============================================================================
// GROUP PROFILES TABLE
// ============================================================================

/**
 * Name history entry for tracking group name changes over time.
 */
export type NameHistoryEntry = {
  name: string;
  startedAt: string; // ISO date string
  endedAt?: string; // null if current
  changeReason?: string;
  context?: string;
};

/**
 * Group profiles for capoeira identity/lineage data.
 * Linked from public.groups via groups.profile_id FK.
 */
export const groupProfiles = genealogySchema.table(
  'group_profiles',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Identity (moved from groups)
    name: varchar('name', { length: 255 }).notNull(),

    // Extended data (moved from groups)
    description: text('description'),
    style: genealogyStyleEnum('style'),
    styleNotes: text('style_notes'), // e.g., "Originally Regional, evolved to Contemporânea"
    logo: varchar('logo', { length: 500 }),
    links: jsonb('links').$type<SocialLink[]>().default([]),

    // Identity enhancements (new)
    nameAliases: text('name_aliases').array(), // alternative names, abbreviations (e.g., ["GCAP"])

    // Founding details (new)
    foundedYear: integer('founded_year'),
    foundedYearPrecision: datePrecisionEnum('founded_year_precision').default('unknown'),
    foundedLocation: varchar('founded_location', { length: 255 }), // City, Country

    // Extended content (new)
    philosophy: text('philosophy'), // group's stated philosophy/mission
    history: text('history'), // long-form group history

    // Name history for tracking name changes over time
    nameHistory: jsonb('name_history').$type<NameHistoryEntry[]>().default([]),

    // Organizational (new)
    legalStructure: legalStructureEnum('legal_structure'),
    isHeadquarters: boolean('is_headquarters').default(false),

    // Status (new)
    isActive: boolean('is_active').default(true),
    dissolvedAt: date('dissolved_at'), // when group ceased operations (null if active)

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (t) => [
    index('group_profiles_name_idx').on(t.name),
    index('group_profiles_style_idx').on(t.style),
    index('group_profiles_is_active_idx').on(t.isActive),
  ]
);

// ============================================================================
// STATEMENT PROPERTIES TYPES
// ============================================================================

/**
 * Properties for the statements table JSONB column.
 * Typed additional data per predicate type.
 */
export type StatementProperties = {
  // For family_of
  relationship_type?: 'parent' | 'sibling' | 'spouse' | 'padrinho' | 'other';
  other_type?: string;

  // For granted_title_to
  title_grant?: {
    title: string;
    ceremony?: string;
    location?: string;
  };

  // For baptized_by
  baptism?: {
    apelido_given: string;
    ceremony?: string;
    location?: string;
  };

  // For departed_from
  departure_type?: 'neutral' | 'blessed' | 'contentious' | 'expelled';

  // For split_from_group
  split_type?: 'neutral' | 'blessed' | 'contentious';
  blessed_by?: string[]; // UUIDs of mestres who blessed

  // For part_of
  affiliation_type?: 'branch' | 'nucleus' | 'affiliate' | 'official_filial';

  // For associated_with
  association_type?: 'supporter' | 'patron' | 'informal_affiliate' | 'friend' | 'honorary';

  // For cultural_pioneer_of
  region?: string;
  country?: string;

  // Generic
  context?: string;
};

// ============================================================================
// STATEMENTS TABLE
// ============================================================================

/**
 * Statements table - the core triple table for all relationships.
 * Uses subject-predicate-object pattern (EAV model).
 *
 * - subject_type/subject_id: Who/what this statement is about
 * - predicate: The relationship type
 * - object_type/object_id: Who/what they're related to
 *
 * All IDs reference genealogy schema tables:
 * - If type = 'person': ID references genealogy.person_profiles.id
 * - If type = 'group': ID references genealogy.group_profiles.id
 */
export const statements = genealogySchema.table(
  'statements',
  {
    id: uuid('id').primaryKey().defaultRandom(),

    // Subject (who/what this statement is about)
    subjectType: entityTypeEnum('subject_type').notNull(),
    subjectId: uuid('subject_id').notNull(),

    // Predicate (relationship type)
    predicate: predicateEnum('predicate').notNull(),

    // Object (who/what they're related to)
    objectType: entityTypeEnum('object_type').notNull(),
    objectId: uuid('object_id').notNull(),

    // Timeline
    startedAt: date('started_at'),
    endedAt: date('ended_at'),

    // Properties (predicate-specific data as JSONB)
    properties: jsonb('properties').$type<StatementProperties>().default({}),

    // Verification
    confidence: confidenceEnum('confidence').default('unverified'),
    source: varchar('source', { length: 500 }), // citation or reference
    notes: text('notes'),

    // Metadata
    createdAt: timestamp('created_at').notNull().defaultNow(),
    updatedAt: timestamp('updated_at')
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
    createdBy: uuid('created_by'), // tracks who created (app user id, no FK constraint)
  },
  (t) => [
    index('statements_subject_idx').on(t.subjectType, t.subjectId),
    index('statements_object_idx').on(t.objectType, t.objectId),
    index('statements_predicate_idx').on(t.predicate),
    index('statements_confidence_idx').on(t.confidence),
    index('statements_subject_predicate_idx').on(t.subjectType, t.subjectId, t.predicate),
    index('statements_object_predicate_idx').on(t.objectType, t.objectId, t.predicate),
    // Prevent exact duplicates (same subject-predicate-object-startedAt)
    uniqueIndex('statements_unique_idx').on(
      t.subjectType,
      t.subjectId,
      t.predicate,
      t.objectType,
      t.objectId,
      t.startedAt
    ),
  ]
);

// ============================================================================
// TYPE EXPORTS
// ============================================================================

export type InsertPersonProfile = typeof personProfiles.$inferInsert;
export type SelectPersonProfile = typeof personProfiles.$inferSelect;

export type InsertGroupProfile = typeof groupProfiles.$inferInsert;
export type SelectGroupProfile = typeof groupProfiles.$inferSelect;

export type InsertStatement = typeof statements.$inferInsert;
export type SelectStatement = typeof statements.$inferSelect;

// Derived types from constants
export type EntityType = (typeof entityTypes)[number];
export type DatePrecision = (typeof datePrecisions)[number];
export type ConfidenceLevel = (typeof confidenceLevels)[number];
export type LegalStructure = (typeof legalStructures)[number];
export type Predicate = (typeof predicates)[number];
