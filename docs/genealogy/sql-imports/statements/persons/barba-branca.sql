-- ============================================================
-- STATEMENTS FOR: Barba Branca
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Barba Branca is the SUBJECT.
-- ============================================================

-- Barba Branca student_of Traíra (~1967-1975)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-60; https://capoeira.fandom.com/wiki/Mestre_Barba_Branca',
  'Began learning at age 10-11 in Liberdade neighborhood. Mother disapproved; he would sneak to rodas and be beaten upon returning home. Traira died of cirrhosis ~1975.',
  'Começou a aprender aos 10-11 anos no bairro da Liberdade. Mãe desaprovava; fugia para as rodas e apanhava ao voltar para casa. Traíra morreu de cirrose ~1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barba Branca' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Barba Branca student_of João Pequeno (1981-2011)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1981-01-01'::date, 'year'::genealogy.date_precision,
  '2011-12-09'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-60; https://capoeira.fandom.com/wiki/Mestre_Barba_Branca',
  'Welcomed at CECA after ~6 years without a master. Meeting João Pequeno was transformative - "opening my mind to the great philosophy of capoeira angola." Studied 13 years until recognized as mestre 1994. João Pequeno died Dec 9, 2011.',
  'Acolhido no CECA após ~6 anos sem mestre. Conhecer João Pequeno foi transformador - "abrir minha mente para a grande filosofia da capoeira angola." Estudou 13 anos até ser reconhecido como mestre 1994. João Pequeno morreu 9 dez 2011.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barba Branca' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Barba Branca received_title_from João Pequeno (1994)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-60',
  'Formally recognized as mestre at CECA. Some sources cite 1991 or 1992; using 1994 per Velhos Mestres. Despite 15 years in capoeira, formal recognition came at CECA.',
  'Formalmente reconhecido como mestre no CECA. Algumas fontes citam 1991 ou 1992; usando 1994 per Velhos Mestres. Apesar de 15 anos na capoeira, reconhecimento formal veio no CECA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barba Branca' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Barba Branca associated_with Zé do Lenço (1998, Finland teaching)
-- NOTE: Zé do Lenço not yet in dataset - adding to pending

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Barba Branca associated_with Zé do Lenço - taught together in Finland 1998; ABCA collaborator
-- Barba Branca associated_with Carybé - close friendship; Carybé donated emblem artwork for GCAC
-- Barba Branca associated_with Mãe Stella de Oxóssi - partnership 1993-2019 at Ilê Axé Opô Afonjá
--
-- STUDENTS (not yet in dataset as persons - potential future imports):
-- - Mestre Olhos de Anjo (André Siqueira) - began late 1980s; founder of Grupo Folha do Cajueiro 2012
-- - Mestre Saúva (Roosevelt Leonel Cunha) - began 1995; current GCAC president
-- - Contramestre Barbeirinho
-- - Contramestre Rato
-- - Contramestre Mão Dez
-- - Treinel Tigrão
--
-- GROUP RELATIONSHIPS (groups not yet imported):
-- Barba Branca founded GCAC (1984)
-- Barba Branca co_founded ABCA (1987)
-- Barba Branca leads ABCA (1993 - president)
-- Barba Branca member_of CECA (1981-2021)
