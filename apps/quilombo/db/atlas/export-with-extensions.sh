#!/bin/bash
# Script to export Drizzle schema with PostGIS extensions
# This ensures Atlas dev database has extensions enabled when validating schema

# First, output the extensions
cat db/atlas/extensions.sql

# Then, output the Drizzle schema
npx drizzle-kit export
