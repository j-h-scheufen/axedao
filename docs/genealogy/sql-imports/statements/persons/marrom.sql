-- ============================================================
-- STATEMENTS FOR: Marrom (Rio de Janeiro)
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Marrom is the SUBJECT.
-- Note: Uses apelido_context 'Rio de Janeiro' to distinguish from São Paulo Marrom.
-- ============================================================

-- Marrom trained_under Gato Preto (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/, https://velhosmestres.com/en/gato-2000-5',
  'Part of Marrom''s research with old guard mestres in 1990s; recorded CDs together (2001); Gato Preto visited Marrom''s 5th Children''s Encounter (Nov 2000)',
  'Parte da pesquisa de Marrom com mestres da velha guarda nos anos 1990; gravaram CDs juntos (2001); Gato Preto visitou o 5º Encontro Infantil de Marrom (nov 2000)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under João Grande (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.helloasso.com/associations/association-oya/collectes/mestre-marrom-contra-mestre-tatiana-en-france',
  'Studied with João Grande as part of old guard research; João Grande listed among major Angola influences',
  'Estudou com João Grande como parte de pesquisa com velha guarda; João Grande listado entre principais influências Angola'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under João Pequeno (lineage claim per Mestre Ferradura)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://oberlincapoeiraangola.wordpress.com/meet-the-hosts/',
  'Mestre Ferradura describes Marrom as "a disciple of Mestre João Pequeno de Pastinha"; exact nature of training unclear but places Marrom in Pastinha lineage',
  'Mestre Ferradura descreve Marrom como "um discípulo de Mestre João Pequeno de Pastinha"; natureza exata do treinamento incerta mas coloca Marrom na linhagem de Pastinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under Bigodinho (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/',
  E'Part of Marrom''s research and collaboration with old guard mestres in 1990s; recorded CDs together. Bigodinho was one of the elder mestres Marrom sought out to preserve traditional knowledge.',
  E'Parte da pesquisa e colaboração de Marrom com mestres da velha guarda nos anos 1990; gravaram CDs juntos. Bigodinho era um dos mestres mais velhos que Marrom procurou para preservar conhecimentos tradicionais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom trained_under Boca Rica (old guard collaboration, 1990s+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/',
  E'Part of Marrom''s research and collaboration with old guard mestres in 1990s; recorded CDs together. Boca Rica was one of the elder mestres Marrom sought out to preserve traditional knowledge.',
  E'Parte da pesquisa e colaboração de Marrom com mestres da velha guarda nos anos 1990; gravaram CDs juntos. Boca Rica era um dos mestres mais velhos que Marrom procurou para preservar conhecimentos tradicionais.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Boca Rica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom student_of Canela (first formal teacher in Rio, 1976+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1976-01-01'::date, 'year'::genealogy.date_precision,
  '1979-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/, http://www.capoeiranatolia.com/mestres-en/',
  E'First formal capoeira teacher in Rio de Janeiro after Marrom arrived from Bahia around 1976 at age 12-13. Canela taught in Engenho Novo, North Zone of Rio. Regional style. End date approximate - before Marrom moved to train with Peixinho.',
  E'Primeiro professor formal de capoeira no Rio de Janeiro após Marrom chegar da Bahia por volta de 1976 aos 12-13 anos. Canela ensinava no Engenho Novo, Zona Norte do Rio. Estilo Regional. Data final aproximada - antes de Marrom ir treinar com Peixinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Canela'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom student_of Peixinho (primary Senzala teacher, received red rope)
-- Key figure in Marrom's Regional training; gave him the corda vermelha
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1979-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/, http://www.capoeiranatolia.com/mestres-en/',
  E'Primary teacher at Grupo Senzala after initial training with Canela. Peixinho gave Marrom his corda vermelha (red cord), the highest rank in Senzala. This was during Marrom''s Regional phase before his transition to Angola in the 1990s.',
  E'Professor principal no Grupo Senzala após treinamento inicial com Canela. Peixinho deu a Marrom sua corda vermelha, o grau mais alto na Senzala. Isso foi durante a fase Regional de Marrom antes de sua transição para Angola nos anos 1990.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Peixinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom received_title_from Peixinho (corda vermelha - red cord)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "corda vermelha", "system": "Grupo Senzala"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/',
  E'Received corda vermelha (red cord), the highest rank in Grupo Senzala''s graduation system, from Mestre Peixinho. This represented mastery in Capoeira Regional before Marrom''s later transition to Angola.',
  E'Recebeu corda vermelha, o grau mais alto no sistema de graduação do Grupo Senzala, de Mestre Peixinho. Isso representou maestria na Capoeira Regional antes da posterior transição de Marrom para Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Peixinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marrom influenced_by Nô (inspired turn to Angola in 1990s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-marrom/',
  E'Mestre Nô, the "mestre dos mestres" from Bahia, inspired Marrom''s transition from Capoeira Regional to Angola in the 1990s. After earning his corda vermelha from Grupo Senzala, Marrom sought out the old guard Bahian mestres, with Nô''s guidance being pivotal in his turn toward traditional Angola.',
  E'Mestre Nô, o "mestre dos mestres" da Bahia, inspirou a transição de Marrom da Capoeira Regional para Angola nos anos 1990. Após conquistar sua corda vermelha do Grupo Senzala, Marrom procurou os mestres baianos da velha guarda, sendo a orientação de Nô fundamental em sua virada para a Angola tradicional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marrom' AND s.apelido_context = 'Rio de Janeiro' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Marrom influenced_by Angolinha - NEEDS IMPORT: Mestre Angolinha (Isak Ignácio, Rio de Janeiro)
--   Rio Angola reference; Marrom had him as major influence in 1990s

-- Marrom trained_under Felipe - NEEDS IMPORT: Mestre Felipe (Santo Amaro)
--   Part of old guard collaboration; recorded CDs together

-- Marrom trained_under Brandão - NEEDS IMPORT: Mestre Brandão
--   Part of old guard collaboration; recorded CDs together

-- Marrom founded Ngoma Capoeira Angola (2018) - NEEDS GROUP IMPORT
--   Renamed from "Marrom Capoeira & Alunos" (1990)
--   Located at Morro da Babilônia, Leme, Rio de Janeiro

-- Marrom associated_with "Vadiando Entre Amigos" movement - NEEDS GROUP/MOVEMENT IMPORT
--   Co-precursor with Mestres Formiga and Camaleão (1990s-2000s)
