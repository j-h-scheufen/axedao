-- ============================================================
-- STATEMENTS FOR: Massú
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Massú is the SUBJECT.
-- ============================================================

-- Massú associated_with Rosa Palmeirão
-- VALID: They share a chapter in Pedro Abib's book, implying a documented pairing/connection
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "paired_in_scholarship"}'::jsonb,
  'likely'::genealogy.confidence,
  'Pedro Abib, "Mestres e Capoeiras Famosos da Bahia" (EDUFBA 2009) - Chapter: Rosa Palmeirão e Massú: Vacila pra tu vê!',
  'Paired together in Pedro Abib''s book chapter, suggesting a documented connection or parallel significance',
  'Pareadas juntas em capítulo do livro de Pedro Abib, sugerindo conexão documentada ou significância paralela'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Massú' AND o.apelido = 'Rosa Palmeirão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other valentonas (Salomé, Chicão, Catu, etc.) are
-- contemporaries but no documented direct connection exists.
-- Their contemporaneity is noted in the biography, not as
-- formal relationships.
-- ============================================================
