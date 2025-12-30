-- ============================================================
-- STATEMENTS FOR: Poloca
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Poloca is the SUBJECT.
-- ============================================================

-- Poloca student_of Moraes (primary teacher at GCAP, 1983+)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers',
  'Primary teacher at GCAP Salvador from 1983. Poloca rose to contramestre rank under Moraes direction.',
  'Mestre principal no GCAP Salvador a partir de 1983. Poloca alcançou o grau de contramestre sob a direção de Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Poloca trained_under João Grande (taught at GCAP mid-1980s-1990)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1985-01-01'::date, 'decade'::genealogy.date_precision,
  '1990-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/',
  'Trained with João Grande at GCAP during mid-1980s. Sources confirm Poloca trained under "Masters João Grande, Moraes and Cobra Mansa".',
  'Treinou com João Grande no GCAP durante meados dos anos 1980. Fontes confirmam que Poloca treinou sob "Mestres João Grande, Moraes e Cobra Mansa".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Poloca trained_under Cobra Mansa (taught at GCAP 1982+)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://nzinga-marburg.com/2018/02/06/mestras-e-mestres/',
  'Trained with Cobra Mansa at GCAP from 1983. Sources confirm Poloca trained under "Masters João Grande, Moraes and Cobra Mansa".',
  'Treinou com Cobra Mansa no GCAP a partir de 1983. Fontes confirmam que Poloca treinou sob "Mestres João Grande, Moraes e Cobra Mansa".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Poloca associated_with Janja (co-founder of Nzinga, fellow GCAP student)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Nzinga; fellow GCAP student under Moraes"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers',
  'Fellow student at GCAP from 1983. Co-founded Grupo Nzinga together in 1995. Both coordinate the organization today.',
  'Colega de treino no GCAP desde 1983. Co-fundaram o Grupo Nzinga juntos em 1995. Ambos coordenam a organização hoje.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'Janja'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Poloca associated_with Paulinha (co-founder of Nzinga, fellow GCAP student)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Nzinga; fellow GCAP student under Moraes"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers',
  'Fellow student at GCAP from early 1980s. Co-founded Grupo Nzinga together in 1995. Both coordinate the organization today.',
  'Colega de treino no GCAP desde o início dos anos 1980. Co-fundaram o Grupo Nzinga juntos em 1995. Ambos coordenam a organização hoje.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'Paulinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Poloca associated_with Valmir (co-led Ginga Moleque project)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-led Ginga Moleque social project; fellow GCAP members"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://gruponzingaatlanta.wixsite.com/nzingaatlanta/our-teachers, clinicadecapoeira.wordpress.com',
  'Poloca and Valmir co-led the Ginga Moleque social project together. Both were prominent members of GCAP and part of the Capoeira Angola movement in Salvador/Rio in the 1980s-90s.',
  'Poloca e Valmir co-lideraram juntos o projeto social Ginga Moleque. Ambos eram membros proeminentes do GCAP e parte do movimento de Capoeira Angola em Salvador/Rio nos anos 1980-90.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poloca' AND o.apelido = 'Valmir'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Poloca member_of GCAP - group not yet imported (in backlog)
-- Poloca co_founded Grupo Nzinga - group not yet imported (in backlog)
-- Poloca leads Grupo Nzinga (Salvador nucleus) - group not yet imported (in backlog)
