-- ============================================================
-- STATEMENTS FOR: Siri de Mangue
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Siri de Mangue is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

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
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Training companions in Santo Amaro; part of Besouro''s circle that met on Sundays and holidays to play capoeira. Some sources also describe Siri as a student of Besouro".}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com, Capoeira Fandom Wiki, multiple sources describe them as training companions',
  'Part of Besouro''s circle of capoeiristas in Santo Amaro that included Paulo Barroquinha, Canário Pardo, and Maria Doze Homens. Described as "a gang of capoeira resistance fighters".',
  'Parte do círculo de capoeiristas de Besouro em Santo Amaro que incluía Paulo Barroquinha, Canário Pardo e Maria Doze Homens. Descrito como "uma gangue de lutadores de resistência da capoeira".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Siri de Mangue' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Cobrinha Verde trained_under Siri de Mangue is in statements/persons/cobrinha-verde.sql (subject's file)

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both part of Besouro''s circle in Santo Amaro/Recôncavo; described as ''a gang of capoeira resistance fighters who trained together on Sundays''"}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com; velhosmestres.com/br/besouro',
  'Part of Besouro''s network in Santo Amaro/Recôncavo',
  'Parte da rede de Besouro em Santo Amaro/Recôncavo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Siri de Mangue' AND o.apelido = 'Paulo Barroquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both from Santo Amaro/Recôncavo region; both companions of Besouro; both later taught Mestre Waldemar"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Waldemar interview: "I learned Capoeira from Siri de Mangue, Canário Pardo, Calabi de Periperi..."',
  'Both from Recôncavo region; companions of Besouro; both taught Mestre Waldemar',
  'Ambos da região do Recôncavo; companheiros de Besouro; ambos ensinaram Mestre Waldemar'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Siri de Mangue' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both from Besouro''s circle in Santo Amaro/Recôncavo region; both taught capoeira to others"}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com; velhosmestres.com/br/besouro',
  'Both part of Besouro''s extended network in the Recôncavo region',
  'Ambos parte da rede estendida de Besouro na região do Recôncavo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Siri de Mangue' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
