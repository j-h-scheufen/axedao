-- ============================================================
-- STATEMENTS FOR: Moraes
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Moraes is the SUBJECT.
-- Per ownership rule: statements go in the file named after SUBJECT.
-- ============================================================

-- Moraes student_of João Grande
-- Primary teacher-student relationship. Moraes considers João Grande his "true teacher."
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/, https://capoeira.online/history/mestres/mestre-moraes/',
  E'Moraes began training at Pastinha''s academy around age 8 (~1958). João Grande and João Pequeno ran the classes as Pastinha was blind. Moraes states he considers João Grande his true teacher due to the impression made by the way João Grande played capoeira.',
  E'Moraes começou a treinar na academia de Pastinha por volta dos 8 anos (~1958). João Grande e João Pequeno davam as aulas pois Pastinha estava cego. Moraes afirma considerar João Grande seu verdadeiro mestre devido à impressão causada pela forma como João Grande jogava capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Moraes trained_under João Pequeno
-- Trained at Pastinha's academy where João Pequeno was one of the instructors
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/, https://capoeira.online/history/mestres/mestre-moraes/',
  E'Moraes trained at Pastinha''s academy where João Pequeno was one of the two principal instructors (alongside João Grande). João Pequeno and João Grande ran the academy as Pastinha was blind.',
  E'Moraes treinou na academia de Pastinha onde João Pequeno era um dos dois instrutores principais (junto com João Grande). João Pequeno e João Grande dirigiam a academia pois Pastinha estava cego.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Moraes trained_under Pastinha
-- Academy training at CECA, though Pastinha was blind and no longer teaching directly
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-moraes/',
  E'Moraes trained at Mestre Pastinha''s Centro Esportivo de Capoeira Angola (CECA). However, by this time Pastinha was already going blind and no longer taught classes directly. Using ''trained_under'' rather than ''student_of'' to reflect that the actual instruction came from João Grande and João Pequeno.',
  E'Moraes treinou no Centro Esportivo de Capoeira Angola (CECA) de Mestre Pastinha. No entanto, nessa época Pastinha já estava ficando cego e não dava mais aulas diretamente. Usando ''trained_under'' em vez de ''student_of'' para refletir que a instrução real veio de João Grande e João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Moraes' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- These relationships require the object entity to be imported first.
-- Add to persons-backlog.md and groups-backlog.md as appropriate.
-- ============================================================

-- Person-to-Group relationships (GCAP not yet imported):
-- Moraes founded GCAP - Founded October 5, 1980 in Rio de Janeiro

-- Person-to-Person relationships:
-- Cobra Mansa student_of Moraes - RESOLVED: see cobra-mansa.sql (Cobra Mansa student_of Moraes)
-- Braga student_of Moraes - Met 1975; mestre 1978; co-founded GCAP
-- Neco student_of Moraes - Mestre 1978; co-founded GCAP; originated GCAP idea
-- Zé Carlos student_of Moraes - Mestre 1978; co-founded GCAP; later founded N'Golo
-- Marco Aurélio student_of Moraes - Contramestre 1978; mestre ~1982
-- Janja student_of Moraes - Started GCAP 1983; founded Grupo Nzinga 1995
-- Paulinha student_of Moraes - Contramestra 1990; co-founded Nzinga
-- Poloca student_of Moraes - Contramestre at GCAP; co-founded Nzinga
-- Valmir student_of Moraes - Started GCAP 1982; mestre 2003; leads FICA-Salvador
-- Jurandir student_of Moraes - Pioneer of GCAP; founded N'GOLO Angola 1990

-- Note: When these persons/groups are imported, their relationship statements
-- should go in THEIR respective statement files (e.g., cobra-mansa.sql should
-- contain "Cobra Mansa student_of Moraes"), not in this file.
