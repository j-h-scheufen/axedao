-- ============================================================
-- Genealogy Schema Enhancements
-- ============================================================

-- ------------------------------------------------------------
-- 1. Rename predicate: granted_title_to -> received_title_from
-- ------------------------------------------------------------
-- Reason: Consistency with direction convention.
-- All predicates follow "subject received/learned FROM object" pattern:
--   - student_of: Subject learned FROM object
--   - trained_under: Subject trained WITH object
--   - baptized_by: Subject baptized BY object
--   - received_title_from: Subject received title FROM object (was backwards)
-- ------------------------------------------------------------

ALTER TYPE genealogy.predicate RENAME VALUE 'granted_title_to' TO 'received_title_from';

-- ------------------------------------------------------------
-- 2. Add name_context column to group_profiles
-- ------------------------------------------------------------
-- Pattern matches person_profiles.apelido_context for idempotent SQL imports.
-- Groups with the same name must have different name_context values.
-- ------------------------------------------------------------

ALTER TABLE genealogy.group_profiles
ADD COLUMN name_context VARCHAR(100) NULL;

-- Create unique index on (name, COALESCE(name_context, ''))
-- This allows ON CONFLICT to work for idempotent imports
CREATE UNIQUE INDEX group_profiles_name_unique_idx
ON genealogy.group_profiles (name, COALESCE(name_context, ''));
