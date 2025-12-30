-- ============================================================
-- STATEMENTS FOR: Ricardo de Ilha de Maré
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Ricardo de Ilha de Maré is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, r.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Both capoeiristas from Ilha de Maré during overlapping time periods. Totonho de Maré (1894-1974) was an established figure from the island who ''reigned in Ilha de Maré for many years.'' Ricardo was teaching on the island in the 1930s-1940s. Given the small size of the island community, they likely knew each other and may have trained together".}'::jsonb,
  'likely'::genealogy.confidence,
  'Geographic proximity and temporal overlap; Totonho''s documented presence on Ilha de Maré',
  'Both were capoeiristas from the small island community of Ilha de Maré during overlapping time periods. Likely knew each other given the close-knit nature of the island.',
  'Ambos eram capoeiristas da pequena comunidade da Ilha de Maré durante períodos sobrepostos. Provavelmente se conheciam dada a natureza próxima da ilha.'
FROM genealogy.person_profiles r, genealogy.person_profiles t
WHERE r.apelido = 'Ricardo de Ilha de Maré' AND t.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
