-- ============================================================
-- STATEMENTS FOR: Janja
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Janja is the SUBJECT.
-- Objects: Moraes, João Grande, Cobra Mansa are in dataset.
-- Pending: Paulinha, Poloca, Grupo Nzinga, GCAP (not yet imported)
-- ============================================================

-- Janja student_of Moraes (primary teacher at GCAP, 1983-1995)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '1995-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources: capoeirahistory.com, mandingueira.ca, portalcapoeira.com',
  E'Janja trained at GCAP Salvador under Mestre Moraes from 1983. She spent 15 years with GCAP, becoming a contra-mestra before leaving in 1995 to found Grupo Nzinga.',
  E'Janja treinou no GCAP Salvador sob Mestre Moraes a partir de 1983. Passou 15 anos no GCAP, tornando-se contra-mestra antes de sair em 1995 para fundar o Grupo Nzinga.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Janja' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Janja trained_under João Grande (at GCAP, 1980s-1990s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '1990-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Nzinga Marburg website, Mandingueira.ca',
  E'João Grande taught at GCAP in Salvador after Moraes and Cobra Mansa convinced him to return from retirement (mid-1980s). He left for New York in 1990. Multiple sources list João Grande among Janja''s teachers.',
  E'João Grande ensinou no GCAP em Salvador depois que Moraes e Cobra Mansa o convenceram a sair da aposentadoria (meados dos anos 1980). Ele partiu para Nova York em 1990. Múltiplas fontes listam João Grande entre os mestres de Janja.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Janja' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Janja trained_under Cobra Mansa (at GCAP, 1983-1995)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '1995-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Nzinga Marburg website, Mandingueira.ca',
  E'Cobra Mansa arrived in Salvador with Moraes in 1982 and taught at GCAP. Multiple sources list Cobra Mansa among Janja''s teachers alongside Moraes and João Grande.',
  E'Cobra Mansa chegou em Salvador com Moraes em 1982 e ensinou no GCAP. Múltiplas fontes listam Cobra Mansa entre os mestres de Janja junto com Moraes e João Grande.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Janja' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Janja member_of GCAP (1983-1995) - GCAP group not yet imported
-- Janja departed_from GCAP (1995, neutral - left to found Nzinga) - GCAP group not yet imported
-- Janja co_founded Grupo Nzinga (1995) - Group not yet imported
-- Janja leads Grupo Nzinga (1995-present) - Group not yet imported
-- Janja associated_with Paulinha (co-founders of Nzinga, fellow GCAP students) - Paulinha not yet imported
-- Janja associated_with Poloca (co-founders of Nzinga, fellow GCAP students) - Poloca not yet imported
