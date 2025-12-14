-- Profile Claiming & Schema Cleanup
-- Consolidates migrations for:
-- - Converting publicLinks from jsonb to text[] in genealogy schema
-- - Adding person_claims table for profile claiming workflow
-- - Updating group_claims for genealogy-based claiming
-- - Removing deprecated columns (users.group_id, groups.leader_id, groups.founder)
-- - Dropping group_verifications table (replaced by genealogy relationships)

-- ============================================================================
-- GENEALOGY SCHEMA: Convert publicLinks from jsonb to text[]
-- ============================================================================

-- Modify "person_profiles" table
ALTER TABLE "genealogy"."person_profiles"
  DROP COLUMN "public_links",
  ADD COLUMN "public_links" text[] DEFAULT '{}';

-- Modify "group_profiles" table - first convert type, then rename
ALTER TABLE "genealogy"."group_profiles"
  DROP COLUMN "links",
  ADD COLUMN "links" text[] DEFAULT '{}';

-- Rename "links" to "public_links" in "group_profiles" table
ALTER TABLE "genealogy"."group_profiles" RENAME COLUMN "links" TO "public_links";

-- ============================================================================
-- PUBLIC SCHEMA: Add person_claims table
-- ============================================================================

CREATE TABLE "public"."person_claims" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "person_profile_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "status" "public"."group_claim_status" NOT NULL DEFAULT 'pending',
  "requested_at" timestamp NOT NULL DEFAULT now(),
  "processed_at" timestamp NULL,
  "processed_by" uuid NULL,
  "user_message" text NOT NULL,
  "admin_notes" text NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "person_claims_person_profile_id_person_profiles_id_fk" FOREIGN KEY ("person_profile_id") REFERENCES "genealogy"."person_profiles" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT "person_claims_processed_by_users_id_fk" FOREIGN KEY ("processed_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
  CONSTRAINT "person_claims_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

CREATE INDEX "person_claim_date_idx" ON "public"."person_claims" ("requested_at");
CREATE INDEX "person_claim_profile_idx" ON "public"."person_claims" ("person_profile_id");
CREATE INDEX "person_claim_status_idx" ON "public"."person_claims" ("status");
CREATE INDEX "person_claim_user_idx" ON "public"."person_claims" ("user_id");

-- ============================================================================
-- PUBLIC SCHEMA: Update group_claims for genealogy-based claiming
-- ============================================================================

-- Modify "group_claims" table: remove group_id FK, add genealogy profile_id and new group fields
ALTER TABLE "public"."group_claims"
  DROP COLUMN "group_id",
  ADD COLUMN "profile_id" uuid NULL,
  ADD COLUMN "proposed_name" character varying(255) NULL,
  ADD COLUMN "proposed_style" "public"."style" NULL,
  ADD COLUMN "website" character varying(500) NULL,
  ADD CONSTRAINT "group_claims_profile_id_group_profiles_id_fk" FOREIGN KEY ("profile_id") REFERENCES "genealogy"."group_profiles" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;

CREATE INDEX "group_claim_profile_idx" ON "public"."group_claims" ("profile_id");

-- ============================================================================
-- PUBLIC SCHEMA: Drop deprecated columns and tables
-- ============================================================================

-- Drop users.group_id (membership now via genealogy statements)
ALTER TABLE "public"."users" DROP COLUMN "group_id";

-- Drop groups.leader_id and groups.founder (now via genealogy predicates)
ALTER TABLE "public"."groups" DROP COLUMN "leader_id", DROP COLUMN "founder";

-- Drop group_verifications table (replaced by genealogy relationships)
DROP TABLE "public"."group_verifications";
