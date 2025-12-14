-- Migrate existing groups to genealogy profiles
-- Creates a genealogy.group_profiles entry for each public.groups entry without profile_id
-- Handles duplicate names by creating separate profiles for each group
-- Note: logo is NOT migrated (IPFS files cannot be copied)
-- Website links are migrated to public_links array

-- Drop unique constraint on group_profiles.name (groups can have duplicate names)
DROP INDEX IF EXISTS genealogy.group_profiles_name_unique_idx;

-- Part 1: Create new profiles for groups without profile_id
DO $$
DECLARE
  g RECORD;
  new_profile_id UUID;
  website_urls TEXT[];
BEGIN
  FOR g IN
    SELECT id, name, description, style, links
    FROM public.groups
    WHERE profile_id IS NULL
  LOOP
    -- Extract website URLs from links JSON array
    SELECT COALESCE(
      array_agg(link->>'url'),
      ARRAY[]::TEXT[]
    ) INTO website_urls
    FROM jsonb_array_elements(g.links::jsonb) AS link
    WHERE link->>'type' = 'website' AND link->>'url' IS NOT NULL;

    -- Create new genealogy profile (casting public.style to genealogy.style)
    INSERT INTO genealogy.group_profiles (id, name, description_en, style, public_links)
    VALUES (
      gen_random_uuid(),
      g.name,
      g.description,
      g.style::text::genealogy.style,
      website_urls
    )
    RETURNING id INTO new_profile_id;

    -- Link group to new profile
    UPDATE public.groups
    SET profile_id = new_profile_id
    WHERE id = g.id;
  END LOOP;

  RAISE NOTICE 'Part 1 complete: created genealogy profiles for groups without profile_id';
END $$;

-- Part 2: Update existing profiles that have empty public_links
-- (for groups that were migrated before website extraction was added)
DO $$
DECLARE
  g RECORD;
  website_urls TEXT[];
BEGIN
  FOR g IN
    SELECT gr.id AS group_id, gr.profile_id, gr.links, gp.public_links
    FROM public.groups gr
    JOIN genealogy.group_profiles gp ON gr.profile_id = gp.id
    WHERE gr.profile_id IS NOT NULL
      AND (gp.public_links IS NULL OR gp.public_links = ARRAY[]::TEXT[])
      AND gr.links IS NOT NULL
      AND gr.links::text != '[]'
  LOOP
    -- Extract website URLs from links JSON array
    SELECT COALESCE(
      array_agg(link->>'url'),
      ARRAY[]::TEXT[]
    ) INTO website_urls
    FROM jsonb_array_elements(g.links::jsonb) AS link
    WHERE link->>'type' = 'website' AND link->>'url' IS NOT NULL;

    -- Update profile with website URLs if any found
    IF array_length(website_urls, 1) > 0 THEN
      UPDATE genealogy.group_profiles
      SET public_links = website_urls, updated_at = NOW()
      WHERE id = g.profile_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'Part 2 complete: updated existing profiles with website URLs';
END $$;
