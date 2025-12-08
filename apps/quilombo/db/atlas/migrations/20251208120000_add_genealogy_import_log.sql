-- Add import_log table to genealogy schema for tracking SQL imports
-- Tracks which person/group SQL files have been imported to avoid duplicates
-- and to understand the current state of the database vs pending imports.
--
-- Supports dependency-aware sync: when a dependency is imported after a file,
-- that file should be re-run to create any statements that previously failed
-- due to missing referenced entities.

-- ============================================================================
-- IMPORT LOG TABLE
-- ============================================================================

CREATE TABLE "genealogy"."import_log" (
  "id" serial NOT NULL,
  -- Import identification
  "entity_type" "genealogy"."entity_type" NOT NULL,  -- 'person' or 'group'
  "file_path" character varying(255) NOT NULL,       -- e.g., 'persons/placido-de-abreu.sql'
  -- Tracking
  "imported_at" timestamptz NOT NULL DEFAULT now(),
  "checksum" character varying(64) NULL,             -- MD5 hash of file content for change detection
  -- Dependencies (other files that must exist for statements to work)
  "dependencies" text[] NOT NULL DEFAULT '{}',       -- e.g., ['persons/manduca-da-praia.sql']
  -- Metadata
  "notes" text NULL,                                 -- Optional notes about the import
  PRIMARY KEY ("id")
);

-- Unique constraint: each file can only be imported once per entity type
CREATE UNIQUE INDEX "import_log_entity_file_idx" ON "genealogy"."import_log" ("entity_type", "file_path");

-- Index for querying by entity type
CREATE INDEX "import_log_entity_type_idx" ON "genealogy"."import_log" ("entity_type");

-- Index for querying by import date
CREATE INDEX "import_log_imported_at_idx" ON "genealogy"."import_log" ("imported_at");

COMMENT ON TABLE "genealogy"."import_log" IS 'Tracks which SQL import files have been applied to the genealogy schema';
COMMENT ON COLUMN "genealogy"."import_log"."entity_type" IS 'Type of entity imported: person or group';
COMMENT ON COLUMN "genealogy"."import_log"."file_path" IS 'Relative path to SQL file from sql-imports directory, e.g., persons/manduca-da-praia.sql';
COMMENT ON COLUMN "genealogy"."import_log"."checksum" IS 'MD5 hash of file content at import time; used to detect if file changed since import';
COMMENT ON COLUMN "genealogy"."import_log"."dependencies" IS 'Array of file paths this import depends on for relationship statements';
COMMENT ON COLUMN "genealogy"."import_log"."notes" IS 'Optional notes about the import, e.g., "re-imported after corrections"';

-- ============================================================================
-- UNIQUE CONSTRAINT ON PERSON APELIDO
-- Required for ON CONFLICT upsert pattern in sync imports
-- ============================================================================

CREATE UNIQUE INDEX "person_profiles_apelido_unique_idx" ON "genealogy"."person_profiles" ("apelido") WHERE "apelido" IS NOT NULL;

-- ============================================================================
-- UNIQUE CONSTRAINT ON GROUP NAME
-- Required for ON CONFLICT upsert pattern in sync imports
-- ============================================================================

CREATE UNIQUE INDEX "group_profiles_name_unique_idx" ON "genealogy"."group_profiles" ("name");
