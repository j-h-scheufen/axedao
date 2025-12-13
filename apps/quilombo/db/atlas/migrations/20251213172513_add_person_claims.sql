-- Create "person_claims" table
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
-- Create index "person_claim_date_idx" to table: "person_claims"
CREATE INDEX "person_claim_date_idx" ON "public"."person_claims" ("requested_at");
-- Create index "person_claim_profile_idx" to table: "person_claims"
CREATE INDEX "person_claim_profile_idx" ON "public"."person_claims" ("person_profile_id");
-- Create index "person_claim_status_idx" to table: "person_claims"
CREATE INDEX "person_claim_status_idx" ON "public"."person_claims" ("status");
-- Create index "person_claim_user_idx" to table: "person_claims"
CREATE INDEX "person_claim_user_idx" ON "public"."person_claims" ("user_id");
