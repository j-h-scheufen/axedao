-- ============================================================
-- STATEMENTS FOR: Braga
-- Generated: 2025-12-28
-- ============================================================
-- This file contains all relationships where Braga is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Braga student_of Moraes (primary teacher for Capoeira Angola, 1975-ongoing)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-07-05'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Began training with Moraes on July 5, 1975 at Clube Gurilandia, Botafogo, Rio de Janeiro. This was the pivotal turning point in Braga''s evolution toward Capoeira Angola. He was among the initial cohort of students including Peçanha (Cobra Mansa), Mano, Agostinho.',
  'Começou a treinar com Moraes em 5 de julho de 1975 no Clube Gurilandia, Botafogo, Rio de Janeiro. Este foi o ponto de virada fundamental na evolução de Braga em direção à Capoeira Angola. Estava entre o grupo inicial de alunos incluindo Peçanha (Cobra Mansa), Mano, Agostinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga trained_under Touro (Grupo Corda Bamba, ~6 months after Palmares disbanded)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'lalaue.com/learn-capoeira/mestre-braga/',
  'After Grupo Palmares disbanded, Braga trained with Mestre Touro at Grupo Corda Bamba in Penha for approximately six months. This was before meeting Mestre Moraes.',
  'Após a dissolução do Grupo Palmares, Braga treinou com Mestre Touro no Grupo Corda Bamba na Penha por aproximadamente seis meses. Isso foi antes de conhecer Mestre Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Touro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga received_title_from Moraes (Mestre title, December 16, 1978)
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
  'Received Mestre title on December 16, 1978 at Parque Lage, Jardim Botânico, Rio de Janeiro. Promoted alongside Neco and Zé Carlos; Marco Aurélio became Contra-Mestre. Mestres Camisa and Preguiça attended as honored guests. These were the first mestres of Capoeira Angola formed outside of Bahia.',
  'Recebeu título de Mestre em 16 de dezembro de 1978 no Parque Lage, Jardim Botânico, Rio de Janeiro. Promovido junto com Neco e Zé Carlos; Marco Aurélio tornou-se Contra-Mestre. Os Mestres Camisa e Preguiça compareceram como convidados de honra. Estes foram os primeiros mestres de Capoeira Angola formados fora da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga associated_with Pastinha (met him in Salvador, December 1975 and 1979)
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
  '{"association_context": "Met Pastinha during visits to Salvador with Moraes group"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Braga traveled to Salvador with Moraes and colleagues in December 1975, meeting Mestre Pastinha who remembered Moraes as "Pedrinho." Braga presented a berimbau to Pastinha as a gift. Made another visit in December 1979.',
  'Braga viajou a Salvador com Moraes e colegas em dezembro de 1975, encontrando Mestre Pastinha que lembrou de Moraes como "Pedrinho." Braga presenteou Pastinha com um berimbau. Fez outra visita em dezembro de 1979.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga associated_with Cobra Mansa (served as pedagogical advisor)
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
  '{"association_context": "Pedagogical advisor during GCAP formation"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/',
  'Braga served as pedagogical advisor to Cinésio (Cobra Mansa), teaching foundational Angola principles. Both were among the initial cohort of Moraes'' students from 1975.',
  'Braga serviu como orientador pedagógico de Cinésio (Cobra Mansa), ensinando princípios fundamentais de Angola. Ambos estavam entre o grupo inicial de alunos de Moraes desde 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga associated_with Neco (fellow GCAP co-founder, promoted together 1978)
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
  '{"association_context": "GCAP co-founders; promoted to Mestre together on Dec 16, 1978"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/, lalaue.com/learn-capoeira/mestre-braga/',
  'Fellow student under Moraes from 1975. Both were promoted to Mestre on December 16, 1978 at Parque Lage, Rio de Janeiro, alongside Zé Carlos. They were among the first Capoeira Angola mestres formed outside of Bahia. Both co-founded GCAP in 1980.',
  'Colega de treino com Moraes desde 1975. Ambos foram promovidos a Mestre em 16 de dezembro de 1978 no Parque Lage, Rio de Janeiro, junto com Zé Carlos. Estavam entre os primeiros mestres de Capoeira Angola formados fora da Bahia. Ambos co-fundaram o GCAP em 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Neco'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga associated_with Zé Carlos (fellow GCAP co-founder, promoted together 1978)
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
  '{"association_context": "GCAP co-founders; promoted to Mestre together on Dec 16, 1978"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/, lalaue.com/learn-capoeira/mestre-braga/',
  'Fellow student under Moraes from 1975. Both were promoted to Mestre on December 16, 1978 at Parque Lage, Rio de Janeiro, alongside Neco. They were among the first Capoeira Angola mestres formed outside of Bahia. Both co-founded GCAP in 1980.',
  'Colega de treino com Moraes desde 1975. Ambos foram promovidos a Mestre em 16 de dezembro de 1978 no Parque Lage, Rio de Janeiro, junto com Neco. Estavam entre os primeiros mestres de Capoeira Angola formados fora da Bahia. Ambos co-fundaram o GCAP em 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Zé Carlos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Braga associated_with Marco Aurélio (fellow GCAP co-founder, promoted Contra-Mestre 1978)
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
  '{"association_context": "GCAP co-founders; Marco Aurélio promoted Contra-Mestre on Dec 16, 1978 when Braga became Mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'africabantu.wordpress.com/notas/, lalaue.com/learn-capoeira/mestre-braga/',
  'Fellow student under Moraes from 1975. Marco Aurélio was promoted to Contra-Mestre on December 16, 1978 at Parque Lage, Rio de Janeiro, the same ceremony where Braga, Neco, and Zé Carlos became Mestres. Both co-founded GCAP in 1980.',
  'Colega de treino com Moraes desde 1975. Marco Aurélio foi promovido a Contra-Mestre em 16 de dezembro de 1978 no Parque Lage, Rio de Janeiro, na mesma cerimônia em que Braga, Neco e Zé Carlos se tornaram Mestres. Ambos co-fundaram o GCAP em 1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Braga' AND o.apelido = 'Marco Aurélio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Braga trained_under Roni (Grupo Palmares, ~1971-1975) - needs import first
-- Braga trained_under Zé Macaco (Grupo Palmares, ~1971-1975) - needs import first
-- Braga trained_under Cabelo Russo/Cabelo Vermelho (Grupo Palmares, ~1971-1975) - needs import first
-- Braga trained_under Dentinho (Vila Isabel, brief period) - Dentinho is in backlog
-- Braga co_founded GCAP (October 5, 1980) - GCAP is in groups-backlog
-- Braga founded Africa Bantu (1993/94, Rio de Janeiro) - Africa Bantu is in groups-backlog
-- Braga departed_from GCAP (1993/94) - GCAP is in groups-backlog
-- Braga leads Africa Bantu Geneva (2002-present) - Africa Bantu is in groups-backlog
-- Braga cultural_pioneer_of Denmark (1997) - group relationship
-- Braga cultural_pioneer_of Switzerland (2002) - group relationship
-- Braga student_of Edson (Mestre Edson, his student in Rio) - needs import first
