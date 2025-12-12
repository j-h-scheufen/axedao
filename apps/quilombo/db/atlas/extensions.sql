-- Enable PostGIS extension for spatial data types
CREATE EXTENSION IF NOT EXISTS postgis;

-- Note: The genealogy schema is created automatically by Drizzle export
-- (via pgSchema('genealogy') in db/schema/genealogy.ts)
