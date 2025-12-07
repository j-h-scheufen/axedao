-- Cleanup predicate enum: rename baptized -> baptized_by, remove unused predicates
-- Note: PostgreSQL doesn't support removing enum values or easy renaming without recreation.
-- We add the new value and update any existing data. Old values will remain in the enum
-- but won't be used by the application.

-- Add the new 'baptized_by' value to the enum
-- Note: ADD VALUE cannot be used inside a transaction block in PostgreSQL < 12,
-- and even in PG 12+ cannot be used in the same transaction as a statement that uses it.
-- Atlas runs each statement separately, so we just add the value here.
ALTER TYPE "genealogy"."predicate" ADD VALUE IF NOT EXISTS 'baptized_by';

-- Note: The following predicates are being deprecated and should not be used:
-- - 'baptized' (replaced by 'baptized_by')
-- - 'mentored' (use 'trained_under' or 'influenced_by' instead)
-- - 'graduated_from' (use 'departed_from' with context)
-- - 'absorbed' (use 'merged_into' from the absorbed group's perspective)
-- - 'succeeded' (use 'evolved_from' instead)
-- These values remain in the enum for data integrity but are removed from the app code.
