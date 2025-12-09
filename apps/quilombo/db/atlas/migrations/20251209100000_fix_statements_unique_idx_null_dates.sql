-- Fix statements unique index to handle NULL started_at values
-- PostgreSQL treats NULL != NULL, so ON CONFLICT doesn't work with NULL columns
-- Solution: Use COALESCE to treat NULL as a sentinel date

-- Step 1: Remove duplicate statements (keep the oldest one)
-- This is needed because existing data may have duplicates when NULL dates are coalesced
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

-- Step 2: Drop the existing index
DROP INDEX IF EXISTS "genealogy"."statements_unique_idx";

-- Step 3: Create new index with COALESCE for NULL handling
-- This allows ON CONFLICT to work correctly when started_at is NULL
CREATE UNIQUE INDEX "statements_unique_idx" ON "genealogy"."statements" (
  "subject_type",
  "subject_id",
  "predicate",
  "object_type",
  "object_id",
  COALESCE("started_at", '0001-01-01'::date)
);
