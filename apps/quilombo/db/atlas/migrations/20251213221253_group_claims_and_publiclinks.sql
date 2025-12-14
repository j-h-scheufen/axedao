-- Rename "links" to "public_links" in "group_profiles" table (preserves data)
ALTER TABLE "genealogy"."group_profiles" RENAME COLUMN "links" TO "public_links";
-- Modify "group_claims" table
ALTER TABLE "public"."group_claims" DROP COLUMN "group_id", ADD COLUMN "profile_id" uuid NULL, ADD COLUMN "proposed_name" character varying(255) NULL, ADD COLUMN "proposed_style" "public"."style" NULL, ADD COLUMN "website" character varying(500) NULL, ADD CONSTRAINT "group_claims_profile_id_group_profiles_id_fk" FOREIGN KEY ("profile_id") REFERENCES "genealogy"."group_profiles" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Create index "group_claim_profile_idx" to table: "group_claims"
CREATE INDEX "group_claim_profile_idx" ON "public"."group_claims" ("profile_id");
