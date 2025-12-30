-- ============================================================
-- STATEMENTS FOR: Nicolau do Poço
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Nicolau do Poço is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- --- Person-to-Person: Associations ---

-- Nicolau do Poço associated_with Nascimento Grande
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
  '{"association_context": "Both were valentões of Recife carnival. Valdemar de Oliveira notes that young men from good families liked to go with Nicolau do Poço or Nascimento Grande to break up pastoral plays for enjoyment".}'::jsonb,
  'verified'::genealogy.confidence,
  'Valdemar de Oliveira, "Frevo, Capoeira e Passo" (1942)',
  'Nicolau do Poço and Nascimento Grande were both prominent figures in Recife''s nightlife and street culture. Young men of good families sought their company to break up pastoral plays.',
  'Nicolau do Poço e Nascimento Grande eram ambos figuras proeminentes na vida noturna e cultura de rua do Recife. Rapazes de boas famílias buscavam sua companhia para arrebentar pastoris.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nicolau do Poço' AND o.apelido = 'Nascimento Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified
