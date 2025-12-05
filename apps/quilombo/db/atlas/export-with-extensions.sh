#!/bin/bash
# Script to export Drizzle schema with PostGIS extensions
# This ensures Atlas dev database has extensions enabled when validating schema

# First, output the extensions
cat db/atlas/extensions.sql

# Then, output the Drizzle schema with post-processing
# Drizzle-kit has a bug where some schema-qualified enums lose their prefix in column definitions
# We fix this by adding the "genealogy." prefix to unqualified date_precision references in column defs
# Only replace unqualified references (not already prefixed with "genealogy".)
npx drizzle-kit export | sed \
  -E 's/([^".])date_precision( DEFAULT)/\1"genealogy"."date_precision"\2/g'
