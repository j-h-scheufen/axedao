-- ============================================================
-- STATEMENTS FOR: Quebra Coco
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Quebra Coco is the subject.
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
  '{"association_context": "Both were active capoeiristas in Rio de Janeiro around 1850. Quebra Coco is documented as one of the dangerous capoeiras of Manduca''s era in Plácido de Abreu''s Os Capoeiras (1886) and Melo Morais Filho''s Festas e Tradições (1888)".}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1888)',
  'Both operated in the violent street culture of the maltas in mid-19th century Rio.',
  'Ambos operavam na violenta cultura de rua das maltas no Rio de meados do século XIX.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quebra Coco' AND o.apelido = 'Manduca da Praia'
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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both named among the dangerous capoeiras of 1850s Rio de Janeiro in the earliest written sources".}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1888)',
  'Both named in the same list of dangerous capoeiras from Manduca da Praia''s era.',
  'Ambos nomeados na mesma lista de perigosos capoeiras da era de Manduca da Praia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quebra Coco' AND o.apelido = 'Mamede'
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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both named among the dangerous capoeiras of 1850s Rio de Janeiro in the earliest written sources".}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1888)',
  'Both named in the same list of dangerous capoeiras from Manduca da Praia''s era.',
  'Ambos nomeados na mesma lista de perigosos capoeiras da era de Manduca da Praia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quebra Coco' AND o.apelido = 'Aleixo Açougueiro'
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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both named among the dangerous capoeiras of 1850s Rio de Janeiro in the earliest written sources".}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1888)',
  'Both named in the same list of dangerous capoeiras from Manduca da Praia''s era.',
  'Ambos nomeados na mesma lista de perigosos capoeiras da era de Manduca da Praia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quebra Coco' AND o.apelido = 'Pedro Cobra'
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
  '1850-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both named among the dangerous capoeiras of 1850s Rio de Janeiro in the earliest written sources".}'::jsonb,
  'likely'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886); Melo Morais Filho, "Festas e Tradições Populares do Brasil" (1888)',
  'Both named in the same list of dangerous capoeiras from Manduca da Praia''s era.',
  'Ambos nomeados na mesma lista de perigosos capoeiras da era de Manduca da Praia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Quebra Coco' AND o.apelido = 'Bentevi'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
