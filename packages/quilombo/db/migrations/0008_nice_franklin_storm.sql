DROP TABLE "links";--> statement-breakpoint
ALTER TABLE "groups" ADD COLUMN "links" json DEFAULT '[]'::json NOT NULL;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "links" json DEFAULT '[]'::json NOT NULL;