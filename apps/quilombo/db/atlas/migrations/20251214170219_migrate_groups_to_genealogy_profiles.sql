-- Migrate existing groups to genealogy profiles
-- Creates a genealogy.group_profiles entry for each public.groups entry without profile_id
-- Handles duplicate names by creating separate profiles for each group
-- Note: logo is NOT migrated (IPFS files cannot be copied)

-- Drop unique constraint on group_profiles.name (groups can have duplicate names)
DROP INDEX IF EXISTS genealogy.group_profiles_name_unique_idx;

DO $$
DECLARE
  g RECORD;
  new_profile_id UUID;
BEGIN
  FOR g IN
    SELECT id, name, description, style
    FROM public.groups
    WHERE profile_id IS NULL
  LOOP
    -- Create new genealogy profile (casting public.style to genealogy.style)
    INSERT INTO genealogy.group_profiles (id, name, description_en, style)
    VALUES (
      gen_random_uuid(),
      g.name,
      g.description,
      g.style::text::genealogy.style
    )
    RETURNING id INTO new_profile_id;

    -- Link group to new profile
    UPDATE public.groups
    SET profile_id = new_profile_id
    WHERE id = g.id;
  END LOOP;

  RAISE NOTICE 'Migration complete: created genealogy profiles for all groups';
END $$;
