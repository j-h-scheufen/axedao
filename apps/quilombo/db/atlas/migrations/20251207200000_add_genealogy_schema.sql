-- Add genealogy schema for capoeira identity and lineage data
-- This schema is fully self-contained with no foreign keys pointing to the public schema.
-- All FKs flow FROM public TO genealogy (users.profile_id, groups.profile_id).

-- Create the genealogy schema
CREATE SCHEMA "genealogy";

-- ============================================================================
-- ENUMS
-- ============================================================================

-- Entity types for statements (subjects/objects)
CREATE TYPE "genealogy"."entity_type" AS ENUM ('person', 'group');

-- Date precision for historical data with uncertainty
CREATE TYPE "genealogy"."date_precision" AS ENUM ('exact', 'month', 'year', 'decade', 'approximate', 'unknown');

-- Confidence levels for statement verification
CREATE TYPE "genealogy"."confidence" AS ENUM ('verified', 'likely', 'unverified', 'disputed', 'uncertain');

-- Legal structure types for groups
CREATE TYPE "genealogy"."legal_structure" AS ENUM ('for_profit', 'non_profit', 'nonprofit_501c3', 'association_ev', 'association_loi1901', 'informal', 'mixed');

-- Capoeira title ranks
CREATE TYPE "genealogy"."title" AS ENUM ('mestra', 'mestre', 'contra-mestra', 'contra-mestre', 'mestranda', 'mestrando', 'professora', 'professor', 'instrutora', 'instrutor', 'graduada', 'graduado', 'formada', 'formado', 'estagiaria', 'estagiario', 'estagianda', 'estagiando', 'monitora', 'monitor', 'treinel', 'aluna', 'aluno', 'iniciante');

-- Capoeira styles (ASCII-safe, no diacritics)
CREATE TYPE "genealogy"."style" AS ENUM ('angola', 'regional', 'contemporanea', 'mixed');

-- Relationship predicates (21 total)
-- Direction convention: predicates flow from "younger/newer" to "older/established"
CREATE TYPE "genealogy"."predicate" AS ENUM (
  -- Person-to-Person: Training & Lineage (3)
  'student_of',
  'trained_under',
  'influenced_by',
  -- Person-to-Person: Recognition (2)
  'granted_title_to',
  'baptized_by',
  -- Person-to-Person: Family (1)
  'family_of',
  -- Person-to-Group: Founding & Leadership (4)
  'founded',
  'co_founded',
  'leads',
  'regional_coordinator_of',
  -- Person-to-Group: Membership & Affiliation (5)
  'member_of',
  'teaches_at',
  'cultural_pioneer_of',
  'associated_with',
  'departed_from',
  -- Group-to-Group: Hierarchical (1)
  'part_of',
  -- Group-to-Group: Evolution (3)
  'split_from_group',
  'merged_into',
  'evolved_from',
  -- Group-to-Group: Affiliation (2)
  'affiliated_with',
  'cooperates_with'
);

-- ============================================================================
-- PERSON PROFILES TABLE
-- ============================================================================

CREATE TABLE "genealogy"."person_profiles" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  -- Identity
  "name" character varying(255) NULL,
  "apelido" character varying(100) NULL,
  "title" "genealogy"."title" NULL,
  "avatar" character varying(500) NULL,
  "links" jsonb NULL DEFAULT '[]',
  -- Capoeira-specific
  "style" "genealogy"."style" NULL,
  "style_notes" text NULL,
  -- Life dates
  "birth_year" integer NULL,
  "birth_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "birth_place" character varying(255) NULL,
  "death_year" integer NULL,
  "death_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "death_place" character varying(255) NULL,
  -- Extended content
  "bio" text NULL,
  "achievements" text NULL,
  -- Metadata
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);

-- Person profiles indexes
CREATE INDEX "person_profiles_apelido_idx" ON "genealogy"."person_profiles" ("apelido");
CREATE INDEX "person_profiles_title_idx" ON "genealogy"."person_profiles" ("title");
CREATE INDEX "person_profiles_style_idx" ON "genealogy"."person_profiles" ("style");

-- ============================================================================
-- GROUP PROFILES TABLE
-- ============================================================================

