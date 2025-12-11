-- ============================================================
-- STATEMENTS FOR: Madame Satã
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Madame Satã is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1909-01-01'::date, 'year'::genealogy.date_precision,
  '1923-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Madame Satã interview, O Pasquim 1971: "The greatest malandro of Rio de Janeiro that I knew from 1907 until today was the one who taught me to be a malandro and met me when I was 9 years old, the late Sete Coroas."',
  'Primary teacher-student relationship. Sete Coroas taught Madame Satã "the fine art of malandragem": capoeira, navalha fighting, smooth talk, rasteira, and bravado. When Sete Coroas died in 1923, he left Satã as his successor in Lapa and Saúde.',
  'Relação primária professor-aluno. Sete Coroas ensinou a Madame Satã "a fina arte da malandragem": capoeira, luta de navalha, papo, rasteira e valentia. Quando Sete Coroas morreu em 1923, deixou Satã como seu sucessor na Lapa e na Saúde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madame Satã' AND o.apelido = 'Sete Coroas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
