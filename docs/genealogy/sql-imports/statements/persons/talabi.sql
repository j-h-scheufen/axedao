-- ============================================================
-- STATEMENTS FOR: Talabi
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Talabi is the subject.
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
  '1930-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both taught at the famous ''roda danada'' in Periperi in the 1930s; both were among Mestre Waldemar''s four teachers"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Waldemar 1989 interview: "I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four"',
  'Both mestres taught at the Periperi roda where Waldemar learned capoeira starting in 1936. Part of the informal street capoeira culture before the academy era.',
  'Ambos os mestres ensinavam na roda de Periperi onde Waldemar aprendeu capoeira a partir de 1936. Parte da cultura informal de capoeira de rua antes da era das academias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Talabi' AND s.apelido_context = 'de Periperi' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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
  '1930-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the old mestres who taught Mestre Waldemar at the Periperi roda in the 1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Waldemar interview: "I learned Capoeira from Siri de Mangue, Canário Pardo, Calabi de Periperi..."',
  'Both were part of the generation of old mestres who taught street capoeira before the academy era. Both taught Mestre Waldemar.',
  'Ambos faziam parte da geração de mestres antigos que ensinavam capoeira de rua antes da era das academias. Ambos ensinaram Mestre Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Talabi' AND s.apelido_context = 'de Periperi' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
