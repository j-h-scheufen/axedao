-- ============================================================
-- STATEMENTS FOR: Alfredo (Muritiba)
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Alfredo (Muritiba) is the SUBJECT.
-- Note: Alfredo uses apelido_context = 'Muritiba' to distinguish from
-- other Alfredos in the dataset.
-- ============================================================

-- Alfredo student_of Canjiquinha
-- Confirmed via CapoeiraHub lineage tree and IPHAN portal
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.capoeirahub.net/mestres/691f68fce44abad5a573a024-mestre-roberval?lang=en; https://capoeira.iphan.gov.br/user/infor/5170',
  E'CapoeiraHub lineage shows: Roberval → Alfredo → Canjiquinha → Aberrê → Pastinha. IPHAN portal confirms Alfredo was disciple of Canjiquinha.',
  E'Linhagem CapoeiraHub mostra: Roberval → Alfredo → Canjiquinha → Aberrê → Pastinha. Portal IPHAN confirma que Alfredo foi discípulo de Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Alfredo' AND s.apelido_context = 'Muritiba' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationships have Alfredo as OBJECT (not subject).
-- Per ownership rules, they belong in the SUBJECT's file.
-- These are documented here for reference but should be added to the
-- respective subject's statements file when those persons are imported:
--
-- Olavo student_of Alfredo (Muritiba)
--   → Goes in olavo.sql (Olavo IS in dataset - need to add to olavo statements)
--
-- Roberval student_of Alfredo (Muritiba) - began 1978/79; graduated mestre 1986
--   → Goes in roberval.sql when Roberval is imported
--
-- ============================================================

-- ============================================================
-- UPDATE NEEDED: olavo.sql statements
-- ============================================================
-- The following statement should be added to olavo.sql:
-- Olavo student_of Alfredo (Muritiba)
-- This was noted as pending in olavo.sql:173 before Alfredo was imported.
-- Now that Alfredo is in the dataset, this can be activated.
-- ============================================================
