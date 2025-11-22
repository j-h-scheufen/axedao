-- Modify "users" table
ALTER TABLE "public"."users" ADD COLUMN "hide_email" boolean NOT NULL DEFAULT false;
