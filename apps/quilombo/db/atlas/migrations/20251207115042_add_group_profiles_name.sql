-- Modify "group_profiles" table
ALTER TABLE "genealogy"."group_profiles" ADD COLUMN "name" character varying(255) NOT NULL;
-- Create index "group_profiles_name_idx" to table: "group_profiles"
CREATE INDEX "group_profiles_name_idx" ON "genealogy"."group_profiles" ("name");
