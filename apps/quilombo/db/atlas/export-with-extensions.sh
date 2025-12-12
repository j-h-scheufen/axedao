#!/bin/bash
# Script to export Drizzle schema with PostGIS extensions
# This ensures Atlas dev database has extensions enabled when validating schema

# First, output the extensions
cat db/atlas/extensions.sql

# Then, output the Drizzle schema with post-processing
# Drizzle-kit has a bug where some schema-qualified enums lose their prefix in column definitions
# We fix this by adding the "genealogy." prefix to unqualified date_precision references in column defs
# Only replace unqualified references (not already prefixed with "genealogy".)
#
# We also need to fix indexes that Drizzle can't express:
# 1. statements_unique_idx - uses COALESCE expression for NULL handling
# 2. person_profiles_apelido_unique_idx - uses WHERE clause for partial index
#
# These are removed from Drizzle output and replaced with correct definitions.

npx drizzle-kit export | sed \
  -E 's/([^".])date_precision( DEFAULT)/\1"genealogy"."date_precision"\2/g' | \
sed '/CREATE UNIQUE INDEX "statements_unique_idx"/d' | \
sed '/CREATE UNIQUE INDEX "person_profiles_apelido_unique_idx"/d' | \
sed '/CREATE INDEX "person_profiles_apelido_context_idx"/d'

# Append correct index definitions that Drizzle can't express
cat << 'EOF'

-- Expression-based indexes (manually managed, not expressible in Drizzle)
-- statements_unique_idx: Uses COALESCE for NULL started_at handling
CREATE UNIQUE INDEX "statements_unique_idx" ON "genealogy"."statements" (
  "subject_type",
  "subject_id",
  "predicate",
  "object_type",
  "object_id",
  COALESCE("started_at", '0001-01-01'::date)
);

-- person_profiles_apelido_unique_idx: Composite unique on (apelido, apelido_context) with COALESCE
-- This allows multiple people with the same apelido if they have different contexts
-- Examples: "Mestre Cobra" (Salvador) vs "Mestre Cobra" (São Paulo)
CREATE UNIQUE INDEX "person_profiles_apelido_unique_idx" ON "genealogy"."person_profiles" (
  "apelido",
  COALESCE("apelido_context", '')
) WHERE "apelido" IS NOT NULL;

-- person_profiles_apelido_context_idx: For faster lookups when context is specified
CREATE INDEX "person_profiles_apelido_context_idx" ON "genealogy"."person_profiles" ("apelido_context") WHERE "apelido_context" IS NOT NULL;
EOF
