-- ============================================================
-- STATEMENTS FOR: Gladson
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Gladson is the SUBJECT.
-- ============================================================

-- Gladson trained_under Paulo Gomes (first teacher, 1966)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'jornal.usp.br, clinicadecapoeira2014.wordpress.com',
  'First teacher at Associação de Capoeira Ilha da Maré, Rua Augusta 1351, São Paulo. Paulo Gomes was a disciple of Artur Emídio.',
  'Primeiro professor na Associação de Capoeira Ilha da Maré, Rua Augusta 1351, São Paulo. Paulo Gomes era discípulo de Artur Emídio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gladson' AND o.apelido = 'Paulo Gomes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gladson student_of Onça (SP) - PRIMARY TEACHER for Regional graduation
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
  '{"graduation_style": "regional"}'::jsonb, 'verified'::genealogy.confidence,
  'jornal.usp.br, maltabrasil.de/mestre-gladson, clinicadecapoeira2014.wordpress.com',
  'Gladson trained at Associação K-Poeira (Rua Augusta 1030) under Mestre Onça and graduated in Capoeira Regional. Primary teacher after initial training with Paulo Gomes.',
  'Gladson treinou na Associação K-Poeira (Rua Augusta 1030) com Mestre Onça e se formou na Capoeira Regional. Mestre principal após treinamento inicial com Paulo Gomes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gladson' AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Gladson co_founded Federação Paulista de Capoeira (July 14, 1974)
-- FPC is in the groups backlog but not yet imported.
-- Once imported, add:
--   Gladson co_founded Federação Paulista de Capoeira, started 1974-07-14

-- Gladson founded Projete Liberdade Capoeira (1968)
-- Projete Liberdade Capoeira is now in the groups backlog.
-- Once imported, add:
--   Gladson founded Projete Liberdade Capoeira, started 1968

-- ============================================================
-- MET BUT NOT TRAINED UNDER (no statement needed)
-- ============================================================
-- Gladson met Mestre Bimba, Pastinha, Artur Emídio, Djalma Bandeira,
-- Mário Bonfim, and Leopoldina during travels to Bahia and Rio (1960s-70s).
-- These were encounters/meetings, not formal training relationships.
-- No statement generated as "associated_with" requires documented ongoing connection.
