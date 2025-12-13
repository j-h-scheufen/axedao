-- Modify "person_profiles" table
-- Convert publicLinks from jsonb to text[] (data will be re-imported via pending-migration.sql)
ALTER TABLE "genealogy"."person_profiles"
  DROP COLUMN "public_links",
  ADD COLUMN "public_links" text[] DEFAULT '{}';

-- Modify "group_profiles" table
-- Convert links from jsonb to text[] (data will be re-imported via pending-migration.sql)
ALTER TABLE "genealogy"."group_profiles"
  DROP COLUMN "links",
  ADD COLUMN "links" text[] DEFAULT '{}';
