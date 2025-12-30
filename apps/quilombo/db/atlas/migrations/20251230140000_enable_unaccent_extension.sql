-- Enable unaccent extension for accent-insensitive text search
-- This allows searching for "Jose" to match "José", etc.
CREATE EXTENSION IF NOT EXISTS unaccent;
