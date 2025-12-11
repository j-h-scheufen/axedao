-- ============================================================
-- STATEMENTS FOR: Cirandinha
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Cirandinha is the subject.
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/; A Noite newspaper April 1, 1949',
  'Cirandinha trained under Mestre Sinhozinho at his academies in Ipanema and downtown Rio de Janeiro. He was one of Sinhozinho''s top competitive fighters, representing the school in challenges against Mestre Bimba''s Regional (1949) and the Gracie family (1953).',
  'Cirandinha treinou sob Mestre Sinhozinho em suas academias em Ipanema e no centro do Rio de Janeiro. Ele foi um dos principais lutadores competitivos de Sinhozinho, representando a escola em desafios contra a Regional de Mestre Bimba (1949) e a familia Gracie (1953).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cirandinha' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
