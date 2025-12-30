-- ============================================================
-- STATEMENTS FOR: Rogério
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Rogério is the SUBJECT.
-- ============================================================

-- Rogério received_title_from Moraes (1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Received mestre title from Mestre Moraes (GCAP) in 1989. Part of dual recognition alongside Cobra Mansa.',
  E'Recebeu título de mestre de Mestre Moraes (GCAP) em 1989. Parte de reconhecimento duplo junto com Cobra Mansa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Moraes' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério received_title_from Cobra Mansa (1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Received mestre title from Mestre Cobra Mansa (FICA) in 1989. Part of dual recognition alongside Moraes.',
  E'Recebeu título de mestre de Mestre Cobra Mansa (FICA) em 1989. Parte de reconhecimento duplo junto com Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Cobra Mansa' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério trained_under Moraes (1972-1989)
-- Note: Using trained_under rather than student_of since exact training relationship unclear
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Trained under Moraes. Started capoeira in Rio de Janeiro in 1972, titled mestre 1989. Training period 17 years. Exact nature of training relationship not specified in sources.',
  E'Treinou com Moraes. Começou capoeira no Rio de Janeiro em 1972, titulado mestre em 1989. Período de treinamento de 17 anos. Natureza exata da relação de treinamento não especificada nas fontes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Moraes' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério trained_under Cobra Mansa (1970s-1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://casadobrada.wordpress.com/mestre-rogerio-en/',
  E'Trained under Cobra Mansa. Titled by Cobra Mansa (FICA) in 1989. Training start date unknown.',
  E'Treinou com Cobra Mansa. Titulado por Cobra Mansa (FICA) em 1989. Data de início do treinamento desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Cobra Mansa' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rogério co_founded ACAD (1992) - ACAD group not yet imported
-- Rogério leads ACAD (1992-present) - ACAD group not yet imported
-- Rogério gave_title_to Mestre Índio (2004) - Índio person not yet imported
-- Rogério trained Mestre Matthias (Freiburg) - person not yet imported
-- Rogério trained Mestre Ricardo (Freiburg) - person not yet imported
-- Rogério trained Contra-mestre Iran Joter (Belo Horizonte) - person not yet imported
-- Rogério trained Contra-mestre Wellington-Negão (Curitiba) - person not yet imported
-- Rogério trained Contra-mestre Bruno (Bologna) - person not yet imported
