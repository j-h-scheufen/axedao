-- ============================================================
-- STATEMENTS FOR: Zeferina
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Zeferina is the SUBJECT.
-- ============================================================

-- Zeferina associated_with Idalina (documented rivals)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1917-01-01'::date, 'year'::genealogy.date_precision,
  '1920-04-24'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "Documented rivals who fought over prostitution territory in Distrito da Sé; multiple conflicts 1917-1920; both charged with capoeiragem multiple times", "pt": "Rivais documentadas que lutavam pelo ponto de prostituição no Distrito da Sé; múltiplos conflitos 1917-1920; ambas acusadas de capoeiragem múltiplas vezes"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal de Notícias (1917, April 24, 1920); Paula Foltran thesis (UnB, 2019)',
  E'Documented rivalry over prostitution territory in Distrito da Sé; April 24, 1920 conflict: "encontraram-se as desafetas e foram ao duelo a murro e pontapé"; both had extensive police records for capoeiragem',
  E'Rivalidade documentada por ponto de prostituição no Distrito da Sé; conflito de 24 de abril de 1920: "encontraram-se as desafetas e foram ao duelo a murro e pontapé"; ambas tinham extensos registros policiais por capoeiragem'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Idalina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeferina associated_with Angélica Endiabrada (contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1920-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of 1910s-1920s Salvador; both documented in newspaper and police records for capoeiragem", "pt": "Valentonas contemporâneas de Salvador dos anos 1910-1920; ambas documentadas em jornais e registros policiais por capoeiragem"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Jornal de Notícias archives',
  E'Both were valentonas of the Distrito da Sé in Salvador during the 1910s-1920s; documented in newspaper headlines and police records for capoeiragem',
  E'Ambas eram valentonas do Distrito da Sé em Salvador durante os anos 1910-1920; documentadas nas manchetes de jornais e registros policiais por capoeiragem'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Angélica Endiabrada'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeferina associated_with Salomé (contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; part of the same generation of incorrigible women", "pt": "Valentonas contemporâneas de Salvador do início do século XX; parte da mesma geração de mulheres incorrigíveis"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019)',
  E'Both documented among female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeferina associated_with Maria Doze Homens (contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both part of the generation of female capoeiristas", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas parte da geração de capoeiristas femininas"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019)',
  E'Both documented among female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeferina associated_with Rosa Palmeirão (contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1930-12-31'::date, 'decade'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both documented in police and newspaper records", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas documentadas em registros policiais e de jornais"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019)',
  E'Both documented among female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Rosa Palmeirão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeferina associated_with Chicão (contemporaries)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1929-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both documented in police and newspaper records", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas documentadas em registros policiais e de jornais"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019)',
  E'Both documented among female capoeiristas of early 20th century Bahia; Chicão killed Pedro Porreta in 1929',
  E'Ambas documentadas entre as capoeiristas do início do século XX na Bahia; Chicão matou Pedro Porreta em 1929'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeferina' AND o.apelido = 'Chicão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zeferina associated_with Firmina - Idalina's companion in 1917 incident
--   UNCLEAR: Firmina mentioned in Idalina's 1917 arrest, may have known Zeferina
--   NEEDS INVESTIGATION: Firmina (unclear if capoeirista)
--
-- Zeferina associated_with Massú - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Massú
--
-- Zeferina associated_with Catu - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Catu
--
-- Zeferina associated_with Adelaide Presepeira - Contemporary 1920s-1930s
--   NEEDS IMPORT: Adelaide Presepeira
