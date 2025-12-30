-- ============================================================================
-- Remove obsolete 'cultural_pioneer_of' predicate from genealogy schema
-- ============================================================================
-- This predicate was semantically problematic (required self-referential statements
-- or a region entity type that doesn't exist). Removing it from the enum.
--
-- IMPORTANT: This migration assumes no rows exist with predicate='cultural_pioneer_of'.
-- The genealogy data migration includes a DELETE to clean up any existing rows.
-- ============================================================================

-- Step 1: Verify no rows use this predicate (will fail if any exist)
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM genealogy.statements
    WHERE predicate = 'cultural_pioneer_of'
  ) THEN
    RAISE EXCEPTION 'Cannot remove cultural_pioneer_of: rows still exist with this predicate. Run genealogy data migration first.';
  END IF;
END $$;

-- Step 2: Create new enum type without 'cultural_pioneer_of'
CREATE TYPE "genealogy"."predicate_new" AS ENUM (
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
  'led',
  -- Person-to-Group: Membership & Affiliation (4) - was 5, now 4 without cultural_pioneer_of
  'member_of',
  'teaches_at',
  'associated_with',
  'departed_from',
  -- Group-to-Group: Hierarchical (1)
  'branch_of',
  -- Group-to-Person: Recognition (1)
  'conferred_title_to',
  -- Symmetric/Contextual (3)
  'rivals_with',
  'collaborated_with',
  'received_title_from'
);

-- Step 3: Alter the statements table to use the new enum
ALTER TABLE "genealogy"."statements"
  ALTER COLUMN "predicate" TYPE "genealogy"."predicate_new"
  USING "predicate"::text::"genealogy"."predicate_new";

-- Step 4: Drop the old enum type
DROP TYPE "genealogy"."predicate";

-- Step 5: Rename the new enum to the original name
ALTER TYPE "genealogy"."predicate_new" RENAME TO "predicate";
