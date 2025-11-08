-- Initialize PostGIS extension and custom schemas
-- This runs automatically when the container is first created

-- Create extensions schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS extensions;

-- Create gis schema for PostGIS objects
CREATE SCHEMA IF NOT EXISTS gis;

-- Install PostGIS in the gis schema
CREATE EXTENSION IF NOT EXISTS postgis SCHEMA gis;

-- Grant usage on schemas
GRANT USAGE ON SCHEMA extensions TO postgres;
GRANT USAGE ON SCHEMA gis TO postgres;

-- Set search path to include all schemas
ALTER DATABASE postgres SET search_path TO "$user", public, extensions, gis;
