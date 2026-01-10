-- ============================================================
-- STATEMENTS FOR: Valdevino
-- Generated: 2025-01-09
-- ============================================================
-- Contains all relationships where Valdevino is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- Valdevino associated_with Jovino dos Coelhos
-- Arrested together during police campaigns against capoeiras in Recife
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
  '1909-07-05'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Arrested together during police suppression campaigns against capoeiras in Recife. Named together in Valdemar de Oliveira''s account of the police campaign that sent them to detention."}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Arrested together during police campaigns against capoeiras in Recife (early 1900s). Ended with Jovino''s death on July 5, 1909.',
  'Presos juntos durante campanhas policiais contra capoeiras no Recife (início dos anos 1900). Terminou com a morte de Jovino em 5 de julho de 1909.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdevino' AND o.apelido = 'Jovino dos Coelhos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdevino associated_with João de Totó
-- Arrested together during police campaigns against capoeiras in Recife
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
  NULL, NULL,
  '{"association_context": "Arrested together during police suppression campaigns against capoeiras in Recife. Named together in Valdemar de Oliveira''s account of the police campaign that sent them to detention."}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Arrested together during police campaigns against capoeiras in Recife (early 1900s).',
  'Presos juntos durante campanhas policiais contra capoeiras no Recife (início dos anos 1900).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdevino' AND o.apelido = 'João de Totó'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None - all known associates (Jovino dos Coelhos, João de Totó) are in dataset.
