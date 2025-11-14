CREATE TYPE "public"."group_claim_status" AS ENUM('pending', 'approved', 'rejected');--> statement-breakpoint
CREATE TABLE "group_claims" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"group_id" uuid NOT NULL,
	"user_id" uuid NOT NULL,
	"status" "group_claim_status" DEFAULT 'pending' NOT NULL,
	"requested_at" timestamp DEFAULT now() NOT NULL,
	"processed_at" timestamp,
	"processed_by" uuid,
	"user_message" text NOT NULL,
	"admin_notes" text
);
--> statement-breakpoint
CREATE TABLE "group_verifications" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"group_id" uuid NOT NULL,
	"user_id" uuid NOT NULL,
	"verified_at" timestamp DEFAULT now() NOT NULL,
	"notes" text
);
--> statement-breakpoint
ALTER TABLE "groups" ADD COLUMN "created_by" uuid;--> statement-breakpoint
ALTER TABLE "groups" ADD COLUMN "claimed_by" uuid;--> statement-breakpoint
ALTER TABLE "groups" ADD COLUMN "claimed_at" timestamp;--> statement-breakpoint
ALTER TABLE "group_claims" ADD CONSTRAINT "group_claims_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "group_claims" ADD CONSTRAINT "group_claims_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "group_claims" ADD CONSTRAINT "group_claims_processed_by_users_id_fk" FOREIGN KEY ("processed_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "group_verifications" ADD CONSTRAINT "group_verifications_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "group_verifications" ADD CONSTRAINT "group_verifications_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "group_claim_group_idx" ON "group_claims" USING btree ("group_id");--> statement-breakpoint
CREATE INDEX "group_claim_user_idx" ON "group_claims" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "group_claim_status_idx" ON "group_claims" USING btree ("status");--> statement-breakpoint
CREATE INDEX "group_claim_date_idx" ON "group_claims" USING btree ("requested_at");--> statement-breakpoint
CREATE INDEX "group_verification_group_idx" ON "group_verifications" USING btree ("group_id");--> statement-breakpoint
CREATE INDEX "group_verification_user_idx" ON "group_verifications" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "group_verification_date_idx" ON "group_verifications" USING btree ("verified_at");--> statement-breakpoint
ALTER TABLE "groups" ADD CONSTRAINT "groups_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "groups" ADD CONSTRAINT "groups_claimed_by_users_id_fk" FOREIGN KEY ("claimed_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "created_by_idx" ON "groups" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX "claimed_by_idx" ON "groups" USING btree ("claimed_by");