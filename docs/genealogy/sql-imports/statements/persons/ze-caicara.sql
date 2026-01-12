-- ============================================================
-- STATEMENTS FOR: Zé (Caiçara lineage)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Zé (Caiçara) is the SUBJECT.
-- Note: Uses apelido_context 'Caiçara' for disambiguation.
-- ============================================================

-- Zé (Caiçara) student_of Caiçara
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Omilad D''Angola testimony at velhosmestres.com',
  E'Mestre Zé trained under Mestre Caiçara at the fish market in Jardim Cruzeiro, Salvador. He rose to contra-mestre rank.',
  E'Mestre Zé treinou com Mestre Caiçara no mercado de peixe do Jardim Cruzeiro, Salvador. Alcançou o posto de contra-mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé' AND s.apelido_context = 'Caiçara'
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No associated_with relationships needed.
-- Fellow contra-mestres (Fernandinho, Paulo Santo Amaro, Silvestre)
-- were fellow students under Caiçara, not specifically documented
-- as having direct connections beyond shared training.
-- ============================================================
