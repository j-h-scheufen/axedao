-- ============================================================
-- STATEMENTS FOR: Alemãozinho
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Alemãozinho is the subject.
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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were victims in the 1870 vendetta cycle documented by Plácido de Abreu. Alemãozinho was killed at Teatro Lírico do Campo after Pinta Preta''s and Jacó''s deaths, as part of ongoing reprisals between capoeira maltas."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Part of documented vendetta sequence: Pinta Preta → Jacó → Alemãozinho → César-Maneta. The nature of their relationship (allies, rivals, or otherwise) is unknown.',
  'Parte de sequência de vingança documentada: Pinta Preta → Jacó → Alemãozinho → César-Maneta. A natureza de sua relação (aliados, rivais, ou outra) é desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Alemãozinho' AND o.apelido = 'Pinta Preta da Lapa'
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
  '1870-01-01'::date, 'year'::genealogy.date_precision,
  '1870-12-31'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Consecutive victims in the 1870 vendetta cycle. Alemãozinho was killed after Jacó in the sequence of reprisals documented by Plácido de Abreu."}'::jsonb,
  'verified'::genealogy.confidence,
  'Plácido de Abreu, "Os Capoeiras" (1886)',
  'Consecutive victims: Jacó was killed at Paula Matos/Riachuelo, then Alemãozinho at Teatro Lírico do Campo.',
  'Vítimas consecutivas: Jacó foi morto em Paula Matos/Riachuelo, depois Alemãozinho no Teatro Lírico do Campo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Alemãozinho' AND o.apelido = 'Jacó'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
