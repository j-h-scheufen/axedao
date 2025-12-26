-- ============================================================
-- STATEMENTS FOR: Franklin
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Franklin is the SUBJECT.
-- ============================================================

-- Franklin student_of Ezequiel
-- Ezequiel exists in dataset (docs/genealogy/sql-imports/entities/persons/ezequiel.sql)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, IPHAN Capoeira Portal, Grupo Luanda Zürich website',
  'Franklin was among Ezequiel''s first students. He helped found Grupo Luanda with Ezequiel in 1964.',
  'Franklin estava entre os primeiros alunos de Ezequiel. Ajudou a fundar o Grupo Luanda com Ezequiel em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Franklin' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Franklin co_founded Grupo Luanda - Grupo Luanda is in groups-backlog, not yet imported
-- When Grupo Luanda is imported, add:
-- INSERT INTO genealogy.statements (...) SELECT 'person', s.id, 'co_founded', 'group', g.id,
--   '1964-01-01', 'year', NULL, NULL, '{}'::jsonb, 'verified',
--   'velhosmestres.com, IPHAN', 'Co-founded with Mestre Ezequiel', '...'
-- FROM genealogy.person_profiles s, genealogy.group_profiles g
-- WHERE s.apelido = 'Franklin' AND g.name = 'Grupo Luanda';
