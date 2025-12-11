-- ============================================================
-- STATEMENTS FOR: Salomé
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Salomé is the subject.
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
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Atenilo testimony in "Atenilo, o relâmpago da Capoeira Regional" (1988) by Mestre Itapoan; also in Gratidão Capoeira article',
  'Salomé and Maria dos Anjos were both students of Doze Homens according to Mestre Atenilo',
  'Salomé e Maria dos Anjos foram ambas alunas de Doze Homens segundo Mestre Atenilo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Salomé' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
