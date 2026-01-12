-- ============================================================
-- STATEMENTS FOR: Paraná (Praia do Sol)
-- Generated: 2026-01-11
-- Updated: 2026-01-11 - Added student_of Marcio (now in dataset)
-- ============================================================
-- Contains all relationships where Paraná (Praia do Sol) is the SUBJECT.
-- NOTE: Uses apelido_context 'Praia do Sol' to distinguish from
-- Paraná (Oswaldo Lisboa dos Santos, 1922-1972)
-- ============================================================

-- Paraná (Praia do Sol) student_of Marcio (Praia do Sol)
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cncapoeira.nl/en/about-us/',
  'Trained under Mestre Marcio in the Praia do Sol group in São Paulo. Lineage: Mestre Limão → Mestre Marcio → Mestre Paraná.',
  'Treinou com Mestre Marcio no grupo Praia do Sol em São Paulo. Linhagem: Mestre Limão → Mestre Marcio → Mestre Paraná.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context = 'Praia do Sol'
  AND o.apelido = 'Marcio' AND o.apelido_context = 'Praia do Sol'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Paraná trained_under Mestre Limão
-- NOTE: Limão IS in dataset, but this is an indirect lineage relationship
-- Paraná trained under Marcio, not directly under Limão
-- Limão died in 1985; Caravelas Negras founded 1993
-- DO NOT generate direct trained_under statement - it was through Marcio

-- Paraná founded Caravelas Negras (1993)
-- GROUP NOT IN DATASET: Caravelas Negras is in backlog (groups-backlog.md)
-- Founded in São Paulo, now active in Netherlands
-- Current Netherlands leader: Contra Mestre Miojo

-- ============================================================
-- NOTES ON RELATIONSHIPS
-- ============================================================
--
-- TEACHER RELATIONSHIP:
-- - Mestre Marcio (Praia do Sol) - primary teacher - PENDING (person not in dataset)
--
-- GRAND-TEACHER (indirect):
-- - Mestre Limão - teacher of Mestre Marcio - IN DATASET but no direct statement
--
-- GROUP RELATIONSHIPS:
-- - member_of Grupo Praia do Sol - PENDING (group not in dataset)
-- - founded Caravelas Negras (1993) - PENDING (group not in dataset)
--
-- STUDENTS:
-- - Contra Mestre Miojo (Marcio Rogerio de Silva) - leads Netherlands operations
--   NOTE: Student statements go in student's file, not teacher's file
--
-- ============================================================
