CREATE OR REPLACE FUNCTION set_country_code_from_feature()
RETURNS trigger 
SET search_path = public,extensions,gis
AS $$
BEGIN
  NEW.country_code :=
    COALESCE(
      (
        SELECT value->>'country_code'
        FROM jsonb_array_elements(NEW.feature->'context') AS value
        WHERE value->>'id' LIKE 'country.%'
        LIMIT 1
      ),
      NEW.feature->'properties'->>'country_code'
    );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_country_code_events
BEFORE INSERT OR UPDATE ON events
FOR EACH ROW
EXECUTE FUNCTION set_country_code_from_feature();