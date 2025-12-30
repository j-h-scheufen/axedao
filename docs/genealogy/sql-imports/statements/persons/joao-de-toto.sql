-- ============================================================
-- STATEMENTS FOR: João de Totó
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where João de Totó is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- João de Totó associated_with Nascimento Grande
-- Both were prominent valentões of Recife carnival in late 1800s/early 1900s
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
  '{"association_context": "Both were valentões of Recife carnival, mentioned together as the most feared capoeiristas. Of all the valentões—Jovino dos Coelhos, Nicolau do Poço, João de Totó—Nascimento Grande was the most feared".}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Both were prominent valentões of Recife carnival who performed in front of carnival bands.',
  'Ambos eram valentões proeminentes do carnaval do Recife que se apresentavam na frente das bandas de carnaval.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João de Totó' AND o.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- João de Totó associated_with Valdevino - arrested together during police campaigns
-- (requires Valdevino import first)
