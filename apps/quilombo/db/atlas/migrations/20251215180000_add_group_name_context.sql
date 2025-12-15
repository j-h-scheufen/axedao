-- Add name_context column for disambiguating groups with the same name
-- Pattern matches person_profiles.apelido_context for idempotent SQL imports

-- Add the nullable name_context column
ALTER TABLE genealogy.group_profiles
ADD COLUMN name_context VARCHAR(100) NULL;

-- Create unique index on (name, COALESCE(name_context, ''))
-- This allows ON CONFLICT to work for idempotent imports
-- Groups with the same name must have different name_context values
CREATE UNIQUE INDEX group_profiles_name_unique_idx
ON genealogy.group_profiles (name, COALESCE(name_context, ''));
