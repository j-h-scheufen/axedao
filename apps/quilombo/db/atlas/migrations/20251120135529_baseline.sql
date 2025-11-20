-- Enable PostGIS extension for spatial data types
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
-- Add new schema named "topology"
CREATE SCHEMA IF NOT EXISTS "topology";
-- Set comment to schema: "topology"
COMMENT ON SCHEMA "topology" IS 'PostGIS Topology schema';
-- Create enum type "account_status"
CREATE TYPE "public"."account_status" AS ENUM ('pending_verification', 'active', 'disabled');
-- Create enum type "event_type"
CREATE TYPE "public"."event_type" AS ENUM ('general', 'workshop', 'batizado', 'public_roda');
-- Create enum type "group_claim_status"
CREATE TYPE "public"."group_claim_status" AS ENUM ('pending', 'approved', 'rejected');
-- Create enum type "invitation_status"
CREATE TYPE "public"."invitation_status" AS ENUM ('pending', 'accepted', 'expired');
-- Create enum type "invitation_type"
CREATE TYPE "public"."invitation_type" AS ENUM ('email_bound', 'open');
-- Create enum type "link_type"
CREATE TYPE "public"."link_type" AS ENUM ('website', 'twitter', 'facebook', 'instagram', 'linkedin');
-- Create enum type "oauth_provider"
CREATE TYPE "public"."oauth_provider" AS ENUM ('google');
-- Create enum type "style"
CREATE TYPE "public"."style" AS ENUM ('angola', 'regional', 'contemporânea');
-- Create enum type "title"
CREATE TYPE "public"."title" AS ENUM ('mestra', 'mestre', 'contra-mestra', 'contra-mestre', 'mestranda', 'mestrando', 'professora', 'professor', 'instrutora', 'instrutor', 'graduada', 'graduado', 'formada', 'formado', 'estagiaria', 'estagiario', 'estagianda', 'estagiando', 'monitora', 'monitor', 'treinel', 'aluna', 'aluno', 'iniciante');
-- Create enum type "token_type"
CREATE TYPE "public"."token_type" AS ENUM ('email_verification', 'password_reset');
-- Create "events" table
CREATE TABLE "public"."events" (
  "id" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL,
  "name" text NOT NULL,
  "description" text NULL,
  "start" timestamp NOT NULL,
  "end" timestamp NULL,
  "is_all_day" boolean NOT NULL DEFAULT false,
  "type" "public"."event_type" NOT NULL,
  "url" text NULL,
  "image" character varying NULL,
  "feature" jsonb NOT NULL,
  "location" public.geometry(Point) NOT NULL GENERATED ALWAYS AS (public.st_setsrid(public.st_makepoint((((((feature -> 'geometry'::text) -> 'coordinates'::text) ->> 0))::numeric)::double precision, (((((feature -> 'geometry'::text) -> 'coordinates'::text) ->> 1))::numeric)::double precision), 4326)) STORED,
  "country_code" character varying(2) NULL,
  "creator_id" uuid NOT NULL,
  "associated_groups" uuid[] NOT NULL DEFAULT '{}',
  "associated_users" uuid[] NOT NULL DEFAULT '{}',
  PRIMARY KEY ("id")
);
-- Create index "events_associated_groups_idx" to table: "events"
CREATE INDEX "events_associated_groups_idx" ON "public"."events" ("associated_groups");
-- Create index "events_associated_users_idx" to table: "events"
CREATE INDEX "events_associated_users_idx" ON "public"."events" ("associated_users");
-- Create index "events_country_code_idx" to table: "events"
CREATE INDEX "events_country_code_idx" ON "public"."events" ("country_code");
-- Create index "events_end_idx" to table: "events"
CREATE INDEX "events_end_idx" ON "public"."events" ("end");
-- Create index "events_location_gix" to table: "events"
CREATE INDEX "events_location_gix" ON "public"."events" USING gist ("location");
-- Create index "events_start_idx" to table: "events"
CREATE INDEX "events_start_idx" ON "public"."events" ("start");
-- Create index "events_type_idx" to table: "events"
CREATE INDEX "events_type_idx" ON "public"."events" ("type");
-- Create "group_admins" table
CREATE TABLE "public"."group_admins" (
  "group_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  CONSTRAINT "group_admins_group_id_user_id_pk" PRIMARY KEY ("group_id", "user_id")
);
-- Create "group_claims" table
CREATE TABLE "public"."group_claims" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "group_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "status" "public"."group_claim_status" NOT NULL DEFAULT 'pending',
  "requested_at" timestamp NOT NULL DEFAULT now(),
  "processed_at" timestamp NULL,
  "processed_by" uuid NULL,
  "user_message" text NOT NULL,
  "admin_notes" text NULL,
  PRIMARY KEY ("id")
);
-- Create index "group_claim_date_idx" to table: "group_claims"
CREATE INDEX "group_claim_date_idx" ON "public"."group_claims" ("requested_at");
-- Create index "group_claim_group_idx" to table: "group_claims"
CREATE INDEX "group_claim_group_idx" ON "public"."group_claims" ("group_id");
-- Create index "group_claim_status_idx" to table: "group_claims"
CREATE INDEX "group_claim_status_idx" ON "public"."group_claims" ("status");
-- Create index "group_claim_user_idx" to table: "group_claims"
CREATE INDEX "group_claim_user_idx" ON "public"."group_claims" ("user_id");
-- Create "group_locations" table
CREATE TABLE "public"."group_locations" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "group_id" uuid NOT NULL,
  "name" character varying NOT NULL,
  "description" text NULL,
  "feature" jsonb NOT NULL,
  "location" public.geometry(Point) NOT NULL GENERATED ALWAYS AS (public.st_setsrid(public.st_makepoint((((((feature -> 'geometry'::text) -> 'coordinates'::text) ->> 0))::numeric)::double precision, (((((feature -> 'geometry'::text) -> 'coordinates'::text) ->> 1))::numeric)::double precision), 4326)) STORED,
  "country_code" character varying(2) NULL,
  PRIMARY KEY ("id")
);
-- Create index "country_code_idx" to table: "group_locations"
CREATE INDEX "country_code_idx" ON "public"."group_locations" ("country_code");
-- Create index "groups_location_gix" to table: "group_locations"
CREATE INDEX "groups_location_gix" ON "public"."group_locations" USING gist ("location");
-- Create "group_verifications" table
CREATE TABLE "public"."group_verifications" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "group_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "verified_at" timestamp NOT NULL DEFAULT now(),
  "notes" text NULL,
  PRIMARY KEY ("id")
);
-- Create index "group_verification_date_idx" to table: "group_verifications"
CREATE INDEX "group_verification_date_idx" ON "public"."group_verifications" ("verified_at");
-- Create index "group_verification_group_idx" to table: "group_verifications"
CREATE INDEX "group_verification_group_idx" ON "public"."group_verifications" ("group_id");
-- Create index "group_verification_user_idx" to table: "group_verifications"
CREATE INDEX "group_verification_user_idx" ON "public"."group_verifications" ("user_id");
-- Create "groups" table
CREATE TABLE "public"."groups" (
  "id" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL,
  "name" character varying NOT NULL,
  "description" text NULL,
  "style" "public"."style" NULL,
  "email" text NULL,
  "logo" character varying NULL,
  "banner" character varying NULL,
  "leader_id" uuid NULL,
  "founder" character varying NULL,
  "links" json NOT NULL DEFAULT '[]',
  "created_by" uuid NULL,
  "claimed_by" uuid NULL,
  "claimed_at" timestamp NULL,
  PRIMARY KEY ("id")
);
-- Create index "claimed_by_idx" to table: "groups"
CREATE INDEX "claimed_by_idx" ON "public"."groups" ("claimed_by");
-- Create index "created_by_idx" to table: "groups"
CREATE INDEX "created_by_idx" ON "public"."groups" ("created_by");
-- Create index "name_idx" to table: "groups"
CREATE INDEX "name_idx" ON "public"."groups" ("name");
-- Create "invitations" table
CREATE TABLE "public"."invitations" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "code" uuid NOT NULL DEFAULT gen_random_uuid(),
  "type" "public"."invitation_type" NOT NULL,
  "invited_email" text NULL,
  "created_by" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "expires_at" timestamp NOT NULL,
  "status" "public"."invitation_status" NOT NULL DEFAULT 'pending',
  "accepted_at" timestamp NULL,
  "accepted_by" uuid NULL,
  PRIMARY KEY ("id")
);
-- Create index "invitation_code_idx" to table: "invitations"
CREATE UNIQUE INDEX "invitation_code_idx" ON "public"."invitations" ("code");
-- Create index "invitation_created_by_idx" to table: "invitations"
CREATE INDEX "invitation_created_by_idx" ON "public"."invitations" ("created_by");
-- Create index "invitation_email_idx" to table: "invitations"
CREATE INDEX "invitation_email_idx" ON "public"."invitations" ("invited_email");
-- Create index "invitation_status_idx" to table: "invitations"
CREATE INDEX "invitation_status_idx" ON "public"."invitations" ("status");
-- Create index "invitation_type_idx" to table: "invitations"
CREATE INDEX "invitation_type_idx" ON "public"."invitations" ("type");
-- Create "oauth_accounts" table
CREATE TABLE "public"."oauth_accounts" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "user_id" uuid NOT NULL,
  "provider" "public"."oauth_provider" NOT NULL,
  "provider_user_id" text NOT NULL,
  "provider_email" text NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);