CREATE TABLE "genealogy"."group_profiles" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  -- Identity
  "name" character varying(255) NOT NULL,
  "description" text NULL,
  "style" "genealogy"."style" NULL,
  "style_notes" text NULL,
  "logo" character varying(500) NULL,
  "links" jsonb NULL DEFAULT '[]',
  "name_aliases" text[] NULL,
  -- Founding details
  "founded_year" integer NULL,
  "founded_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "founded_location" character varying(255) NULL,
  -- Extended content
  "philosophy" text NULL,
  "history" text NULL,
  "name_history" jsonb NULL DEFAULT '[]',
  -- Organizational
  "legal_structure" "genealogy"."legal_structure" NULL,
  "is_headquarters" boolean NULL DEFAULT false,
  -- Status
  "is_active" boolean NULL DEFAULT true,
  "dissolved_at" date NULL,
  -- Metadata
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);

-- Group profiles indexes
CREATE INDEX "group_profiles_name_idx" ON "genealogy"."group_profiles" ("name");
CREATE INDEX "group_profiles_style_idx" ON "genealogy"."group_profiles" ("style");
CREATE INDEX "group_profiles_is_active_idx" ON "genealogy"."group_profiles" ("is_active");

-- ============================================================================
-- STATEMENTS TABLE
-- ============================================================================

CREATE TABLE "genealogy"."statements" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  -- Subject (who/what this statement is about)
  "subject_type" "genealogy"."entity_type" NOT NULL,
  "subject_id" uuid NOT NULL,
  -- Predicate (relationship type)
  "predicate" "genealogy"."predicate" NOT NULL,
  -- Object (who/what they're related to)
  "object_type" "genealogy"."entity_type" NOT NULL,
  "object_id" uuid NOT NULL,
  -- Timeline
  "started_at" date NULL,
  "ended_at" date NULL,
  -- Properties (predicate-specific data as JSONB)
  "properties" jsonb NULL DEFAULT '{}',
  -- Verification
  "confidence" "genealogy"."confidence" NULL DEFAULT 'unverified',
  "source" character varying(500) NULL,
  "notes" text NULL,
  -- Metadata
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  "created_by" uuid NULL,
  PRIMARY KEY ("id")
);

-- Statements indexes
CREATE INDEX "statements_subject_idx" ON "genealogy"."statements" ("subject_type", "subject_id");
CREATE INDEX "statements_object_idx" ON "genealogy"."statements" ("object_type", "object_id");
CREATE INDEX "statements_predicate_idx" ON "genealogy"."statements" ("predicate");
CREATE INDEX "statements_confidence_idx" ON "genealogy"."statements" ("confidence");
CREATE INDEX "statements_subject_predicate_idx" ON "genealogy"."statements" ("subject_type", "subject_id", "predicate");
CREATE INDEX "statements_object_predicate_idx" ON "genealogy"."statements" ("object_type", "object_id", "predicate");
-- Prevent exact duplicates (same subject-predicate-object-startedAt)
CREATE UNIQUE INDEX "statements_unique_idx" ON "genealogy"."statements" ("subject_type", "subject_id", "predicate", "object_type", "object_id", "started_at");

-- ============================================================================
-- FOREIGN KEYS FROM PUBLIC SCHEMA TO GENEALOGY
-- ============================================================================

-- Add profile_id to users table (links to person_profiles)
ALTER TABLE "public"."users" ADD COLUMN "profile_id" uuid NULL;
ALTER TABLE "public"."users" ADD CONSTRAINT "users_profile_id_person_profiles_id_fk"
  FOREIGN KEY ("profile_id") REFERENCES "genealogy"."person_profiles" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- UNIQUE index ensures a person_profile can only be claimed by ONE user
CREATE UNIQUE INDEX "users_profile_id_idx" ON "public"."users" ("profile_id");

-- Add profile_id to groups table (links to group_profiles)
ALTER TABLE "public"."groups" ADD COLUMN "profile_id" uuid NULL;
ALTER TABLE "public"."groups" ADD CONSTRAINT "groups_profile_id_group_profiles_id_fk"
  FOREIGN KEY ("profile_id") REFERENCES "genealogy"."group_profiles" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
CREATE INDEX "groups_profile_id_idx" ON "public"."groups" ("profile_id");

-- ============================================================================
-- UPDATE PUBLIC SCHEMA STYLE ENUM
-- ============================================================================
-- Recreate public.style enum with ASCII values (no diacritics) and add 'mixed'
-- This ensures consistency between public and genealogy schemas

-- Drop and recreate public.style enum
DROP TYPE IF EXISTS "public"."style" CASCADE;
CREATE TYPE "public"."style" AS ENUM ('angola', 'regional', 'contemporanea', 'mixed');

-- Recreate the groups.style column that was dropped by CASCADE
ALTER TABLE "public"."groups" ADD COLUMN "style" "public"."style";
