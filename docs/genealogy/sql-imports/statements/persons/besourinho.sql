-- ============================================================
-- STATEMENTS FOR: Besourinho
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Besourinho is the subject.
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
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34 (1972 interview)',
  E'Onça Preta (b. 1909) stated he "jumped with" (pulei com) Besourinho as a boy in Salvador. Training ended when Besourinho was killed during Pedrito persecution.',
  E'Onça Preta (n. 1909) afirmou que "pulou com" Besourinho quando menino em Salvador. O treino terminou quando Besourinho foi morto durante a perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Besourinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
