-- ============================================================
-- STATEMENTS FOR: Chicão
-- Generated: 2025-12-19
-- ============================================================
-- This file contains all relationships where Chicão is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Chicão associated_with Pedro Porreta (defeated him in 1929, suspected of his murder)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1929-09-28'::date, 'exact'::genealogy.date_precision,
  '1930-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "Adversary; Chicão defeated Pedro Porreta on Sept 28, 1929 when he invaded her room; later suspected of his murder"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestres e capoeiras famosos da Bahia (SciELO); Espeto Capoeira; Portal Capoeira; A Tarde newspaper',
  'On September 28, 1929, Pedro Porreta invaded Chicão''s room searching for clothing. Chicão beat him severely, resulting in her detention and him arriving at police station badly injured. Some time later, Porreta was assassinated and Chicão was the main suspect.',
  'Em 28 de setembro de 1929, Pedro Porreta invadiu o quarto de Chicão procurando roupas. Chicão o espancou severamente, resultando na detenção dela e ele chegando muito machucado à delegacia. Algum tempo depois, Porreta foi assassinado e Chicão foi a principal suspeita.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Salomé (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1920s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Salomé were valentonas active in Salvador during the 1920s-1930s, listed together in historical accounts of famous female capoeiristas/fighters of the era.',
  'Tanto Chicão quanto Salomé eram valentonas ativas em Salvador durante os anos 1920-1930, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Angélica Endiabrada (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1910s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Angélica Endiabrada were valentonas active in Salvador, listed together in historical accounts of famous female capoeiristas/fighters of the era. Angélica was active 1910-1920s, Chicão 1920s-1930s.',
  'Tanto Chicão quanto Angélica Endiabrada eram valentonas ativas em Salvador, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época. Angélica era ativa 1910-1920s, Chicão 1920s-1930s.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Angélica Endiabrada'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chicão associated_with Maria Doze Homens (fellow valentona, contemporary)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow valentonas of 1920s-1930s Salvador; both documented as legendary female capoeiristas/fighters of the era"}'::jsonb,
  'likely'::genealogy.confidence,
  'Espeto Capoeira; Portal Capoeira; Mestres e capoeiras famosos da Bahia',
  'Both Chicão and Maria Doze Homens were valentonas active in Salvador during the 1920s-1930s, listed together in historical accounts of famous female capoeiristas/fighters of the era.',
  'Tanto Chicão quanto Maria Doze Homens eram valentonas ativas em Salvador durante os anos 1920-1930, listadas juntas em relatos históricos de famosas mulheres capoeiristas/lutadoras da época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chicão' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Chicão associated_with Rosa Palmeirão - fellow valentona, needs import first
-- Chicão associated_with Massú - fellow valentona, needs import first
-- Chicão associated_with Catu - fellow valentona, needs import first
-- Chicão associated_with Almerinda - fellow valentona, needs import first
-- Chicão associated_with Menininha - fellow valentona, needs import first
