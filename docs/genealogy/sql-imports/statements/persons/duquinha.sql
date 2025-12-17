-- ============================================================
-- STATEMENTS FOR: Duquinha
-- Generated: 2025-12-17
-- ============================================================
-- This file contains all relationships where Duquinha is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Duquinha associated_with Escalvino ("Os irmaos terror" - The terror brothers)
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
  '{"association_context": "Known together as ''Os irmãos terror'' (The terror brothers); shared chapter in ''Mestres e capoeiras famosos da Bahia''; may be biological brothers or close associates"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestres e capoeiras famosos da Bahia (SciELO Books)',
  'Known together as "Os irmãos terror" (The terror brothers) in Salvador''s capoeira underworld during the 1920s-1930s',
  'Conhecidos juntos como "Os irmãos terror" no submundo capoeirista de Salvador durante os anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Escalvino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Duquinha associated_with Pedro Porreta (both defended by Cosme de Farias)
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
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Duquinha associated_with Chico Tres Pedacos (both defended by Cosme de Farias)
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
  '{"association_context": "Both were capoeiristas in Salvador defended by Cosme de Farias during the 1920s-1930s"}'::jsonb,
  'likely'::genealogy.confidence,
  'Revista Capoeirando; Sankofa USP article on Cosme de Farias',
  'Both were valentões in Salvador who were defended by the legendary rábula Cosme de Farias during legal proceedings in the 1920s-1930s',
  'Ambos eram valentões em Salvador que foram defendidos pelo lendário rábula Cosme de Farias durante processos judiciais nos anos 1920-1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Duquinha' AND o.apelido = 'Chico Três Pedaços'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Other Cosme de Farias clients (Bastião, Samuel, Nozinho)
-- share historical context but no direct personal relationships documented.
-- Connection is via shared lawyer, captured in bios/notes.
-- Escalvino relationship ("Os irmãos terror") captured above.
-- ============================================================
