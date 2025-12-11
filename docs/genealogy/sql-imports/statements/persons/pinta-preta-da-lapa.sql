-- ============================================================
-- STATEMENTS FOR: Pinta Preta da Lapa
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Pinta Preta da Lapa is the subject.
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
  '1860-01-01'::date, 'decade'::genealogy.date_precision,
  '1870-01-07'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both were prominent capoeiristas in Rio de Janeiro during the 1860s-1870s. Manduca da Praia was chief of the Santa Luzia party (Nagoas), while Pinta Preta was chief of the Glória capoeiras (also Nagoas). Both documented in Plácido de Abreu''s Os Capoeiras (1886)."}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Carlos Eugênio Líbano Soares, "A Negregada Instituição" (1999)',
  'Both operated as gang chiefs in the capoeira maltas of Rio de Janeiro. Exact nature of interaction unknown - possibly allies within the Nagoas federation.',
  'Ambos operavam como chefes de gangue nas maltas de capoeira do Rio de Janeiro. Natureza exata da interação desconhecida - possivelmente aliados dentro da federação Nagoas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinta Preta da Lapa' AND o.apelido = 'Manduca da Praia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
