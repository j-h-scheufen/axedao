ALTER TABLE "public"."users" ALTER COLUMN "title" SET DATA TYPE text;--> statement-breakpoint
DROP TYPE "public"."title";--> statement-breakpoint
CREATE TYPE "public"."title" AS ENUM('mestra', 'mestre', 'contra-mestra', 'contra-mestre', 'mestranda', 'mestrando', 'professora', 'professor', 'instrutora', 'instrutor', 'monitora', 'monitor', 'aluna', 'aluno', 'iniciante');--> statement-breakpoint
ALTER TABLE "public"."users" ALTER COLUMN "title" SET DATA TYPE "public"."title" USING "title"::"public"."title";