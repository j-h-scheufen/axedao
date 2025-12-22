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

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Marrom trained_under Canela - NEEDS IMPORT: Mestre Canela (Rio de Janeiro, Engenho Novo)
--   First formal teacher in Rio after 1976; Regional style training

-- Marrom trained_under Peixinho - NEEDS IMPORT: Mestre Peixinho (Senzala, Rio de Janeiro)
--   Trained with Peixinho da Senzala, earned red rope (Regional)

-- Marrom influenced_by Nô - NEEDS IMPORT: Mestre Nô (Norival Moreira de Oliveira)
--   Bahian mestre who inspired Marrom's turn to capoeira Angola

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
