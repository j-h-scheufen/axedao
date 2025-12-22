-- ============================================================
-- STATEMENTS FOR: Léo (São Braz)
-- Generated: 2025-12-22
-- ============================================================
-- Contains all relationships where Léo is the SUBJECT.
-- Uses apelido_context='São Braz' for Léo to distinguish from other Léos.
-- ============================================================

-- Léo student_of João Catarino
-- João Catarino SQL EXISTS: joao-catarino.sql
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-45',
  'Léo learned from João Catarino, who was a student of Besouro Mangangá. The velhosmestres.com profile of Mestre Messias states that Mestre Léo was "aluno de João Catarino, quem foi aluno de Besouro" (student of João Catarino, who was a student of Besouro).',
  'Léo aprendeu com João Catarino, que foi aluno de Besouro Mangangá. O perfil do velhosmestres.com de Mestre Messias afirma que Mestre Léo era "aluno de João Catarino, quem foi aluno de Besouro".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Léo' AND s.apelido_context = 'São Braz'
  AND o.apelido = 'João Catarino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Additional relationships exist but the subjects are
-- Gato Preto and Messias, so statements go in THEIR files.
--
-- Gato Preto trained_under Léo (from 1942)
--   → Goes in gato-preto.sql statements file
--
-- Messias student_of Léo (from 1942, formed mestre 1947)
--   → Goes in messias.sql statements file (needs import first)
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None - João Catarino is the only object where Léo is subject
-- ============================================================
