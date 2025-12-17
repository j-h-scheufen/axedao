-- ============================================================
-- STATEMENTS FOR: José Bidel
-- Generated: 2025-12-16
-- ============================================================
-- This file contains all relationships where José Bidel is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- José Bidel associated_with Besouro Mangangá
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
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Besouro visited José Bidel''s house according to Mário Buscapé; José Bidel trained with Besouro''s companions (Siri de Mangue, Canário Pardo) in the Recôncavo network"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mário Buscapé testimony via capoeirahistory.com; capoeira-toulouse.fr',
  'Besouro visited the family home before Mário was born (pre-1924). José Bidel belonged to the network of capoeiristas connected to Besouro in the Recôncavo.',
  'Besouro visitou a casa da família antes de Mário nascer (pré-1924). José Bidel pertencia à rede de capoeiristas conectados a Besouro no Recôncavo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel associated_with Siri de Mangue
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
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Training companions in the Recôncavo network; both from São Francisco do Conde/Santo Amaro region; part of Besouro''s extended circle"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro"',
  'Training companions in the Recôncavo. Both worked in water-related professions (crabber and boatman) and practiced capoeira.',
  'Companheiros de treino no Recôncavo. Ambos trabalhavam em profissões relacionadas à água (catador de caranguejo e barqueiro) e praticavam capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel associated_with Neco Canário Pardo
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
  '1920-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Training companions in the Recôncavo network; both associated with Besouro''s circle in Santo Amaro region"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony: "His father and his uncle Dendê practised capoeira and met up with famous capoeiras of the Recôncavo like Siri de Mangue, Canário Pardo and Besouro from Santo Amaro"',
  'Training companions in the Recôncavo. José Bidel trained with Canário Pardo, who was known as both a capoeirista and machete teacher.',
  'Companheiros de treino no Recôncavo. José Bidel treinou com Canário Pardo, que era conhecido tanto como capoeirista quanto professor de facão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- José Bidel family_of Mário Buscapé (father-son)
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
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1934-07-17'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "father", "details": "José Bidel taught capoeira to his son Mário alongside his brother Dendê in improvised rodas in their backyard"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mário Buscapé direct testimony via capoeirahistory.com',
  'José Bidel was the father of Mário Buscapé. Along with his brother Dendê, he taught capoeira to Mário starting at age 8 in backyard rodas.',
  'José Bidel era o pai de Mário Buscapé. Junto com seu irmão Dendê, ensinou capoeira a Mário a partir dos 8 anos em rodas no quintal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'José Bidel' AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
