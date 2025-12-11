-- ============================================================
-- STATEMENTS FOR: Mamede
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Mamede is the subject.
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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were active capoeiristas in Rio de Janeiro around 1850. Mamede is documented as one of the dangerous capoeiras of Manduca''s era in Plácido de Abreu''s Os Capoeiras (1886)."}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Multiple secondary sources discussing Manduca da Praia',
  'Both operated in the violent street culture of the maltas in mid-19th century Rio. Exact nature of interaction unknown.',
  'Ambos operavam na violenta cultura de rua das maltas no Rio de meados do século XIX. Natureza exata da interação desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mamede' AND o.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
