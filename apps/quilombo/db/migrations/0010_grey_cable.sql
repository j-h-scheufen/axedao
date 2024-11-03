DO $$ BEGIN
 CREATE TYPE "public"."style" AS ENUM('angola', 'regional', 'contemporânea');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DROP INDEX IF EXISTS "name_idx";--> statement-breakpoint
ALTER TABLE "groups" ADD COLUMN "style" "style";--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "name_idx" ON "groups" USING btree ("name");