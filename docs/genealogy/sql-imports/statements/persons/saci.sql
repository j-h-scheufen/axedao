-- ============================================================
-- STATEMENTS FOR: Saci
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Saci is the SUBJECT.
-- ============================================================

-- Saci student_of Bimba (July 1964 - 1974)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-07-01'::date, 'month'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'UNICAR München (capoeira-muenchen.de)',
  E'Trained at Mestre Bimba''s Centro de Cultura Física e Luta Regional from July 1964 until Bimba''s death in February 1974. Witnessed historical developments at the academy.',
  E'Treinou no Centro de Cultura Física e Luta Regional de Mestre Bimba a partir de julho de 1964 até a morte de Bimba em fevereiro de 1974. Testemunhou desenvolvimentos históricos na academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Saci' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Note: The following relationships involve entities not yet imported.
-- These should be added once the corresponding person profiles exist.
--
-- STUDENTS OF SACI (where Saci taught, so THEY are student_of Saci):
-- - Ezequiel student_of Saci - Already exists in ezequiel.sql statements
-- - Binal student_of Saci - Needs Binal profile first
-- - Nelsinho received_title_from Saci - Needs Nelsinho profile first
-- - Saguin received_title_from Saci - Needs Saguin profile first
--
-- These statements should go in the STUDENT's file (not Saci's) per ownership rule.
-- ============================================================
