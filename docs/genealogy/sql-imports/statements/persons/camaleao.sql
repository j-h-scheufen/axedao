-- ============================================================
-- STATEMENTS FOR: Camaleão
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Camaleão is the SUBJECT.
-- ============================================================

-- Camaleão trained_under Mucungê
-- "Shared years of life" with Mucungê - mentor relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1998-03-08'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.capoeira-orleans.fr/le-groupe/',
  E'Camaleão "shared years of life" with Mestre Mucungê, the legendary berimbau virtuoso and co-founder of Grupo Filhos de Angola (1960). Mucungê died March 8, 1998. Camaleão''s school "Filhos de Angola" (1994) was named in tribute to Mucungê''s group.',
  E'Camaleão "compartilhou anos de vida" com Mestre Mucungê, o lendário virtuose do berimbau e co-fundador do Grupo Filhos de Angola (1960). Mucungê faleceu em 8 de março de 1998. A escola de Camaleão "Filhos de Angola" (1994) foi nomeada em tributo ao grupo de Mucungê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camaleão' AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camaleão associated_with Marrom (Rio) - co-precursors of Vadiando Entre Amigos
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "co_precursor_vadiando_entre_amigos"}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/o-capoeireiro/vadiando-entre-amigos-rio-europa-e-sao-paulo/',
  E'Co-precursors of the "Vadiando Entre Amigos" movement in the 1990s. Together with Mestre Formiga, they organized itinerant rodas to promote interaction between different Angola expressions in Rio de Janeiro. The movement later expanded to São Paulo.',
  E'Co-precursores do movimento "Vadiando Entre Amigos" nos anos 1990. Junto com Mestre Formiga, organizaram rodas itinerantes para promover interação entre diferentes expressões da Angola no Rio de Janeiro. O movimento depois expandiu para São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camaleão' AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camaleão associated_with Formiga (Niterói) - co-precursors of Vadiando Entre Amigos
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1990-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "co_precursor_vadiando_entre_amigos"}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/o-capoeireiro/vadiando-entre-amigos-rio-europa-e-sao-paulo/',
  E'Co-precursors of the "Vadiando Entre Amigos" movement in the 1990s. Together with Mestre Marrom, they organized itinerant rodas to promote interaction between different Angola expressions in Rio de Janeiro.',
  E'Co-precursores do movimento "Vadiando Entre Amigos" nos anos 1990. Junto com Mestre Marrom, organizaram rodas itinerantes para promover interação entre diferentes expressões da Angola no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camaleão' AND o.apelido = 'Formiga' AND o.apelido_context = 'Niterói'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camaleão associated_with Angolinha - Vadiando Entre Amigos participant
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1993-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "vadiando_entre_amigos_participant"}'::jsonb, 'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/o-capoeireiro/vadiando-entre-amigos-rio-europa-e-sao-paulo/',
  E'Mestre Angolinha joined the "Vadiando Entre Amigos" movement three years after its founding, alongside Mestre Manoel. Part of Rio de Janeiro''s capoeira angola community.',
  E'Mestre Angolinha juntou-se ao movimento "Vadiando Entre Amigos" três anos após sua fundação, junto com Mestre Manoel. Parte da comunidade de capoeira angola do Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camaleão' AND o.apelido = 'Angolinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Camaleão founded Escola de Capoeira Filhos de Angola (Camaleão) - group needs import first
-- Founded 1994 in Rio de Janeiro, named in tribute to Mucungê's 1960 group
-- Now based in Marseille with branches in France, Mexico, Japan, Portugal

-- Camaleão associated_with Manoel (GCAP) - joined Vadiando Entre Amigos ~3 years after founding
-- Needs verification which "Mestre Manoel" - likely Manoel de Grupo Ypiranga de Pastinha

-- ============================================================
-- STUDENTS (not in dataset - non-Brazilian or below mestre level)
-- ============================================================
-- Camaleão formed Professor Picapau (Orléans, France) - co-founded early 2000s
-- Camaleão formed Professor Rubião/Rubens Bião (Lisbon, Portugal) - founded 2017
-- Camaleão formed Gatinho Angola (Marseille 2002-2011) - left due to philosophical differences
