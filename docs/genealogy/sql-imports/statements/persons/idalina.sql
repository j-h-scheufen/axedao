-- ============================================================
-- STATEMENTS FOR: Idalina
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Idalina is the SUBJECT.
-- ============================================================

-- Idalina associated_with Angélica Endiabrada (contemporaries)
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
  E'Both were legendary valentonas of the Distrito da Sé in Salvador during the 1910s-1920s; documented in newspaper headlines and police records for capoeiragem',
  E'Ambas eram lendárias valentonas do Distrito da Sé em Salvador durante os anos 1910-1920; documentadas nas manchetes de jornais e registros policiais por capoeiragem'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Angélica Endiabrada'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Salomé (contemporaries)
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
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Maria Doze Homens (contemporaries)
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
  '{"association_context": {"en": "Contemporary valentonas of early 20th century Salvador; both part of legendary generation of female capoeiristas", "pt": "Valentonas contemporâneas de Salvador do início do século XX; ambas parte da geração lendária de capoeiristas femininas"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia; Maria Doze Homens was mentor to Salomé',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia; Maria Doze Homens foi mentora de Salomé'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Rosa Palmeirão (contemporaries)
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
  'Paula Foltran thesis (UnB, 2019); Pedro Abib research',
  E'Both documented among legendary female capoeiristas of early 20th century Bahia',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Rosa Palmeirão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Idalina associated_with Chicão (contemporaries)
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
  E'Both documented among legendary female capoeiristas of early 20th century Bahia; Chicão killed Pedro Porreta in 1929',
  E'Ambas documentadas entre as lendárias capoeiristas do início do século XX na Bahia; Chicão matou Pedro Porreta em 1929'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Idalina' AND o.apelido = 'Chicão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Idalina associated_with Zeferina - Documented rival; multiple conflicts 1917-1920
--   Source: Jornal de Notícias (1917, April 24, 1920)
--   "encontraram-se as desafetas e foram ao duelo a murro e pontapé"
--   Fought over prostitution territory; both charged with capoeiragem
--   NEEDS IMPORT: Zeferina
--
-- Idalina associated_with Firmina - Companion Idalina defended in 1917 incident
--   NEEDS IMPORT: Firmina (unclear if capoeirista - may be associate only)
--
-- Idalina associated_with Massú - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Massú
--
-- Idalina associated_with Catu - Contemporary legendary female capoeirista
--   NEEDS IMPORT: Catu
--
-- Idalina associated_with Almerinda - Contemporary documented in Pedro Abib's research
--   NEEDS IMPORT: Almerinda
--
-- Idalina associated_with Menininha - Contemporary documented in Pedro Abib's research
--   NEEDS IMPORT: Menininha
--
-- Idalina associated_with Adelaide Presepeira - Contemporary 1920s-1930s
--   NEEDS IMPORT: Adelaide Presepeira
--
-- NOTE ON MESTRE BIMBA CONNECTION:
-- Mestre Bimba named a toque "Idalina" after her, indicating her legendary status
-- was known in the capoeira community. However, no direct training relationship
-- is documented - this is a cultural/commemorative connection, not a lineage relationship.
