-- ============================================================
-- STATEMENTS FOR: Índio (ACAD)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Índio (ACAD) is the SUBJECT.
-- Note: Uses apelido_context = 'ACAD' to distinguish from
-- Índio (Mercado Modelo).
-- ============================================================

-- Índio (ACAD) received_title_from Rogério (2004)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2004-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Received mestre title from Mestre Rogério in 2004, twelve years after co-founding ACAD. This confirmed the lineage continuation from Moraes and Cobra Mansa through Rogério.',
  E'Recebeu título de mestre de Mestre Rogério em 2004, doze anos após co-fundar a ACAD. Isso confirmou a continuação da linhagem de Moraes e Cobra Mansa através de Rogério.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Índio' AND COALESCE(s.apelido_context, '') = 'ACAD'
  AND o.apelido = 'Rogério' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Índio (ACAD) student_of Rogério (~1986-2004)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-01-01'::date, 'approximate'::genealogy.date_precision,
  '2004-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://casadobrada.wordpress.com/associacao-de-capoeira-angola-dobrada-en/',
  E'Primary student of Rogério. Start date approximate - Índio was in Belo Horizonte in mid-1980s, Rogério founded first Angola school there ~1989. Relationship continued through ACAD co-founding (1992) until mestre title (2004).',
  E'Aluno principal de Rogério. Data de início aproximada - Índio estava em Belo Horizonte em meados de 1980, Rogério fundou primeira escola de Angola lá ~1989. Relação continuou através da co-fundação da ACAD (1992) até título de mestre (2004).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Índio' AND COALESCE(s.apelido_context, '') = 'ACAD'
  AND o.apelido = 'Rogério' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Índio (ACAD) co_founded ACAD (1992) - ACAD group not yet imported
-- Índio (ACAD) leads ACAD (1992-present) - ACAD group not yet imported
-- Índio (ACAD) teaches_at ACAD Bologna - ACAD group not yet imported
-- Índio (ACAD) teaches_at ACAD Cesena - ACAD group not yet imported
