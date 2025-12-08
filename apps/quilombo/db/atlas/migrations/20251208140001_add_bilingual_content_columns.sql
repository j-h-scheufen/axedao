-- Modify "group_profiles" table
ALTER TABLE "genealogy"."group_profiles" DROP COLUMN "description", DROP COLUMN "style_notes", DROP COLUMN "philosophy", DROP COLUMN "history", ADD COLUMN "description_en" text NULL, ADD COLUMN "description_pt" text NULL, ADD COLUMN "style_notes_en" text NULL, ADD COLUMN "style_notes_pt" text NULL, ADD COLUMN "philosophy_en" text NULL, ADD COLUMN "philosophy_pt" text NULL, ADD COLUMN "history_en" text NULL, ADD COLUMN "history_pt" text NULL;
-- Modify "import_log" table
ALTER TABLE "genealogy"."import_log" ALTER COLUMN "dependencies" DROP NOT NULL;
-- Set comment to table: "import_log"
COMMENT ON TABLE "genealogy"."import_log" IS NULL;
-- Set comment to column: "entity_type" on table: "import_log"
COMMENT ON COLUMN "genealogy"."import_log"."entity_type" IS NULL;
-- Set comment to column: "file_path" on table: "import_log"
COMMENT ON COLUMN "genealogy"."import_log"."file_path" IS NULL;
-- Set comment to column: "checksum" on table: "import_log"
COMMENT ON COLUMN "genealogy"."import_log"."checksum" IS NULL;
-- Set comment to column: "dependencies" on table: "import_log"
COMMENT ON COLUMN "genealogy"."import_log"."dependencies" IS NULL;
-- Set comment to column: "notes" on table: "import_log"
COMMENT ON COLUMN "genealogy"."import_log"."notes" IS NULL;
-- Note: person_profiles_apelido_unique_idx already exists with WHERE clause, no change needed
-- Modify "person_profiles" table
ALTER TABLE "genealogy"."person_profiles" DROP COLUMN "style_notes", DROP COLUMN "bio", DROP COLUMN "achievements", ADD COLUMN "style_notes_en" text NULL, ADD COLUMN "style_notes_pt" text NULL, ADD COLUMN "bio_en" text NULL, ADD COLUMN "bio_pt" text NULL, ADD COLUMN "achievements_en" text NULL, ADD COLUMN "achievements_pt" text NULL;
-- Modify "statements" table
ALTER TABLE "genealogy"."statements" DROP COLUMN "notes", ADD COLUMN "notes_en" text NULL, ADD COLUMN "notes_pt" text NULL;
-- Set comment to column: "started_at_precision" on table: "statements"
COMMENT ON COLUMN "genealogy"."statements"."started_at_precision" IS NULL;
-- Set comment to column: "ended_at_precision" on table: "statements"
COMMENT ON COLUMN "genealogy"."statements"."ended_at_precision" IS NULL;
