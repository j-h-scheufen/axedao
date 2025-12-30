-- ============================================================
-- STATEMENTS FOR: Sete (Gegê teacher)
-- Generated: 2025-12-30
-- ============================================================
-- Contains all relationships where Sete (Gegê teacher) is the SUBJECT.
-- Uses apelido_context 'Gegê teacher' for disambiguation.
-- ============================================================

-- Sete trained_under Onça Preta
-- Sete learned capoeira from Onça Preta (Cícero Navarro) in Salvador, likely 1940s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'aldeiacapoeira.com Mestre Gegê biography',
  'Sete learned capoeira from Onça Preta in Salvador. Onça Preta was born 1909 and was teaching by the 1940s.',
  'Sete aprendeu capoeira com Onça Preta em Salvador. Onça Preta nasceu em 1909 e estava ensinando na década de 1940.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sete' AND s.apelido_context = 'Gegê teacher' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Sete trained_under Cobrinha Verde
-- Sete learned capoeira from Rafael (Cobrinha Verde), likely 1940s
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'aldeiacapoeira.com Mestre Gegê biography',
  'Sete learned capoeira from Rafael (Cobrinha Verde). Cobrinha Verde was born 1912 and began teaching in 1935.',
  'Sete aprendeu capoeira com Rafael (Cobrinha Verde). Cobrinha Verde nasceu em 1912 e começou a ensinar em 1935.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sete' AND s.apelido_context = 'Gegê teacher' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: The relationship "Gegê student_of Sete" belongs in gege.sql
-- (statement ownership rule: statements go in the SUBJECT's file)
-- ============================================================
