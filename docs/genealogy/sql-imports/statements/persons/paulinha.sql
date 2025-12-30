-- ============================================================
-- STATEMENTS FOR: Paulinha
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Paulinha is the SUBJECT.
-- ============================================================

-- Paulinha student_of Moraes (primary teacher at GCAP, early 1980s-1995)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  '1995-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://mandingueira.ca/category/female-mestres/; https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers',
  'Primary teacher at GCAP in Salvador. Paulinha trained under Moraes for 15 years from early 1980s until Nzinga founding in 1995.',
  'Professor principal no GCAP em Salvador. Paulinha treinou com Moraes por 15 anos desde o início dos anos 1980 até a fundação do Nzinga em 1995.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulinha' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulinha trained_under João Grande (taught at GCAP mid-1980s-1990)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1985-01-01'::date, 'approximate'::genealogy.date_precision,
  '1990-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/',
  'João Grande taught at GCAP in Salvador in the mid-1980s after Moraes and Cobra Mansa convinced him to return from retirement. He left for New York in 1990.',
  'João Grande ensinou no GCAP em Salvador em meados dos anos 1980 após Moraes e Cobra Mansa convencê-lo a sair da aposentadoria. Ele partiu para Nova York em 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulinha' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulinha trained_under Cobra Mansa (taught at GCAP 1981-1994)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-01-01'::date, 'approximate'::genealogy.date_precision,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/; https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers',
  'Cobra Mansa taught at GCAP in Salvador from 1981 until he moved to Washington DC in 1994. Paulinha trained under him during this period.',
  'Cobra Mansa ensinou no GCAP em Salvador de 1981 até sua mudança para Washington DC em 1994. Paulinha treinou com ele durante este período.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulinha' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Paulinha co_founded Grupo Nzinga (1995) - group not yet imported
-- Paulinha leads Grupo Nzinga Salvador nucleus - group not yet imported
-- Paulinha member_of GCAP (early 1980s-1995) - group not yet imported
-- Paulinha received_title_from ? (contra-mestra 1990) - title grantor unknown
-- Paulinha associated_with Poloca (co-founders Nzinga) - Poloca not yet imported

-- ============================================================
-- AVAILABLE RELATIONSHIPS (can be added once entity SQL is executed)
-- ============================================================
-- Paulinha associated_with Janja (co-founders Nzinga) - Janja SQL exists, can generate once both entities are in DB
