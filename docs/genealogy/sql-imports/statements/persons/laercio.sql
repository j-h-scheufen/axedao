-- ============================================================
-- STATEMENTS FOR: Laércio
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Laércio is the SUBJECT.
-- Laércio is one of the key figures in preserving and internationalizing
-- Capoeira Angola, with extensive training under multiple legendary mestres.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS (student_of / trained_under)
-- ============================================================

-- Laércio student_of Caiçara (primary teacher, 1978+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/, https://www.lalaue.com/capoeira-schools/filhos-de-angola/',
  E'Primary teacher from 1978. Laércio trained secretly at Caiçara''s academy after discovering it through friend Samuel in 1976. Under Caiçara''s guidance, he began leading training sessions as Caiçara could no longer climb to the rooftop.',
  E'Professor principal desde 1978. Laércio treinou em segredo na academia de Caiçara após descobri-la através do amigo Samuel em 1976. Sob orientação de Caiçara, começou a liderar sessões de treino pois Caiçara não podia mais subir ao terraço.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Caiçara'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio trained_under João Pequeno (3 years with GCFA group at Forte Santo Antônio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  '1987-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'GCFA group spent 3 years training with João Pequeno at Forte Santo Antônio, invited through GCAP/Cobra Mansa connection during period when Capoeira Angola was at risk of extinction.',
  E'Grupo GCFA passou 3 anos treinando com João Pequeno no Forte Santo Antônio, convidados através da conexão GCAP/Cobra Mansa durante período em que a Capoeira Angola estava em risco de extinção.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'João Pequeno'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio trained_under Canjiquinha (2 years with GCFA group)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  '1986-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'GCFA group spent 2 years training with Canjiquinha. Part of their immersion in Bahian Angola traditions.',
  E'Grupo GCFA passou 2 anos treinando com Canjiquinha. Parte de sua imersão nas tradições Angola baianas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Canjiquinha'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio trained_under Boca Rica (extended period at Forte Santo Antônio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'GCFA group spent considerable time with Boca Rica. Later shared a room at Forte Santo Antônio with him for two years.',
  E'Grupo GCFA passou um bom tempo com Boca Rica. Depois dividiram uma sala no Forte Santo Antônio com ele por dois anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Boca Rica'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio trained_under João Grande (Sunday classes at Forte Santo Antônio)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  '1990-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'Attended João Grande''s Sunday classes at Forte Santo Antônio within GCAP space. João Grande left for USA at end of 1990.',
  E'Frequentou as aulas de domingo de João Grande no Forte Santo Antônio no espaço do GCAP. João Grande partiu para os EUA no final de 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'João Grande'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio trained_under Moraes (cultural/musical training at GCAP)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'GCFA was invited by Cobra Mansa to join GCAP with Moraes. From Moraes, GCFA learned the cultural and musical value of the roots of Capoeira Angola.',
  E'GCFA foi convidado por Cobra Mansa para fazer parte do GCAP com Moraes. Com Moraes, GCFA aprendeu o valor cultural e musical das raízes da Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Moraes'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- INFLUENCE RELATIONSHIPS (roda encounters, not formal training)
-- ============================================================

-- Laércio influenced_by Waldemar (at Salvador rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  '1990-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'Encountered at Caiçara''s academy and Salvador rodas. Listed among mestres who influenced Laércio. Waldemar died 1990.',
  E'Encontrado na academia de Caiçara e nas rodas de Salvador. Listado entre os mestres que influenciaram Laércio. Waldemar morreu em 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Waldemar'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio influenced_by Lua de Bobó (at Salvador rodas/academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/, https://mestrelaercio.bandcamp.com/',
  E'Listed among mestres who influenced Laércio at Caiçara''s academy and Salvador rodas.',
  E'Listado entre os mestres que influenciaram Laércio na academia de Caiçara e nas rodas de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Lua de Bobó'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio influenced_by Bola Sete (at Salvador rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'Listed among mestres encountered at Caiçara''s academy and Salvador rodas who influenced Laércio.',
  E'Listado entre os mestres encontrados na academia de Caiçara e nas rodas de Salvador que influenciaram Laércio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Bola Sete'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Laércio influenced_by Bobô (at Salvador rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://filhosdeangola.eu/biografie/',
  E'Listed among mestres encountered at Caiçara''s academy and Salvador rodas who influenced Laércio.',
  E'Listado entre os mestres encontrados na academia de Caiçara e nas rodas de Salvador que influenciaram Laércio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Laércio' AND o.apelido = 'Bobô'
  AND COALESCE(s.apelido_context, '') = ''
  AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================

-- GROUPS (not yet in dataset - add to groups-backlog.md):
-- Laércio co_founded Grupo de Capoeira Filhos de Angola (GCFA) - March 20, 1984
-- Laércio co_founded Associação Brasileira de Capoeira Angola (ABCA) - 1987
-- Laércio leads GCFA Berlin
-- Laércio leads GCFA International

-- PERSONS (not yet in dataset - add to persons-backlog.md):
-- Laércio associated_with Roberval - co-founded GCFA 1984; later separated; now leads GCFA Sverige
-- Laércio associated_with Cabore - co-founded GCFA 1984; later separated
-- Laércio associated_with Rosalvo - co-founded GCFA 1984; later separated; first angoleiro in Europe 1989
-- Laércio associated_with Cobra Mansa - invited GCFA to join GCAP
-- Laércio associated_with Curió - co-founded ABCA 1987
-- Laércio associated_with Bom Cabrito - co-founded ABCA 1987

-- Laércio influenced_by Zacarias (at Salvador rodas) - ENTITY EXISTS but in different context
-- Laércio influenced_by Curé (at Salvador rodas) - NOT IN DATASET
-- Laércio influenced_by Fernanito (at Salvador rodas) - NOT IN DATASET
-- Laércio influenced_by Papo Amarelo (at Salvador rodas) - NOT IN DATASET
