-- ============================================================
-- STATEMENTS FOR: Gato (Senzala)
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Gato (Senzala) is the SUBJECT.
-- Uses apelido_context 'Senzala' to distinguish from other Gatos.
-- ============================================================

-- Gato student_of Paulo Flores (primary mentor, 1963+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://papoeira.com/en/interview-with-mestre-pedro-from-grupo-senzala-with-english-translation/; https://capoeira.fandom.com/wiki/Centro_Cultural_Senzala',
  E'Gato began training with Paulo Flores in 1963 after discovering capoeira at a friend''s party where Rafael (Paulo''s brother) demonstrated a benção. Paulo led the weekly training sessions on the terrace of the Flores brothers'' apartment building in Laranjeiras.',
  E'Gato começou a treinar com Paulo Flores em 1963 após descobrir a capoeira em uma festa de amigo onde Rafael (irmão de Paulo) demonstrou um benção. Paulo liderou as sessões de treino semanais no terraço do prédio dos irmãos Flores em Laranjeiras.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Artur Emídio (attended Sunday rodas at Bonsucesso, 1965+)
-- Note: Attending open rodas = exposure/influence, not formal instruction
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira interview with Mestre Gato',
  E'Gato attended Sunday rodas at Mestre Artur Emídio''s academy in Bonsucesso starting in 1965. These open rodas were meeting points for capoeiristas of all styles in Rio de Janeiro, providing exposure to diverse capoeira traditions.',
  E'Gato frequentou rodas dominicais na academia de Mestre Artur Emídio em Bonsucesso a partir de 1965. Essas rodas abertas eram pontos de encontro para capoeiristas de todos os estilos no Rio de Janeiro, proporcionando exposição a diversas tradições de capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Acordeon (trained together during Rio visits)
-- Note: Paulo/Rafael Flores knew Acordeon as peers from Bimba's academy
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira interview with Mestre Gato',
  E'Gato trained alongside Mestre Acordeon when Acordeon visited Rio de Janeiro. Paulo and Rafael Flores knew Acordeon as peers from their time at Bimba''s academy in Salvador.',
  E'Gato treinou ao lado de Mestre Acordeon quando Acordeon visitava o Rio de Janeiro. Paulo e Rafael Flores conheciam Acordeon como colegas de seu tempo na academia de Bimba em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Bimba (visited Salvador academy, 1968)
-- Note: A visit/pilgrimage, not sustained formal instruction
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Grupo Senzala official website; Portal Capoeira interview',
  E'Gato visited Mestre Bimba''s academy in Salvador in 1968. This was a pilgrimage to the source of Capoeira Regional that many Senzala members undertook, but not sustained formal training.',
  E'Gato visitou a academia de Mestre Bimba em Salvador em 1968. Esta foi uma peregrinação à fonte da Capoeira Regional que muitos membros do Senzala realizaram, mas não um treinamento formal contínuo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Ezequiel (visited Santo Amaro da Purificação, 1968)
-- Note: Brief training visit, not ongoing instruction
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Grupo Senzala official website',
  E'Gato trained briefly with Mestre Ezequiel during a visit to Santo Amaro da Purificação in 1968, alongside Mestres Saci and Popó. This was part of his exploration of Bahian capoeira traditions.',
  E'Gato treinou brevemente com Mestre Ezequiel durante uma visita a Santo Amaro da Purificação em 1968, junto com os Mestres Saci e Popó. Isto fez parte de sua exploração das tradições de capoeira baiana.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Saci (visited Santo Amaro da Purificação, 1968)
-- Note: Brief training visit, not ongoing instruction
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Grupo Senzala official website',
  E'Gato trained briefly with Mestre Saci during a visit to Santo Amaro da Purificação in 1968, alongside Mestres Ezequiel and Popó. This was part of his exploration of Bahian capoeira traditions.',
  E'Gato treinou brevemente com Mestre Saci durante uma visita a Santo Amaro da Purificação em 1968, junto com os Mestres Ezequiel e Popó. Isto fez parte de sua exploração das tradições de capoeira baiana.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Saci'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato associated_with Suassuna (connected in São Paulo)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "connected through São Paulo capoeira community; co-organized Capoeirando events 1994-1997"}'::jsonb,
  'verified'::genealogy.confidence,
  'Portal Capoeira interview; Suassuna import notes',
  E'Gato connected with Mestre Suassuna and Paulo Gomes in São Paulo, building bridges across Brazil''s capoeira communities. They co-organized the Capoeirando event (1994-1997).',
  E'Gato conectou-se com Mestre Suassuna e Paulo Gomes em São Paulo, construindo pontes entre as comunidades de capoeira do Brasil. Co-organizaram o evento Capoeirando (1994-1997).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato associated_with Nestor Capoeira (supervised his teaching at UFRJ, 1968)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "supervised Nestor''s teaching at UFRJ as contramestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Nestor Capoeira biography; Grupo Senzala sources',
  E'Gato supervised Nestor Capoeira''s teaching as contramestre at the Federal University of Rio de Janeiro (UFRJ) starting in 1968. Nestor had joined Grupo Senzala that year.',
  E'Gato supervisionou o ensino de Nestor Capoeira como contramestre na Universidade Federal do Rio de Janeiro (UFRJ) a partir de 1968. Nestor havia entrado no Grupo Senzala naquele ano.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Nestor Capoeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Valdo Santana (Academia Santana, early 1960s)
