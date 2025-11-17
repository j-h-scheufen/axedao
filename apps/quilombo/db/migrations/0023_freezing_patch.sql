-- Enums: Use DO block to check existence
DO $$ BEGIN
    CREATE TYPE "public"."invitation_status" AS ENUM('pending', 'accepted', 'expired');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;--> statement-breakpoint

DO $$ BEGIN
    CREATE TYPE "public"."invitation_type" AS ENUM('email_bound', 'open');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;--> statement-breakpoint

-- Table: IF NOT EXISTS
CREATE TABLE IF NOT EXISTS "invitations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"code" uuid DEFAULT gen_random_uuid() NOT NULL,
	"type" "invitation_type" NOT NULL,
	"invited_email" text,
	"created_by" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"expires_at" timestamp NOT NULL,
	"status" "invitation_status" DEFAULT 'pending' NOT NULL,
	"accepted_at" timestamp,
	"accepted_by" uuid
);
--> statement-breakpoint

-- Column: Check if exists first
DO $$ BEGIN
    ALTER TABLE "users" ADD COLUMN "invited_by" uuid;
EXCEPTION
    WHEN duplicate_column THEN null;
END $$;--> statement-breakpoint

-- Foreign keys: Check if exists
DO $$ BEGIN
    ALTER TABLE "invitations" ADD CONSTRAINT "invitations_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;--> statement-breakpoint

DO $$ BEGIN
    ALTER TABLE "invitations" ADD CONSTRAINT "invitations_accepted_by_users_id_fk" FOREIGN KEY ("accepted_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;--> statement-breakpoint

-- Indexes: IF NOT EXISTS
CREATE UNIQUE INDEX IF NOT EXISTS "invitation_code_idx" ON "invitations" USING btree ("code");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "invitation_email_idx" ON "invitations" USING btree ("invited_email");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "invitation_created_by_idx" ON "invitations" USING btree ("created_by");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "invitation_status_idx" ON "invitations" USING btree ("status");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "invitation_type_idx" ON "invitations" USING btree ("type");--> statement-breakpoint

DO $$ BEGIN
    ALTER TABLE "users" ADD CONSTRAINT "users_invited_by_users_id_fk" FOREIGN KEY ("invited_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;--> statement-breakpoint

CREATE INDEX IF NOT EXISTS "invited_by_idx" ON "users" USING btree ("invited_by");
