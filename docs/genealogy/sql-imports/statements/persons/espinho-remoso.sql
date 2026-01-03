-- ============================================================
-- STATEMENTS FOR: Espinho Remoso
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Espinho Remoso is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Espinho Remoso family_of Virgílio da Fazenda Grande (father-son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-12-03'::date, 'exact'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"relationship": "father"}'::jsonb, 'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (2008)',
  'Espinho Remoso was the father of Virgílio. Virgílio was his only child with wife Edite Isabel dos Santos.',
  'Espinho Remoso era o pai de Virgílio. Virgílio era seu único filho com a esposa Edite Isabel dos Santos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- TEACHING RELATIONSHIPS
-- ============================================================

-- Espinho Remoso teacher_of Cobrinha Verde
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'teacher_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Online (Cobrinha Verde), Portal Capoeira (Cobrinha Verde)',
  'Listed among Cobrinha Verde''s teachers in Santo Amaro alongside Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, and Neco Canário Pardo.',
  'Listado entre os professores de Cobrinha Verde em Santo Amaro junto com Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso e Neco Canário Pardo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES / ASSOCIATIONS (Jaqueira do Carneiro Roda)
-- ============================================================

-- Espinho Remoso associated_with Waldemar (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Waldemar attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s.',
  'Waldemar frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Paulo dos Anjos (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Paulo dos Anjos attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s. Paulo later gave Virgílio his mestre title.',
  'Paulo dos Anjos frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950. Paulo posteriormente deu a Virgílio seu título de mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Zacarias Boa Morte (roda at Jaqueira do Carneiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in Fazenda Grande do Retiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT (Mestre Espinho Remoso), Portal Capoeira (Mestre Virgílio)',
  'Zacarias Boa Morte attended Espinho Remoso''s Sunday roda at Jaqueira do Carneiro in the 1950s.',
  'Zacarias Boa Morte frequentava a roda de domingo de Espinho Remoso em Jaqueira do Carneiro nos anos 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (Jornal Metropolitano 1960)
-- ============================================================

-- Espinho Remoso associated_with Traíra (1960 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both named as outstanding capoeiristas of Liberdade neighborhood in 1960 Jornal Metropolitano"}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal Metropolitano (1960), Wikipedia PT (Mestre Espinho Remoso)',
  'Both named as outstanding capoeiristas of the Liberdade neighborhood in 1960.',
  'Ambos nomeados como capoeiristas destacados do bairro da Liberdade em 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Espinho Remoso associated_with Bimba (1960 article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both named as outstanding capoeiristas of Liberdade neighborhood in 1960 Jornal Metropolitano"}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal Metropolitano (1960), Wikipedia PT (Mestre Espinho Remoso)',
  'Both named as outstanding capoeiristas of the Liberdade neighborhood in 1960.',
  'Ambos nomeados como capoeiristas destacados do bairro da Liberdade em 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Espinho Remoso' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Espinho Remoso trained_under Cassarangongo - needs Cassarangongo import first (in persons-backlog.md)
-- Espinho Remoso leads Roda de Jaqueira do Carneiro - needs group import first (in groups-backlog.md)
-- Espinho Remoso teacher_of Diogo - needs Mestre Diogo import first (add to persons-backlog.md)
-- Espinho Remoso teacher_of Fulô, Florzinho, Valdir, Loriano da Boca do Rio, Gerônimo, Raimundo,
--   Antônio Catarino, Dario do Pandeiro, Buiu, Florisvaldo, Moisés, Valdomiro, Chico Zoião, Firmino
--   (15 students documented - most unlikely to have sufficient data for import)
