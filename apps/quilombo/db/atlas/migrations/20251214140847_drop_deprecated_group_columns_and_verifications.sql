-- Modify "groups" table
ALTER TABLE "public"."groups" DROP COLUMN "leader_id", DROP COLUMN "founder";
-- Drop "group_verifications" table
DROP TABLE "public"."group_verifications";