-- Create index "oauth_provider_user_idx" to table: "oauth_accounts"
CREATE UNIQUE INDEX "oauth_provider_user_idx" ON "public"."oauth_accounts" ("provider", "provider_user_id");
-- Create index "oauth_user_idx" to table: "oauth_accounts"
CREATE INDEX "oauth_user_idx" ON "public"."oauth_accounts" ("user_id");
-- Create "users" table
CREATE TABLE "public"."users" (
  "id" uuid NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  "updated_at" timestamp NOT NULL,
  "name" character varying NULL,
  "nickname" character varying NULL,
  "title" "public"."title" NULL,
  "avatar" character varying NULL,
  "email" text NULL,
  "group_id" uuid NULL,
  "phone" character varying NULL,
  "wallet_address" character varying NULL,
  "password_hash" text NULL,
  "email_verified_at" timestamp NULL,
  "account_status" "public"."account_status" NOT NULL DEFAULT 'active',
  "is_global_admin" boolean NOT NULL DEFAULT false,
  "links" json NOT NULL DEFAULT '[]',
  "invited_by" uuid NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "users_invited_by_users_id_fk" FOREIGN KEY ("invited_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);
-- Create index "email_idx" to table: "users"
CREATE UNIQUE INDEX "email_idx" ON "public"."users" ("email");
-- Create index "group_idx" to table: "users"
CREATE INDEX "group_idx" ON "public"."users" ("group_id");
-- Create index "invited_by_idx" to table: "users"
CREATE INDEX "invited_by_idx" ON "public"."users" ("invited_by");
-- Create index "nickname_idx" to table: "users"
CREATE INDEX "nickname_idx" ON "public"."users" ("nickname");
-- Create index "title_idx" to table: "users"
CREATE INDEX "title_idx" ON "public"."users" ("title");
-- Create index "wallet_address_idx" to table: "users"
CREATE INDEX "wallet_address_idx" ON "public"."users" ("wallet_address");
-- Create "verification_tokens" table
CREATE TABLE "public"."verification_tokens" (
  "id" uuid NOT NULL DEFAULT gen_random_uuid(),
  "user_id" uuid NOT NULL,
  "token_hash" text NOT NULL,
  "type" "public"."token_type" NOT NULL,
  "expires_at" timestamp NOT NULL,
  "consumed_at" timestamp NULL,
  "created_at" timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY ("id")
);
-- Create index "token_hash_idx" to table: "verification_tokens"
CREATE INDEX "token_hash_idx" ON "public"."verification_tokens" ("token_hash");
-- Create index "user_token_type_idx" to table: "verification_tokens"
CREATE INDEX "user_token_type_idx" ON "public"."verification_tokens" ("user_id", "type");
-- Modify "events" table
ALTER TABLE "public"."events" ADD CONSTRAINT "events_creator_id_users_id_fk" FOREIGN KEY ("creator_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Modify "group_admins" table
ALTER TABLE "public"."group_admins" ADD CONSTRAINT "group_admins_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE, ADD CONSTRAINT "group_admins_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Modify "group_claims" table
ALTER TABLE "public"."group_claims" ADD CONSTRAINT "group_claims_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE, ADD CONSTRAINT "group_claims_processed_by_users_id_fk" FOREIGN KEY ("processed_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL, ADD CONSTRAINT "group_claims_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Modify "group_locations" table
ALTER TABLE "public"."group_locations" ADD CONSTRAINT "group_locations_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Modify "group_verifications" table
ALTER TABLE "public"."group_verifications" ADD CONSTRAINT "group_verifications_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE, ADD CONSTRAINT "group_verifications_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Modify "groups" table
ALTER TABLE "public"."groups" ADD CONSTRAINT "groups_claimed_by_users_id_fk" FOREIGN KEY ("claimed_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL, ADD CONSTRAINT "groups_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL, ADD CONSTRAINT "groups_leader_id_users_id_fk" FOREIGN KEY ("leader_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Modify "invitations" table
ALTER TABLE "public"."invitations" ADD CONSTRAINT "invitations_accepted_by_users_id_fk" FOREIGN KEY ("accepted_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL, ADD CONSTRAINT "invitations_created_by_users_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Modify "oauth_accounts" table
ALTER TABLE "public"."oauth_accounts" ADD CONSTRAINT "oauth_accounts_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
-- Modify "users" table
ALTER TABLE "public"."users" ADD CONSTRAINT "users_group_id_groups_id_fk" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE SET NULL;
-- Modify "verification_tokens" table
ALTER TABLE "public"."verification_tokens" ADD CONSTRAINT "verification_tokens_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE;
