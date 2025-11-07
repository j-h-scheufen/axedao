CREATE TYPE "public"."account_status" AS ENUM('pending_verification', 'active', 'disabled');--> statement-breakpoint
CREATE TYPE "public"."oauth_provider" AS ENUM('google');--> statement-breakpoint
CREATE TYPE "public"."token_type" AS ENUM('email_verification', 'password_reset');--> statement-breakpoint
CREATE TABLE "oauth_accounts" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"user_id" uuid NOT NULL,
	"provider" "oauth_provider" NOT NULL,
	"provider_user_id" text NOT NULL,
	"provider_email" text,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "verification_tokens" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"user_id" uuid NOT NULL,
	"token_hash" text NOT NULL,
	"type" "token_type" NOT NULL,
	"expires_at" timestamp NOT NULL,
	"consumed_at" timestamp,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "users" ALTER COLUMN "wallet_address" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "password_hash" text;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "email_verified_at" timestamp;--> statement-breakpoint
ALTER TABLE "users" ADD COLUMN "account_status" "account_status" DEFAULT 'active' NOT NULL;--> statement-breakpoint
ALTER TABLE "oauth_accounts" ADD CONSTRAINT "oauth_accounts_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "verification_tokens" ADD CONSTRAINT "verification_tokens_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE UNIQUE INDEX "oauth_provider_user_idx" ON "oauth_accounts" USING btree ("provider","provider_user_id");--> statement-breakpoint
CREATE INDEX "oauth_user_idx" ON "oauth_accounts" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "token_hash_idx" ON "verification_tokens" USING btree ("token_hash");--> statement-breakpoint
CREATE INDEX "user_token_type_idx" ON "verification_tokens" USING btree ("user_id","type");