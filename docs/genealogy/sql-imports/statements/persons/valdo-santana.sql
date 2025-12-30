-- ============================================================
-- STATEMENTS FOR: Valdo Santana
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Valdo Santana is the SUBJECT.
-- ============================================================

-- Valdo Santana family_of Waldemar Santana (brother)
-- NOTE: Waldemar uses apelido "Leopardo Negro"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources confirm brothers; Revista Carioca de Educação Física (2020)',
  E'Valdo was the younger brother of Waldemar Santana. They co-founded Academia Santana in Rio de Janeiro around 1955-1956.',
  E'Valdo era irmão mais novo de Waldemar Santana. Eles co-fundaram a Academia Santana no Rio de Janeiro por volta de 1955-1956.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdo Santana'
  AND o.apelido = 'Leopardo Negro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Valdo Santana co_founded Academia Santana
-- NOTE: Academia Santana group entity not yet created - add to groups-backlog

-- Valdo Santana trained_under [Unknown capoeira teacher]
-- NOTE: Sources state he trained capoeira from youth but specific teacher unknown

-- ============================================================
-- REVERSE RELATIONSHIPS (belong in OTHER entities' files)
-- ============================================================
-- The following are documented here for reference but the actual SQL
-- statements belong in the respective subject's file:
--
-- Paulo Flores trained_under Valdo Santana (1962) → goes in paulo-flores.sql
-- Gato (Senzala) trained_under Valdo Santana (early 1960s) → goes in gato-senzala.sql
-- Zé Pedro influenced_by Valdo Santana → goes in ze-pedro.sql when created
-- Waldemar Santana family_of Valdo Santana → already in valdemar-santana.sql (pending)
