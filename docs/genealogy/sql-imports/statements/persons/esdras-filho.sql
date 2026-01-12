-- ============================================================
-- STATEMENTS FOR: Esdras Filho
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Esdras Filho is the SUBJECT.
-- ============================================================

-- Esdras Filho student_of Damião (father, primary teacher from 1960)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.capoeirabesouromanganga.com.br/hist%C3%B3ria?lang=en',
  'Father-son transmission; began at age 7 in Brasília with Sunday home lessons',
  'Transmissão pai-filho; começou aos 7 anos em Brasília com aulas aos domingos em casa'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Esdras Filho' AND o.apelido = 'Damião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Esdras Filho trained_under Suassuna (Cordão de Ouro, late 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'decade'::genealogy.date_precision,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://grupocordaodeouro.com.br/sua-historia/',
  'Part of Suassuna''s first generation at Cordão de Ouro alongside Lobão, Tarzan, Belisco, Almir das Areias',
  'Parte da primeira geração de Suassuna no Cordão de Ouro ao lado de Lobão, Tarzan, Belisco, Almir das Areias'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Esdras Filho' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Esdras Filho family_of Damião (son of)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.capoeirabesouromanganga.com.br/hist%C3%B3ria?lang=en',
  'Biological son of Mestre Damião',
  'Filho biológico de Mestre Damião'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Esdras Filho' AND o.apelido = 'Damião'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Esdras Filho co_founded Besouro Mangangá - group not yet imported
-- Esdras Filho member_of Cordão de Ouro - group not yet imported
