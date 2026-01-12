-- ============================================================
-- STATEMENTS FOR: Tatá
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Tatá is the SUBJECT.
-- ============================================================

-- Tatá trained_under Waldemar
-- Trained at Waldemar's barracão in Liberdade, Salvador (~1950s)
-- Note: Used trained_under rather than student_of as no formal
-- student relationship is documented, only participation in the roda
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'João Grande 1989 interview (Capoeira Connection); velhosmestres.com/en/featured-44',
  'Tatá trained at Waldemar''s barracão in Liberdade, Salvador during the early 1950s. João Grande described him as one of the "snakes, experts" there.',
  'Tatá treinou no barracão de Waldemar na Liberdade, Salvador durante o início dos anos 1950. João Grande o descreveu como uma das "cobras, peritos" de lá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Tatá' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Diogo - training companion mentioned by João Grande; needs import
