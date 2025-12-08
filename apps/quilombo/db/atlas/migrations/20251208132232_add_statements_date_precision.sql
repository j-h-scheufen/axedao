-- Add date precision columns to statements table
-- Mirrors the pattern used in person_profiles for birth/death year precision
-- Allows capturing uncertainty in historical relationship dates

-- Add started_at_precision column
ALTER TABLE "genealogy"."statements"
ADD COLUMN "started_at_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown';

-- Add ended_at_precision column
ALTER TABLE "genealogy"."statements"
ADD COLUMN "ended_at_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown';

-- Add comments for documentation
COMMENT ON COLUMN "genealogy"."statements"."started_at_precision" IS 'Precision of started_at date: exact, month, year, decade, approximate, unknown';
COMMENT ON COLUMN "genealogy"."statements"."ended_at_precision" IS 'Precision of ended_at date: exact, month, year, decade, approximate, unknown';
