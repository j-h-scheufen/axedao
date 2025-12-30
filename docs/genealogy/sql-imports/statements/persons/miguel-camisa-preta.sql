-- ============================================================
-- STATEMENTS FOR: Miguel Camisa Preta
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Miguel Camisa Preta is the subject.
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
  NULL, 'unknown'::genealogy.date_precision,
  '1911-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Great friends in Rio capoeira/malandro world. Both enemies of police officer Elpídio Ribeiro da Rocha. Leão do Norte killed by Elpídio ~1911; Miguel swore vengeance and confronted Elpídio multiple times before being killed himself in 1912".}'::jsonb,
  'verified'::genealogy.confidence,
  'A Gazeta de Notícias, A Noite (July 12, 1912); capoeirahistory.com/black-shirt/',
  'Close friendship; Miguel swore to avenge Leão do Norte''s death at Elpídio''s hands',
  'Amizade próxima; Miguel jurou vingar a morte de Leão do Norte nas mãos de Elpídio'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Miguel Camisa Preta' AND o.apelido = 'Leão do Norte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
