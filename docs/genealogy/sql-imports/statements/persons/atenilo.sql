-- ============================================================
-- STATEMENTS FOR: Atenilo
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Atenilo is the subject.
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
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Some sources claim Atenilo was Neco Canário Pardo''s brother and used the nickname Cordão de Ouro. This is disputed due to ~38-year age gap (Neco c.1880, Atenilo 1918). Mestre Waldemar attributed Cordão de Ouro to Besouro Mangangá himself."}'::jsonb,
  'uncertain'::genealogy.confidence,
  'San Francisco Capoeira blog; disputed by Mestre Waldemar attribution',
  'Alleged brothers per some sources. Chronologically problematic: ~38-year age gap suggests half-brothers at most. May be erroneous.',
  'Alegados irmãos segundo algumas fontes. Cronologicamente problemático: diferença de ~38 anos sugere meio-irmãos no máximo. Pode ser errôneo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Atenilo' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
