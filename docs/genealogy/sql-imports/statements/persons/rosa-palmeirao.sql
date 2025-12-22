-- ============================================================
-- STATEMENTS FOR: Rosa Palmeirão
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Rosa Palmeirão is the SUBJECT.
-- ============================================================

-- Rosa Palmeirão associated_with Pedro Mineiro (defeated him)
-- NOTE: Pedro Mineiro is in the persons-backlog with status 'pending'
-- This statement will be activated once Pedro Mineiro is imported
/*
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, 'unknown'::genealogy.date_precision,
  '1915-01-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Rosa Palmeirão defeated Pedro Mineiro in combat, ending his reputation as a valente"}'::jsonb,
  'likely'::genealogy.confidence,
  'A TARDE newspaper; Paula Juliana Foltran thesis',
  E'Rosa Palmeirão defeated Pedro Mineiro before his death on January 18, 1915, in a fight that ended his reputation as Salvador''s most feared valentão.',
  E'Rosa Palmeirão derrotou Pedro Mineiro antes de sua morte em 18 de janeiro de 1915, em uma luta que acabou com sua fama de valentão mais temido de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rosa Palmeirão' AND o.apelido = 'Pedro Mineiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
*/

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rosa Palmeirão associated_with Pedro Mineiro - Pedro Mineiro in backlog (pending)
-- Note: Pedro Mineiro exists in persons-backlog.md from Antônio Corró import
-- Once imported, uncomment the statement above
