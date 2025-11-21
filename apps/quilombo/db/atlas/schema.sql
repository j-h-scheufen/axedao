-- PostGIS extension required for geometry types
-- This is combined with Drizzle schema via composite_schema in atlas.hcl
CREATE SCHEMA IF NOT EXISTS gis;
CREATE EXTENSION IF NOT EXISTS postgis SCHEMA gis;
