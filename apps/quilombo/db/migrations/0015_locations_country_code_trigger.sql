ALTER TABLE group_locations ADD COLUMN country_code varchar(2);

CREATE OR REPLACE FUNCTION set_country_code_from_feature()
RETURNS trigger AS $$
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

CREATE TRIGGER trg_set_country_code
BEFORE INSERT OR UPDATE ON group_locations
FOR EACH ROW
EXECUTE FUNCTION set_country_code_from_feature();