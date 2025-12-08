-- Add notes columns to genealogy tables for researcher notes
-- (date estimation reasoning, source conflicts, caveats)

-- Modify "group_profiles" table
ALTER TABLE "genealogy"."group_profiles" ADD COLUMN "notes_en" text NULL, ADD COLUMN "notes_pt" text NULL;

-- Modify "person_profiles" table
ALTER TABLE "genealogy"."person_profiles" ADD COLUMN "notes_en" text NULL, ADD COLUMN "notes_pt" text NULL;

-- Note: person_profiles_apelido_unique_idx partial index is managed manually (Drizzle doesn't support WHERE clauses)
-- It was created in 20251208120000_add_genealogy_import_log.sql and should NOT be dropped
