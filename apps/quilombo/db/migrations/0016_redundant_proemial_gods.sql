CREATE TYPE "public"."event_type" AS ENUM('general', 'workshop', 'batizado', 'public_roda');--> statement-breakpoint
CREATE TABLE "events" (
	"id" uuid PRIMARY KEY NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp NOT NULL,
	"name" text NOT NULL,
	"description" text,
	"start" timestamp NOT NULL,
	"end" timestamp,
	"type" "event_type" NOT NULL,
	"url" text,
	"feature" jsonb NOT NULL,
	"location" geometry(point) GENERATED ALWAYS AS (ST_SetSRID(ST_MakePoint((( feature -> 'geometry' -> 'coordinates') ->> 0)::numeric, (( feature -> 'geometry' -> 'coordinates') ->> 1)::numeric), 4326)) STORED NOT NULL,
	"country_code" varchar(2),
	"creator_id" uuid NOT NULL,
	"associated_groups" uuid[] DEFAULT '{}' NOT NULL,
	"associated_users" uuid[] DEFAULT '{}' NOT NULL
);
--> statement-breakpoint
ALTER TABLE "events" ADD CONSTRAINT "events_creator_id_users_id_fk" FOREIGN KEY ("creator_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "events_location_gix" ON "events" USING gist ("location");--> statement-breakpoint
CREATE INDEX "events_country_code_idx" ON "events" USING btree ("country_code");--> statement-breakpoint
CREATE INDEX "events_type_idx" ON "events" USING btree ("type");--> statement-breakpoint
CREATE INDEX "events_start_idx" ON "events" USING btree ("start");--> statement-breakpoint
CREATE INDEX "events_end_idx" ON "events" USING btree ("end");--> statement-breakpoint
CREATE INDEX "events_associated_groups_idx" ON "events" USING btree ("associated_groups");--> statement-breakpoint
CREATE INDEX "events_associated_users_idx" ON "events" USING btree ("associated_users");