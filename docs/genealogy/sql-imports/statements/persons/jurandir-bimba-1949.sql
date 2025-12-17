-- ============================================================
-- STATEMENTS FOR: Jurandir (Bimba 1949)
-- Generated: 2025-12-17
-- ============================================================
-- Contains all relationships where Jurandir (Bimba student) is the SUBJECT.
-- Uses apelido_context='Bimba 1949' to match the entity.
-- ============================================================

-- Jurandir student_of Bimba
-- Confirmed: Jurandir trained under Mestre Bimba and represented his academy in 1949
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
  'capoeirahistory.com',
  'Jurandir trained at Mestre Bimba''s academy and represented it in the 1949 challenge against Sinhozinho''s school',
  'Jurandir treinou na academia de Mestre Bimba e a representou no desafio de 1949 contra a escola de Sinhozinho'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir' AND s.apelido_context = 'Bimba 1949'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Jurandir associated_with Fernando Rodrigues Perez - fellow Bimba student who fought alongside him in 1949
--   Fernando Rodrigues Perez needs import first (currently in backlog)
