-- ============================================================
-- STATEMENTS FOR: Júlio França
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Júlio França is the SUBJECT.
-- ============================================================

-- Júlio França student_of Cobrinha Verde
-- Source: A Tarde newspaper, May 2, 1982 - describes Júlio as
-- Cobrinha Verde's "discípulo" (disciple/student)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown (childhood)
  '1983-05-12'::date, 'exact'::genealogy.date_precision, -- Ended with Cobrinha Verde's death
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde newspaper, May 2, 1982, by Reynivaldo Brito (velhosmestres.com/br/cobrinha-1982-5)',
  'Júlio was Cobrinha Verde''s son and described as his "discípulo e grande capoeirista" (disciple and great capoeirista) in 1982. This was a primary teacher-student relationship, not just family instruction.',
  'Júlio era filho de Cobrinha Verde e descrito como seu "discípulo e grande capoeirista" em 1982. Esta era uma relação primária mestre-aluno, não apenas instrução familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlio França' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Júlio França family_of Cobrinha Verde
-- Relationship type: son
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
  '{"relationship_type": "son"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde newspaper, May 2, 1982 (velhosmestres.com/br/cobrinha-1982-5)',
  'Júlio was the biological son of Cobrinha Verde (Rafael Alves França). In 1982, Cobrinha Verde was living at Júlio''s home due to health issues.',
  'Júlio era filho biológico de Cobrinha Verde (Rafael Alves França). Em 1982, Cobrinha Verde estava morando na casa de Júlio devido a problemas de saúde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Júlio França' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- None identified - Cobrinha Verde is already in the dataset
-- ============================================================
