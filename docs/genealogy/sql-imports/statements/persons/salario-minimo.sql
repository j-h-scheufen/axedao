-- ============================================================
-- STATEMENTS FOR: Salário Mínimo
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Salário Mínimo is the SUBJECT.
-- ============================================================

-- Salário Mínimo student_of Bimba
-- Source: CapoeiraHub lineage listing, Abolição Capoeira France website
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
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraHub lineage listing; Abolição Capoeira Angers website',
  'Trained at Centro de Cultura Física Regional da Bahia in Salvador. Training ended with Bimba''s death in February 1974.',
  'Treinou no Centro de Cultura Física Regional da Bahia em Salvador. Treinamento terminou com a morte de Bimba em fevereiro de 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Salário Mínimo' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Salário Mínimo founded Abolição Capoeira (2000) - group not in dataset
-- Salário Mínimo teacher_of Nenei - Nenei not in dataset
-- Salário Mínimo teacher_of Monitor Nó Cego - not in dataset
-- Salário Mínimo associated_with Contra Mestre Bobô - not in dataset
