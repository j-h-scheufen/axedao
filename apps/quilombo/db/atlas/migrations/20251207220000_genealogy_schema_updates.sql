-- Consolidated genealogy schema updates (branch: feat/mestre-graph)
-- This migration consolidates 6 incremental changes made after the baseline:
-- 1. Rename person_profiles columns (avatar→portrait, links→public_links)
-- 2. Add import_log table with partial unique indexes
-- 3. Add date precision columns to statements
-- 4. Convert text columns to bilingual (_en/_pt) format
-- 5. Add researcher notes columns
-- 6. Fix statements_unique_idx with COALESCE for NULL handling

-- ============================================================================
-- PERSON PROFILES: Rename columns for clearer semantics
-- ============================================================================

ALTER TABLE "genealogy"."person_profiles" RENAME COLUMN "avatar" TO "portrait";
ALTER TABLE "genealogy"."person_profiles" RENAME COLUMN "links" TO "public_links";

-- ============================================================================
-- IMPORT LOG TABLE: Track SQL import files
-- ============================================================================

CREATE TABLE "genealogy"."import_log" (
  "id" serial NOT NULL,
  "entity_type" "genealogy"."entity_type" NOT NULL,
  "file_path" character varying(255) NOT NULL,
  "imported_at" timestamptz NOT NULL DEFAULT now(),
  "checksum" character varying(64) NULL,
  "dependencies" text[] NULL DEFAULT '{}',
  "notes" text NULL,
  PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "import_log_entity_file_idx" ON "genealogy"."import_log" ("entity_type", "file_path");
CREATE INDEX "import_log_entity_type_idx" ON "genealogy"."import_log" ("entity_type");
CREATE INDEX "import_log_imported_at_idx" ON "genealogy"."import_log" ("imported_at");

-- ============================================================================
-- UNIQUE CONSTRAINTS: Required for ON CONFLICT upsert pattern
-- ============================================================================

-- Partial unique index on apelido (only when NOT NULL)
-- Note: Drizzle can't express WHERE clauses, so this is managed manually
CREATE UNIQUE INDEX "person_profiles_apelido_unique_idx" ON "genealogy"."person_profiles" ("apelido") WHERE "apelido" IS NOT NULL;

-- Unique constraint on group name
CREATE UNIQUE INDEX "group_profiles_name_unique_idx" ON "genealogy"."group_profiles" ("name");

-- ============================================================================
-- STATEMENTS: Add date precision columns
-- ============================================================================

ALTER TABLE "genealogy"."statements"
ADD COLUMN "started_at_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown';

ALTER TABLE "genealogy"."statements"
ADD COLUMN "ended_at_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown';

-- ============================================================================
-- BILINGUAL CONTENT: Convert text columns to _en/_pt format
-- ============================================================================

-- Group profiles: Replace single-language columns with bilingual pairs
ALTER TABLE "genealogy"."group_profiles"
  DROP COLUMN "description",
  DROP COLUMN "style_notes",
  DROP COLUMN "philosophy",
  DROP COLUMN "history",
  ADD COLUMN "description_en" text NULL,
  ADD COLUMN "description_pt" text NULL,
  ADD COLUMN "style_notes_en" text NULL,
  ADD COLUMN "style_notes_pt" text NULL,
  ADD COLUMN "philosophy_en" text NULL,
  ADD COLUMN "philosophy_pt" text NULL,
  ADD COLUMN "history_en" text NULL,
  ADD COLUMN "history_pt" text NULL;

-- Person profiles: Replace single-language columns with bilingual pairs
ALTER TABLE "genealogy"."person_profiles"
  DROP COLUMN "style_notes",
  DROP COLUMN "bio",
  DROP COLUMN "achievements",
  ADD COLUMN "style_notes_en" text NULL,
  ADD COLUMN "style_notes_pt" text NULL,
  ADD COLUMN "bio_en" text NULL,
  ADD COLUMN "bio_pt" text NULL,
  ADD COLUMN "achievements_en" text NULL,
  ADD COLUMN "achievements_pt" text NULL;

-- Statements: Replace notes with bilingual pair
ALTER TABLE "genealogy"."statements"
  DROP COLUMN "notes",
  ADD COLUMN "notes_en" text NULL,
  ADD COLUMN "notes_pt" text NULL;

-- ============================================================================
-- RESEARCHER NOTES: Add notes columns to profiles
-- ============================================================================

ALTER TABLE "genealogy"."group_profiles"
  ADD COLUMN "notes_en" text NULL,
  ADD COLUMN "notes_pt" text NULL;

ALTER TABLE "genealogy"."person_profiles"
  ADD COLUMN "notes_en" text NULL,
  ADD COLUMN "notes_pt" text NULL;

-- ============================================================================
-- FIX STATEMENTS UNIQUE INDEX: Handle NULL started_at with COALESCE
-- PostgreSQL treats NULL != NULL, so ON CONFLICT doesn't work with NULL columns
-- Solution: Use COALESCE to treat NULL as a sentinel date ('0001-01-01')
-- ============================================================================

-- Remove any duplicate statements that would conflict after COALESCE
-- (keep the oldest one based on created_at)
DELETE FROM genealogy.statements
WHERE id IN (
  SELECT id FROM (
    SELECT id,
           ROW_NUMBER() OVER (
             PARTITION BY subject_type, subject_id, predicate, object_type, object_id,
                          COALESCE(started_at, '0001-01-01'::date)
             ORDER BY created_at ASC
           ) as rn
    FROM genealogy.statements
  ) sub
  WHERE rn > 1
);

-- Drop the existing index (created in baseline migration)
DROP INDEX IF EXISTS "genealogy"."statements_unique_idx";

-- Create new index with COALESCE for NULL handling
-- Note: Drizzle can't express COALESCE in indexes, so this is managed manually
CREATE UNIQUE INDEX "statements_unique_idx" ON "genealogy"."statements" (
  "subject_type",
  "subject_id",
  "predicate",
  "object_type",
  "object_id",
  COALESCE("started_at", '0001-01-01'::date)
);
