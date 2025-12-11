-- ============================================================
-- STATEMENTS FOR: Maria Doze Homens
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Maria Doze Homens is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

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
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Listed in some sources as part of Besouro''s Sunday training circle; described as companions who ''formed a gang of capoeira resistance fighters''"}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com - Who was Besouro; CapoeiraWiki - Women in capoeira',
  'Some sources list her among Besouro''s training companions alongside Paulo Barroquinha, Canário Pardo, and Siri de Mangue',
  'Algumas fontes a listam entre os companheiros de treino de Besouro junto com Paulo Barroquinha, Canário Pardo e Siri de Mangue'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria Doze Homens' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
