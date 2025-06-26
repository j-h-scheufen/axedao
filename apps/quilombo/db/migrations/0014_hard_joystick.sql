ALTER TABLE "group_locations" ADD COLUMN "country_code" varchar(2);--> statement-breakpoint
CREATE INDEX "country_code_idx" ON "group_locations" USING btree ("country_code");--> statement-breakpoint
ALTER TABLE "groups" DROP COLUMN "city";--> statement-breakpoint
ALTER TABLE "groups" DROP COLUMN "country";