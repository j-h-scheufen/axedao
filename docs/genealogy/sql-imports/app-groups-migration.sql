-- ============================================================
-- APP GROUPS TO GENEALOGY MIGRATION
-- Run AFTER historical genealogy data import completes
-- ============================================================
--
-- This migration creates genealogy.group_profiles entries for app groups
-- (from the-capoeira-list import) that don't yet have a profile_id.
--
-- Prerequisites:
-- 1. Atlas migrations applied (schema ready)
-- 2. Historical genealogy pending-migration applied (mestres imported)
-- 3. App groups exist in public.groups (from the-capoeira-list)
--
-- Usage:
-- 1. Include this in the next genealogy pending-migration build
-- 2. Or run directly: pnpm db:local:psql < docs/genealogy/sql-imports/app-groups-migration.sql
-- ============================================================

BEGIN;

-- Create genealogy profiles for app groups without profile_id
DO $$
DECLARE
  g RECORD;
  new_profile_id UUID;
  website_urls TEXT[];
  groups_processed INT := 0;
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

    groups_processed := groups_processed + 1;
  END LOOP;

  RAISE NOTICE 'Created genealogy profiles for % app groups', groups_processed;
END $$;

-- Update existing profiles that have empty public_links
-- (for groups that were linked before website extraction was added)
DO $$
DECLARE
  g RECORD;
  website_urls TEXT[];
  profiles_updated INT := 0;
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

      profiles_updated := profiles_updated + 1;
    END IF;
  END LOOP;

  RAISE NOTICE 'Updated % existing profiles with website URLs', profiles_updated;
END $$;

COMMIT;
