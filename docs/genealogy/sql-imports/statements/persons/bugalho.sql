-- ============================================================
-- STATEMENTS FOR: Bugalho
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Bugalho is the SUBJECT.
-- ============================================================

-- Bugalho student_of Waldemar
-- Bugalho frequented Waldemar's barracão as one of his regular capoeiristas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'esquiva.wordpress.com/mestres/mestre-bugalho, velhosmestres.com/br/waldemar-1955-3',
  E'Bugalho frequented Waldemar''s barracão in Liberdade as a regular capoeirista and berimbau player. Sources describe him as one of Waldemar''s bambas. He was photographed by Pierre Verger at the barracão (~1955) and filmed in "Voyage sans passeport" (1960) with Waldemar.',
  E'Bugalho frequentava o barracão de Waldemar na Liberdade como capoeirista e tocador de berimbau regular. Fontes o descrevem como um dos bambas de Waldemar. Foi fotografado por Pierre Verger no barracão (~1955) e filmado em "Voyage sans passeport" (1960) com Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bugalho associated_with Pastinha (recognized by him in 1967)
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
  '{"association_context": "recognized as legendary pure Angola capoeirista"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/pastinha-1967, pastinha.md',
  E'In 1967, Mestre Pastinha listed Bugalho among deceased practitioners of "pure Capoeira de Angola." This establishes Bugalho was recognized by Pastinha as a legendary figure in traditional capoeira.',
  E'Em 1967, Mestre Pastinha listou Bugalho entre os praticantes falecidos da "pura Capoeira de Angola." Isso estabelece que Bugalho era reconhecido por Pastinha como figura lendária na capoeira tradicional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bugalho' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Pelé da Bomba student_of Bugalho - PENDING: Pelé da Bomba not yet in dataset
--   Natalício Neves da Silva (1934-2024), the "Gogó de Ouro" of Bahia
--   Started learning from Bugalho in 1946 at Mercado Modelo ramp at age 12
--   Primary source: velhosmestres.com/br/destaques-20
