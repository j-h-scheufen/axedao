-- Update set_country_code_from_feature function to ensure UPPER case
-- This function is used by both group_locations and events tables
CREATE OR REPLACE FUNCTION set_country_code_from_feature()
RETURNS trigger
SET search_path = public,extensions,gis
AS $$
BEGIN
  NEW.country_code :=
    UPPER(
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
