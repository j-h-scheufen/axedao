-- Add country code extraction function and triggers
-- This function extracts country codes from GeoJSON features and normalizes them to lowercase
-- Used by both group_locations and events tables

CREATE OR REPLACE FUNCTION set_country_code_from_feature()
RETURNS trigger
SET search_path = public,extensions,gis
AS $$
BEGIN
  NEW.country_code :=
    LOWER(
      COALESCE(
        NEW.feature->'properties'->>'country_code',
        (
          SELECT value->>'country_code'
          FROM jsonb_array_elements(NEW.feature->'context') AS value
          WHERE value->>'id' LIKE 'country.%'
          LIMIT 1
        )
      )
    );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger for group_locations table (drop if exists, then create)
DROP TRIGGER IF EXISTS trg_set_country_code ON group_locations;
CREATE TRIGGER trg_set_country_code
BEFORE INSERT OR UPDATE ON group_locations
FOR EACH ROW
EXECUTE FUNCTION set_country_code_from_feature();

-- Trigger for events table (drop if exists, then create)
DROP TRIGGER IF EXISTS trg_set_country_code_events ON events;
CREATE TRIGGER trg_set_country_code_events
BEFORE INSERT OR UPDATE ON events
FOR EACH ROW
EXECUTE FUNCTION set_country_code_from_feature();
