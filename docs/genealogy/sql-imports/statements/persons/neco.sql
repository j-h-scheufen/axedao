-- ============================================================
-- STATEMENTS FOR: Neco
-- Generated: 2025-12-28
-- ============================================================
-- This file contains all relationships where Neco is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Neco student_of Moraes (primary teacher, ~1975-ongoing)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Neco began training with Moraes at Clube Gurilandia, Botafogo, Rio de Janeiro, part of the July 1975 cohort that included Braga, Peçanha (Cobra Mansa), Mano, and others. Moraes emphasized the Angola tradition he learned from Pastinha through João Grande and João Pequeno.',
  'Neco começou a treinar com Moraes no Clube Gurilandia, Botafogo, Rio de Janeiro, parte do grupo de julho de 1975 que incluía Braga, Peçanha (Cobra Mansa), Mano e outros. Moraes enfatizava a tradição de Angola que aprendeu de Pastinha através de João Grande e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Neco received_title_from Moraes (Mestre title, December 16, 1978)
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
  'africabantu.wordpress.com/notas/',
  'Received Mestre title on December 16, 1978 at Parque Lage, Jardim Botânico, Rio de Janeiro. Promoted alongside Braga and Zé Carlos; Marco Aurélio became Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia.',
  'Recebeu título de Mestre em 16 de dezembro de 1978 no Parque Lage, Jardim Botânico, Rio de Janeiro. Promovido junto com Braga e Zé Carlos; Marco Aurélio tornou-se Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Neco associated_with Pastinha (met him in Salvador, December 1975)
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
  'Neco traveled to Salvador with Moraes, Braga, Marco Aurélio, Zé Carlos, Tete, and Amalha in December 1975, meeting Mestre Pastinha. The group stayed through January for Bonfim festival celebrations. This direct connection to the source of Capoeira Angola shaped Neco''s commitment to the art.',
  'Neco viajou a Salvador com Moraes, Braga, Marco Aurélio, Zé Carlos, Tete e Amalha em dezembro de 1975, encontrando Mestre Pastinha. O grupo permaneceu até janeiro para as celebrações do festival do Bonfim. Essa conexão direta com a fonte da Capoeira Angola moldou o compromisso de Neco com a arte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Neco associated_with Braga (fellow GCAP co-founder, training companion)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "GCAP co-founders and fellow students of Moraes"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Neco and Braga trained together under Moraes from July 1975, traveled to Salvador together in December 1975 to meet Pastinha, received their Mestre titles together on December 16, 1978, and co-founded GCAP on October 5, 1980. They remained fellow leaders in Rio after Moraes returned to Salvador in 1982.',
  'Neco e Braga treinaram juntos sob Moraes a partir de julho de 1975, viajaram juntos a Salvador em dezembro de 1975 para conhecer Pastinha, receberam seus títulos de Mestre juntos em 16 de dezembro de 1978, e co-fundaram o GCAP em 5 de outubro de 1980. Permaneceram como líderes companheiros no Rio após Moraes retornar a Salvador em 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Braga'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Neco associated_with Cobra Mansa (fellow GCAP member, training companion)
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
  '{"association_context": "Fellow students of Moraes and GCAP founding members"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Neco and Peçanha (later Cobra Mansa) trained together under Moraes in Rio. Cobra Mansa was among the Contra-Mestres at GCAP''s founding in 1980. He later visited Rio for GCAP board inaugurations and appeared in the 1991 GCAP 10-year anniversary video.',
  'Neco e Peçanha (mais tarde Cobra Mansa) treinaram juntos sob Moraes no Rio. Cobra Mansa estava entre os Contra-Mestres na fundação do GCAP em 1980. Mais tarde visitou o Rio para posses da diretoria do GCAP e apareceu no vídeo do 10º aniversário do GCAP em 1991.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Neco co_founded GCAP (October 5, 1980) - GCAP group needs import first
-- Neco leads GCAP (served as president of board) - GCAP group needs import first
-- Neco departed_from GCAP - date and circumstances unknown
-- Neco founded Grupo Só Angola (Rio de Janeiro) - group needs import first
-- Neco co_founded ACIMBA - ACIMBA group needs import first
-- Neco leads ACIMBA - with Brinco and Lumumba; ACIMBA group needs import first
--
-- Neco associated_with Zé Carlos (José Carlos) - co-founded GCAP, fellow mestre Dec 1978; needs import
-- Neco associated_with Marco Aurélio - trained together, GCAP co-founder; needs import
-- Neco associated_with Lumumba - GCAP and ACIMBA co-leader; needs import
-- Neco associated_with Brinco - ACIMBA co-leader, former student; Brinco needs import
-- Neco associated_with Mano - fellow student under Moraes 1975; needs import
-- Neco associated_with Pedro Edinho - student at GCAP; needs import
-- Neco associated_with Fred Mussa - co-founded Só Angola; needs import
-- Neco associated_with Tete - fellow student, traveled to Salvador 1975; needs import
-- Neco associated_with Armandinho - fellow mestre in 1991 GCAP video; needs import
-- Neco associated_with Angolinha - fellow mestre in 1991 GCAP video; needs import
-- Neco associated_with Rogério - fellow mestre in 1991 GCAP video; Rogério IS in dataset
-- Neco associated_with Valmir - fellow mestre in 1991 GCAP video; needs import
-- Neco associated_with Manoel - fellow mestre in 1991 GCAP video; needs import
--
-- Neco associated_with Camisa - attended 1978 mestre ceremony as guest; needs import
-- Neco associated_with Preguiça - attended 1978 mestre ceremony as guest; needs import

-- Neco associated_with Rogério (fellow GCAP mestre, appeared in 1991 video)
-- NOTE: Rogério IS in the dataset
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "GCAP fellow mestres"}'::jsonb,
  'likely'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Both Neco and Rogério appeared in the 1991 GCAP 10-year anniversary video as mestres. Rogério was later titled by Moraes and Cobra Mansa (1989) and became a pioneer of Capoeira Angola in Europe.',
  'Tanto Neco quanto Rogério apareceram no vídeo do 10º aniversário do GCAP em 1991 como mestres. Rogério foi mais tarde graduado por Moraes e Cobra Mansa (1989) e se tornou um pioneiro da Capoeira Angola na Europa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Neco' AND s.apelido_context IS NULL
  AND o.apelido = 'Rogério'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
