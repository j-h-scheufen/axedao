-- ============================================================
-- STATEMENTS FOR: Zoião
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Zoião is the SUBJECT.
-- ============================================================

-- Zoião student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CDO Sergipe, Capoeira Alto Astral, velhosmestres.com',
  'Primary teacher; trained at Centro de Cultura Física Regional in Salvador. Exact dates unknown but was classmate of Maneca Brandão and experienced enough to help teach in 1958.',
  'Professor principal; treinou no Centro de Cultura Física Regional em Salvador. Datas exatas desconhecidas mas era colega de turma de Maneca Brandão e experiente o suficiente para ajudar a ensinar em 1958.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zoião' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zoião associated_with Maneca Brandão (classmate)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "classmate at Bimba academy; helped with teaching at Major Dória academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'CDO Sergipe: "Na academia Major Dória que ministrava as aulas era o Maneca Brandão, aluno do Mestre Bimba, e seu companheiro de turma Zoião o ajudava nos treinamentos às vezes"',
  'Classmate (companheiro de turma) at Mestre Bimba''s academy in Salvador. Zoião sometimes helped Maneca Brandão with training sessions at Major Dória''s academy in Itabuna (1958).',
  'Colega de turma (companheiro de turma) na academia de Mestre Bimba em Salvador. Zoião às vezes ajudava Maneca Brandão com treinamentos na academia do Major Dória em Itabuna (1958).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zoião' AND o.apelido = 'Maneca Brandão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zoião associated_with Vermelho 27 (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "historical photo together with Bimba and Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-17',
  'Appears together in historical photograph captioned "M Vermelho 27, M Bimba, M Pastinha, M Zoião".',
  'Aparece junto em fotografia histórica com legenda "M Vermelho 27, M Bimba, M Pastinha, M Zoião".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zoião' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zoião associated_with Pastinha (photographed together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "historical photo together with Bimba and Vermelho 27"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-17',
  'Appears together in historical photograph captioned "M Vermelho 27, M Bimba, M Pastinha, M Zoião".',
  'Aparece junto em fotografia histórica com legenda "M Vermelho 27, M Bimba, M Pastinha, M Zoião".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zoião' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Reverse relationships (from other subjects to Zoião)
-- are NOT included here per ownership rule.
-- ============================================================
-- The following relationships have Zoião as OBJECT:
-- - Suassuna -> associated_with -> Zoião (Zoião helped at academy where Suassuna trained)
--   This should go in suassuna.sql if not already there
-- ============================================================