-- Note: Training at Academia Santana before Grupo Senzala formation
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.senzala.co.uk/history.html; https://www.senzalamidlands.co.uk/group-senzala-since-1963/',
  E'Gato trained at Academia Santana in Rio de Janeiro in the early 1960s. In 1964, Mestre Valdo Santana invited Gato and Paulo Flores to represent Academia Santana at the Berimbau de Prata competition in Santa Teresa, where they placed third.',
  E'Gato treinou na Academia Santana no Rio de Janeiro no início dos anos 1960. Em 1964, Mestre Valdo Santana convidou Gato e Paulo Flores para representar a Academia Santana na competição Berimbau de Prata em Santa Teresa, onde ficaram em terceiro lugar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Valdo Santana'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato influenced_by Popó do Maculelê (visited Santo Amaro da Purificação, 1968)
-- Note: Brief training visit, not ongoing instruction
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.gruposenzala.org/mestre-gato.html; https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-gato/',
  E'Gato trained briefly with Popó do Maculelê during a visit to Santo Amaro da Purificação in 1968, alongside Mestres Ezequiel and Saci. This was in the final year of Popó''s life—the legendary maculelê master was 92 years old. The visit was part of Gato''s exploration of Bahian capoeira and maculelê traditions.',
  E'Gato treinou brevemente com Popó do Maculelê durante uma visita a Santo Amaro da Purificação em 1968, junto com os Mestres Ezequiel e Saci. Isto foi no último ano de vida de Popó—o lendário mestre de maculelê tinha 92 anos. A visita fez parte da exploração de Gato das tradições baianas de capoeira e maculelê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Senzala'
  AND o.apelido = 'Popó do Maculelê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato co_founded Grupo Senzala
-- Grupo Senzala NOT YET in dataset (groups-backlog.md line 55)
-- → Add SQL when Grupo Senzala is imported

-- Gato founded Grupo Senzala of Great Britain (GSGB)
-- GSGB NOT YET in dataset
-- → Added to groups-backlog

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gato associated_with Preguiça (Berimbau de Ouro partner 1967-1968) - needs Preguiça import first
-- Gato associated_with Mosquito (trained winning 1969 team) - needs Mosquito import first
-- Gato associated_with Borracha (trained winning 1969 team) - needs Borracha import first
-- Gato co_founded Grupo Senzala - needs Grupo Senzala import first
-- Gato founded Grupo Senzala of Great Britain - needs GSGB import first
