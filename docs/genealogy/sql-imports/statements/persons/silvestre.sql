-- ============================================================
-- STATEMENTS FOR: Silvestre
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Silvestre is the SUBJECT.
-- Teachers: Waldemar, Caiçara, Pastinha, Bimba (all in dataset)
-- ============================================================

-- Silvestre student_of Waldemar (primary teacher, late 1950s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com/mestres/, velhosmestres.com',
  'Primary teacher; learned capoeira in the second half of the 1950s with Waldemar da Liberdade',
  'Professor principal; aprendeu capoeira na segunda metade dos anos 1950 com Waldemar da Liberdade'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Silvestre' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Silvestre student_of Caiçara (primary teacher, late 1950s; became contra-mestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"became_contramestre": true}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39, matumbecapoeira.com/mestres/',
  'Primary teacher; learned capoeira in the second half of the 1950s with Mestre Caiçara; rose to contra-mestre with authority to sign diplomas',
  'Professor principal; aprendeu capoeira na segunda metade dos anos 1950 com Mestre Caiçara; subiu a contra-mestre com autoridade para assinar diplomas'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Silvestre' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Silvestre trained_under Pastinha (frequented CECA regularly)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'matumbecapoeira.com/mestres/, grupogingarte.no.comunidades.net',
  'Frequented CECA (Pastinha''s academy) regularly during his Salvador years; nature of training relationship unclear',
  'Frequentou o CECA (academia de Pastinha) regularmente durante seus anos em Salvador; natureza da relação de treinamento incerta'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Silvestre' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Silvestre trained_under Bimba (trained with him, extent unclear)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'matumbecapoeira.com/mestres/, grupoliberdadecapoeira.com.br',
  'Trained some classes with Mestre Bimba; extent of training unclear',
  'Treinou algumas aulas com Mestre Bimba; extensão do treinamento incerta'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Silvestre' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Silvestre teaches_at Grupo de Capoeira Vera Cruz - GROUP NOT IN DATASET; add to groups-backlog
-- Silvestre co_founded Federação Paulista de Capoeira - GROUP NOT IN DATASET; add to groups-backlog
-- Silvestre graduated_mestre Mestre Gato de Silvestre (Julival do Espírito Santo) - PERSON NOT IN DATASET; add to persons-backlog
-- Silvestre signed_diploma Fernandinho - already in dataset (Fernando Olímpio Paes Filho, 1948-2001), but relationship type not standard
