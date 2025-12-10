-- Add apelido_context column and update unique index for disambiguation
--
-- PROBLEM: The apelido column has a unique constraint, but multiple capoeiristas
-- can share the same apelido (e.g., "Mestre Cobra" exists in Salvador, São Paulo, etc.)
--
-- SOLUTION: Add apelido_context column for disambiguation and create a composite
-- unique index on (apelido, COALESCE(apelido_context, ''))
--
-- BACKWARD COMPATIBILITY: Existing records have NULL apelido_context, which
-- COALESCE converts to empty string. As long as apelidos are unique (current state),
-- no conflicts will occur. Future imports can add context when needed.

-- ============================================================================
-- ADD APELIDO_CONTEXT COLUMN
-- ============================================================================

ALTER TABLE "genealogy"."person_profiles"
ADD COLUMN "apelido_context" character varying(100) NULL;

-- ============================================================================
-- UPDATE UNIQUE INDEX TO COMPOSITE
-- ============================================================================

-- Drop the old single-column unique index
DROP INDEX IF EXISTS "genealogy"."person_profiles_apelido_unique_idx";

-- Create new composite unique index with COALESCE for NULL handling
-- This allows:
--   ('Mestre Cobra', NULL) - unique
--   ('Mestre Cobra', 'Salvador') - unique (different from NULL context)
--   ('Mestre Cobra', 'São Paulo') - unique (different from Salvador)
-- But prevents:
--   ('Mestre Cobra', NULL) twice - conflict
--   ('Mestre Cobra', 'Salvador') twice - conflict
CREATE UNIQUE INDEX "person_profiles_apelido_unique_idx"
ON "genealogy"."person_profiles" (
  "apelido",
  COALESCE("apelido_context", '')
)
WHERE "apelido" IS NOT NULL;

-- ============================================================================
-- ADD INDEX ON APELIDO_CONTEXT FOR FASTER LOOKUPS
-- ============================================================================

CREATE INDEX "person_profiles_apelido_context_idx"
ON "genealogy"."person_profiles" ("apelido_context")
WHERE "apelido_context" IS NOT NULL;
