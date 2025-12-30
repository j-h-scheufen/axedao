-- ============================================================
-- STATEMENTS FOR: Zé Carlos
-- Generated: 2025-12-28
-- ============================================================
-- This file contains all relationships where Zé Carlos is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Zé Carlos student_of Moraes (primary teacher, 1973-ongoing)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'angolangolo.com.br/english/',
  'Began training with Mestre Moraes in Rio de Janeiro in 1973, shortly after Moraes arrived from Salvador for military service. Part of the core group that would become the first mestres of Capoeira Angola formed outside Bahia.',
  'Começou a treinar com Mestre Moraes no Rio de Janeiro em 1973, pouco depois de Moraes chegar de Salvador para o serviço militar. Parte do grupo central que se tornaria os primeiros mestres de Capoeira Angola formados fora da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Carlos' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Carlos received_title_from Moraes (Mestre title, December 16, 1978)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-12-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "Parque Lage", "location": "Jardim Botânico, Rio de Janeiro"}}'::jsonb,
  'verified'::genealogy.confidence,
  'angolangolo.com.br/english/, africabantu.wordpress.com/notas/',
  'Received Mestre title on December 16, 1978 at Parque Lage, Jardim Botânico, Rio de Janeiro. Promoted alongside Braga and Neco; Marco Aurélio became Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia.',
  'Recebeu título de Mestre em 16 de dezembro de 1978 no Parque Lage, Jardim Botânico, Rio de Janeiro. Promovido junto com Braga e Neco; Marco Aurélio tornou-se Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Carlos' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Carlos associated_with Pastinha (met in Salvador, December 1975)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-12-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Met Pastinha during visit to Salvador with Moraes group"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Traveled to Salvador in December 1975 with Moraes, Braga, Neco, Marco Aurélio, Tete, and Amalha. Met Mestre Pastinha during this pivotal journey. Remained in Salvador for January, participating in Bonfim festival celebrations.',
  'Viajou a Salvador em dezembro de 1975 com Moraes, Braga, Neco, Marco Aurélio, Tete e Amalha. Conheceu Mestre Pastinha durante essa jornada fundamental. Permaneceu em Salvador em janeiro, participando das celebrações do festival do Bonfim.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Carlos' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Carlos associated_with Braga (fellow mestre, GCAP co-founder, ongoing)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes; received mestre title together Dec 16, 1978; GCAP co-founder"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Fellow student of Mestre Moraes from 1975. Traveled to Salvador together December 1975 to meet Pastinha. Received Mestre title together December 16, 1978. Co-founded GCAP October 5, 1980. Continued collaboration through CCARJ (1997). Maintained connection through decades—Braga invited Zé Carlos to UNE building in February 1997.',
  'Colega estudante de Mestre Moraes desde 1975. Viajaram juntos a Salvador em dezembro de 1975 para conhecer Pastinha. Receberam título de Mestre juntos em 16 de dezembro de 1978. Co-fundaram o GCAP em 5 de outubro de 1980. Continuaram colaboração através do CCARJ (1997). Mantiveram conexão por décadas—Braga convidou Zé Carlos para o prédio da UNE em fevereiro de 1997.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Carlos' AND o.apelido = 'Braga'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Carlos associated_with Neco (fellow mestre, GCAP co-founder, ongoing)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow student of Moraes; received mestre title together Dec 16, 1978; GCAP co-founder"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Fellow student of Mestre Moraes from 1975. Traveled to Salvador together December 1975 to meet Pastinha. Received Mestre title together December 16, 1978. Co-founded GCAP October 5, 1980 (idea originated from Neco). One of three young mestres left in charge of Rio after Moraes returned to Salvador in 1982.',
  'Colega estudante de Mestre Moraes desde 1975. Viajaram juntos a Salvador em dezembro de 1975 para conhecer Pastinha. Receberam título de Mestre juntos em 16 de dezembro de 1978. Co-fundaram o GCAP em 5 de outubro de 1980 (ideia originou de Neco). Um dos três jovens mestres deixados no comando do Rio após Moraes retornar a Salvador em 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Carlos' AND s.apelido_context IS NULL
  AND o.apelido = 'Neco' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Zé Carlos co_founded GCAP (October 5, 1980) - GCAP is in groups-backlog
-- Zé Carlos departed_from GCAP (1991, neutral) - GCAP is in groups-backlog
-- Zé Carlos founded Angola N'Golo (December 10, 1991) - Angola N'Golo is in groups-backlog
-- Zé Carlos leads Angola N'Golo (1991-present) - Angola N'Golo is in groups-backlog
-- Zé Carlos associated_with Marco Aurélio (fellow student/contramestre at 1978 ceremony) - Marco Aurélio is in backlog
-- Zé Carlos associated_with Cobra Mansa (fellow GCAP founding member) - already imported but not adding redundant statement
-- Zé Carlos associated_with Mano (CCARJ representative) - Mano is in backlog
-- Zé Carlos associated_with Lumumba (CCARJ contramestre) - Lumumba is in backlog
-- Zé Carlos associated_with Armandinho ("Jogo do Dinheiro" in 1991 video) - needs investigation
