-- ============================================================
-- STATEMENTS FOR: Nascimento Grande
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Nascimento Grande is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', ng.id,
  'associated_with',
  'person', mp.id,
  '{"association_context": {"en": "Contemporaries representing regional capoeira legends. Nascimento Grande dominated Pernambuco while Manduca da Praia dominated Rio de Janeiro.", "pt": "Contemporâneos representando lendas regionais da capoeira. Nascimento Grande dominava Pernambuco enquanto Manduca da Praia dominava o Rio de Janeiro."}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources including History of Fighting, Grupo Capoeira Raça Negra'
FROM genealogy.person_profiles ng, genealogy.person_profiles mp
WHERE ng.apelido = 'Nascimento Grande' AND mp.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
