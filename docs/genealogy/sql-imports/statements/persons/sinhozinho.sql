-- ============================================================
-- STATEMENTS FOR: Sinhozinho
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Sinhozinho is the subject.
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
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1909-05-01'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/',
  'Sinhozinho witnessed Cyriaco defeat Sada Miyako at the Pavilhão Internacional on May 1, 1909. This fight inspired him to seek capoeira training on the Morro de Santo Antônio and among the malandros of Lapa.',
  'Sinhozinho testemunhou Cyriaco derrotar Sada Miyako no Pavilhão Internacional em 1º de maio de 1909. Esta luta o inspirou a buscar treinamento de capoeira no Morro de Santo Antônio e entre os malandros da Lapa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sinhozinho' AND o.apelido = 'Cyriaco'
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
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1908-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"training_type": "pernada/capoeira carioca"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho-1891-1962/; https://nossa-tribo.com/mestre-sinhozinho/',
  'After moving to Rio de Janeiro in 1908, Sinhozinho became neighbors with Zeca Floriano (son of President Floriano Peixoto), who trained him in pernada/capoeira carioca.',
  'Após mudar para o Rio de Janeiro em 1908, Sinhozinho tornou-se vizinho de Zeca Floriano (filho do Presidente Floriano Peixoto), que o treinou em pernada/capoeira carioca.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sinhozinho' AND o.apelido = 'Zeca Floriano'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
