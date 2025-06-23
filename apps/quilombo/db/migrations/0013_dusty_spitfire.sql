CREATE TABLE "group_locations" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"group_id" uuid NOT NULL,
	"name" varchar NOT NULL,
	"description" text,
	"feature" jsonb NOT NULL,
	"location" geometry(point) GENERATED ALWAYS AS (ST_SetSRID(ST_MakePoint((( feature -> 'geometry' -> 'coordinates') ->> 0)::numeric, (( feature -> 'geometry' -> 'coordinates') ->> 1)::numeric), 4326)) STORED NOT NULL
);
--> statement-breakpoint
ALTER TABLE "group_locations" ADD CONSTRAINT "group_locations_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "groups_location_gix" ON "group_locations" USING gist ("location");