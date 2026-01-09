-- ============================================================
-- STATEMENTS FOR: Irineu (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Irineu is the SUBJECT.
-- ============================================================

-- Irineu (Bonfim) student_of Mário Buscapé
-- Irineu was the first student of Mário Buscapé, meeting him at the Cavan
-- company in Rio de Janeiro in the early 1950s. Through Irineu, Mário gained
-- access to the dos Santos brothers (Zé Grande, Deraldo) who became co-founders
-- of Grupo Bonfim.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'First student of Mário Buscapé in Rio de Janeiro. Met at Cavan company (lamp post manufacturer). Through Irineu, Mário gained his brothers Zé Grande and Deraldo as students.',
  'Primeiro aluno de Mário Buscapé no Rio de Janeiro. Conheceram-se na empresa Cavan (fabricante de postes de luz). Através de Irineu, Mário ganhou seus irmãos Zé Grande e Deraldo como alunos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Irineu (Bonfim) family_of Zé Grande (Bonfim)
-- The dos Santos brothers (Irineu, Zé Grande, Deraldo) came to Rio from Bahia
-- together in the early 1950s. They are NOT related to Mário dos Santos (Mário
-- Buscapé) despite sharing the same surname.
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
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Brothers from the dos Santos family of Bahia. All three came to Rio de Janeiro together in the early 1950s.',
  'Irmãos da família dos Santos da Bahia. Os três vieram juntos para o Rio de Janeiro no início dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Zé Grande' AND o.apelido_context = 'Bonfim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Irineu (Bonfim) family_of Deraldo
-- The dos Santos brothers (Irineu, Zé Grande, Deraldo) came to Rio from Bahia
-- together in the early 1950s.
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
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  'Brothers from the dos Santos family of Bahia. All three came to Rio de Janeiro together in the early 1950s.',
  'Irmãos da família dos Santos da Bahia. Os três vieram juntos para o Rio de Janeiro no início dos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Irineu' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Deraldo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Irineu (Bonfim) co_founded Associação Cultural Bonfim (Grupo Bonfim)
-- The group was founded January 6, 1953. Grupo Bonfim is in groups-backlog.md
-- and needs to be imported before this statement can be added.
-- ============================================================
