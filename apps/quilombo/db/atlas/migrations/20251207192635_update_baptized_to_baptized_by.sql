-- Update any existing statements using 'baptized' to 'baptized_by'
-- This must be in a separate migration from ADD VALUE due to PostgreSQL limitations.
UPDATE "genealogy"."statements"
SET predicate = 'baptized_by'
WHERE predicate = 'baptized';
