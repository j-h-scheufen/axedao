-- ============================================================
-- STATEMENTS FOR: Nenei
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Nenei is the SUBJECT.
-- ============================================================

-- Nenei student_of Salário Mínimo
-- (Salário Mínimo EXISTS in dataset - already imported)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Ginga Capoeira USA website (gingacapoeira.com/who-we-are)',
  E'Nenei studied Capoeira Regional under Mestre Salário Mínimo, who was a direct student of Mestre Bimba. Exact training dates unknown.',
  E'Nenei estudou Capoeira Regional com Mestre Salário Mínimo, que foi aluno direto de Mestre Bimba. Datas exatas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nenei' AND o.apelido = 'Salário Mínimo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Kiki da Bahia student_of Nenei - Kiki not yet imported
-- Need to import Kiki da Bahia first, then generate:
--   Kiki da Bahia student_of Nenei (family teaching relationship)
--
-- Note: The relationship "Nenei teaches Kiki da Bahia" should be
-- recorded as "Kiki da Bahia student_of Nenei" in Kiki's statements
-- file per the OWNERSHIP RULE (statements go in subject's file).
-- ============================================================
