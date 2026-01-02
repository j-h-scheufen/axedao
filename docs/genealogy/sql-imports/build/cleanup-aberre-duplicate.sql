-- ============================================================
-- CLEANUP: Remove duplicate "Aberrê de Santo Amaro" profile
-- Created: 2026-01-02
-- ============================================================
-- This script removes the erroneous duplicate "Aberrê de Santo Amaro"
-- (Antônio Rufino dos Santos) profile that was created based on the
-- "two Aberrês" theory.
--
-- Research (January 2026) determined there was ONE person:
-- Antônio Raimundo Argolo, born in Santo Amaro da Purificação,
-- who moved to Salvador as a teenager. The "Aberrê de Santo Amaro"
-- designation refers to his birthplace, not a second person.
--
-- The main Aberrê profile (apelido='Aberrê', apelido_context=NULL)
-- has been updated with the corrected birthplace.
-- ============================================================

-- First, delete any statements where this profile is the subject or object
-- (Statements have ON DELETE CASCADE from person_profiles, but let's be explicit)

DELETE FROM genealogy.statements
WHERE (subject_type = 'person' AND subject_id IN (
    SELECT id FROM genealogy.person_profiles
    WHERE apelido = 'Aberrê' AND apelido_context = 'Santo Amaro'
))
OR (object_type = 'person' AND object_id IN (
    SELECT id FROM genealogy.person_profiles
    WHERE apelido = 'Aberrê' AND apelido_context = 'Santo Amaro'
));

-- Now delete the duplicate profile
DELETE FROM genealogy.person_profiles
WHERE apelido = 'Aberrê' AND apelido_context = 'Santo Amaro';

-- Verify the cleanup
DO $$
DECLARE
    remaining_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO remaining_count
    FROM genealogy.person_profiles
    WHERE apelido = 'Aberrê' AND apelido_context = 'Santo Amaro';

    IF remaining_count > 0 THEN
        RAISE EXCEPTION 'Cleanup failed: % duplicate Aberrê profiles still exist', remaining_count;
    END IF;

    RAISE NOTICE 'Cleanup successful: Aberrê de Santo Amaro duplicate removed';
END $$;
