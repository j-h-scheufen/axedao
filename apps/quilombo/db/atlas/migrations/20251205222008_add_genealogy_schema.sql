-- Add new schema named "genealogy"
CREATE SCHEMA "genealogy";
-- Create enum type "confidence"
CREATE TYPE "genealogy"."confidence" AS ENUM ('verified', 'likely', 'unverified', 'disputed', 'uncertain');
-- Create enum type "date_precision"
CREATE TYPE "genealogy"."date_precision" AS ENUM ('exact', 'month', 'year', 'decade', 'approximate', 'unknown');
-- Create enum type "entity_type"
CREATE TYPE "genealogy"."entity_type" AS ENUM ('person', 'group');
-- Create enum type "style"
CREATE TYPE "genealogy"."style" AS ENUM ('angola', 'regional', 'contemporânea');
-- Create enum type "title"
CREATE TYPE "genealogy"."title" AS ENUM ('mestra', 'mestre', 'contra-mestra', 'contra-mestre', 'mestranda', 'mestrando', 'professora', 'professor', 'instrutora', 'instrutor', 'graduada', 'graduado', 'formada', 'formado', 'estagiaria', 'estagiario', 'estagianda', 'estagiando', 'monitora', 'monitor', 'treinel', 'aluna', 'aluno', 'iniciante');
-- Create enum type "legal_structure"
CREATE TYPE "genealogy"."legal_structure" AS ENUM ('for_profit', 'non_profit', 'nonprofit_501c3', 'association_ev', 'association_loi1901', 'informal', 'mixed');
-- Create enum type "predicate"
CREATE TYPE "genealogy"."predicate" AS ENUM ('student_of', 'trained_under', 'influenced_by', 'mentored', 'granted_title_to', 'baptized', 'family_of', 'founded', 'co_founded', 'leads', 'regional_coordinator_of', 'member_of', 'teaches_at', 'cultural_pioneer_of', 'associated_with', 'graduated_from', 'departed_from', 'part_of', 'split_from_group', 'merged_into', 'absorbed', 'succeeded', 'evolved_from', 'affiliated_with', 'cooperates_with');
-- Create "group_profiles" table
CREATE TABLE "genealogy"."group_profiles" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "description" text NULL,
  "style" "genealogy"."style" NULL,
  "style_notes" text NULL,
  "logo" character varying(500) NULL,
  "links" jsonb NULL DEFAULT '[]',
  "name_aliases" text[] NULL,
  "founded_year" integer NULL,
  "founded_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "founded_location" character varying(255) NULL,
  "philosophy" text NULL,
  "history" text NULL,
  "name_history" jsonb NULL DEFAULT '[]',
  "legal_structure" "genealogy"."legal_structure" NULL,
  "is_headquarters" boolean NULL DEFAULT false,
  "is_active" boolean NULL DEFAULT true,
  "dissolved_at" date NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);
-- Create index "group_profiles_is_active_idx" to table: "group_profiles"
CREATE INDEX "group_profiles_is_active_idx" ON "genealogy"."group_profiles" ("is_active");
-- Create index "group_profiles_style_idx" to table: "group_profiles"
CREATE INDEX "group_profiles_style_idx" ON "genealogy"."group_profiles" ("style");
-- Create "statements" table
CREATE TABLE "genealogy"."statements" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "subject_type" "genealogy"."entity_type" NOT NULL,
  "subject_id" uuid NOT NULL,
  "predicate" "genealogy"."predicate" NOT NULL,
  "object_type" "genealogy"."entity_type" NOT NULL,
  "object_id" uuid NOT NULL,
  "started_at" date NULL,
  "ended_at" date NULL,
  "properties" jsonb NULL DEFAULT '{}',
  "confidence" "genealogy"."confidence" NULL DEFAULT 'unverified',
  "source" character varying(500) NULL,
  "notes" text NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  "created_by" uuid NULL,
  PRIMARY KEY ("id")
);
-- Create index "statements_confidence_idx" to table: "statements"
CREATE INDEX "statements_confidence_idx" ON "genealogy"."statements" ("confidence");
-- Create index "statements_object_idx" to table: "statements"
CREATE INDEX "statements_object_idx" ON "genealogy"."statements" ("object_type", "object_id");
-- Create index "statements_object_predicate_idx" to table: "statements"
CREATE INDEX "statements_object_predicate_idx" ON "genealogy"."statements" ("object_type", "object_id", "predicate");
-- Create index "statements_predicate_idx" to table: "statements"
CREATE INDEX "statements_predicate_idx" ON "genealogy"."statements" ("predicate");
-- Create index "statements_subject_idx" to table: "statements"
CREATE INDEX "statements_subject_idx" ON "genealogy"."statements" ("subject_type", "subject_id");
-- Create index "statements_subject_predicate_idx" to table: "statements"
CREATE INDEX "statements_subject_predicate_idx" ON "genealogy"."statements" ("subject_type", "subject_id", "predicate");
-- Create index "statements_unique_idx" to table: "statements"
CREATE UNIQUE INDEX "statements_unique_idx" ON "genealogy"."statements" ("subject_type", "subject_id", "predicate", "object_type", "object_id", "started_at");
-- Modify "groups" table
ALTER TABLE "public"."groups" ADD COLUMN "profile_id" uuid NULL, ADD CONSTRAINT "groups_profile_id_group_profiles_id_fk" FOREIGN KEY ("profile_id") REFERENCES "genealogy"."group_profiles" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Create index "groups_profile_id_idx" to table: "groups"
CREATE INDEX "groups_profile_id_idx" ON "public"."groups" ("profile_id");
-- Create "person_profiles" table
CREATE TABLE "genealogy"."person_profiles" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "name" character varying(255) NULL,
  "apelido" character varying(100) NULL,
  "title" "genealogy"."title" NULL,
  "avatar" character varying(500) NULL,
  "links" jsonb NULL DEFAULT '[]',
  "style" "genealogy"."style" NULL,
  "style_notes" text NULL,
  "birth_year" integer NULL,
  "birth_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "birth_place" character varying(255) NULL,
  "death_year" integer NULL,
  "death_year_precision" "genealogy"."date_precision" NULL DEFAULT 'unknown',
  "death_place" character varying(255) NULL,
  "bio" text NULL,
  "achievements" text NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);
-- Create index "person_profiles_apelido_idx" to table: "person_profiles"
CREATE INDEX "person_profiles_apelido_idx" ON "genealogy"."person_profiles" ("apelido");
-- Create index "person_profiles_style_idx" to table: "person_profiles"
CREATE INDEX "person_profiles_style_idx" ON "genealogy"."person_profiles" ("style");
-- Create index "person_profiles_title_idx" to table: "person_profiles"
CREATE INDEX "person_profiles_title_idx" ON "genealogy"."person_profiles" ("title");
-- Modify "users" table
ALTER TABLE "public"."users" ADD COLUMN "profile_id" uuid NULL, ADD CONSTRAINT "users_profile_id_person_profiles_id_fk" FOREIGN KEY ("profile_id") REFERENCES "genealogy"."person_profiles" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Create index "users_profile_id_idx" to table: "users"
CREATE UNIQUE INDEX "users_profile_id_idx" ON "public"."users" ("profile_id");
