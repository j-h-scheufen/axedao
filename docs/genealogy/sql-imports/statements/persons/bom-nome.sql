-- ============================================================
-- STATEMENTS FOR: Bom Nome
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Bom Nome is the SUBJECT.
-- ============================================================

-- Bom Nome co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Classical texts of capoeira history',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Bom Nome' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Bom Nome.
-- No students documented.
-- ============================================================
