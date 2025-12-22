-- ============================================================
-- STATEMENTS FOR: Pequena (Maria Bispo)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Pequena is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Pequena family_of Malvadeza (spouse relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "spouse"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Maria Bispo (Pequena) was married to José Martins dos Santos (Malvadeza). Both were capoeiristas, and Maria came from a family of angoleiros in Santo Amaro.',
  E'Maria Bispo (Pequena) era casada com José Martins dos Santos (Malvadeza). Ambos eram capoeiristas, e Maria veio de uma família de angoleiros em Santo Amaro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pequena' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Pequena is OBJECT:
-- ============================================================
-- Curió family_of Pequena - to add to curio.sql (parent relationship)
-- Malvadeza family_of Pequena - in malvadeza.sql (spouse relationship)
