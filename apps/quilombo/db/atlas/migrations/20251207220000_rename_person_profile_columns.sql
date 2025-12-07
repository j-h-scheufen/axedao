-- Rename person_profiles columns for clearer genealogy-specific semantics
-- avatar → portrait: public-facing image for genealogy records
-- links → public_links: public references (Wikipedia, articles) vs private user links

ALTER TABLE "genealogy"."person_profiles" RENAME COLUMN "avatar" TO "portrait";
ALTER TABLE "genealogy"."person_profiles" RENAME COLUMN "links" TO "public_links";
