-- Recreate style enums with ASCII values and add 'mixed'
-- PREREQUISITE: Remove style values from groups in staging/prod before applying

-- Drop and recreate genealogy.style enum
DROP TYPE IF EXISTS "genealogy"."style" CASCADE;
CREATE TYPE "genealogy"."style" AS ENUM ('angola', 'regional', 'contemporanea', 'mixed');

-- Drop and recreate public.style enum
DROP TYPE IF EXISTS "public"."style" CASCADE;
CREATE TYPE "public"."style" AS ENUM ('angola', 'regional', 'contemporanea', 'mixed');

-- Recreate the columns that reference these enums
-- genealogy.person_profiles.style
ALTER TABLE "genealogy"."person_profiles"
  ADD COLUMN "style_new" "genealogy"."style";
ALTER TABLE "genealogy"."person_profiles"
  DROP COLUMN IF EXISTS "style";
ALTER TABLE "genealogy"."person_profiles"
  RENAME COLUMN "style_new" TO "style";

-- genealogy.group_profiles.style
ALTER TABLE "genealogy"."group_profiles"
  ADD COLUMN "style_new" "genealogy"."style";
ALTER TABLE "genealogy"."group_profiles"
  DROP COLUMN IF EXISTS "style";
ALTER TABLE "genealogy"."group_profiles"
  RENAME COLUMN "style_new" TO "style";

-- public.groups.style
ALTER TABLE "public"."groups"
  ADD COLUMN "style_new" "public"."style";
ALTER TABLE "public"."groups"
  DROP COLUMN IF EXISTS "style";
ALTER TABLE "public"."groups"
  RENAME COLUMN "style_new" TO "style";

-- Recreate indexes
CREATE INDEX IF NOT EXISTS "person_profiles_style_idx" ON "genealogy"."person_profiles" ("style");
CREATE INDEX IF NOT EXISTS "group_profiles_style_idx" ON "genealogy"."group_profiles" ("style");
