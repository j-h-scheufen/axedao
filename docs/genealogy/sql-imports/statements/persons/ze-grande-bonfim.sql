-- ============================================================
-- STATEMENTS FOR: Zé Grande (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Zé Grande (Bonfim) is the SUBJECT.
-- Note: This is Zé Grande from the dos Santos family, co-leader of
-- Grupo Bonfim. DISTINCT from José Carlos Cruz (Mestre Grande).
-- ============================================================

-- Zé Grande student_of Mário Buscapé (early 1950s onwards)
-- Primary teacher; Zé Grande was described as Mário's "best disciple"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Mário Buscapé was Zé Grande''s primary teacher. André Lacé described Zé Grande as Mário''s "best disciple." Training began after Mário met the dos Santos brothers (Irineu, Zé Grande, Deraldo) in the early 1950s. The student-teacher relationship continued until 1969 when Mário returned to Bahia.',
  E'Mário Buscapé foi o mestre principal de Zé Grande. André Lacé descreveu Zé Grande como o "melhor discípulo" de Mário. O treinamento começou depois que Mário conheceu os irmãos dos Santos (Irineu, Zé Grande, Deraldo) no início dos anos 1950. A relação mestre-aluno continuou até 1969 quando Mário retornou à Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
  AND o.apelido = 'Mário Buscapé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé Grande co_founded Grupo Bonfim (Associação Cultural Bonfim)
-- PENDING: Group not yet in dataset
-- When added, use: s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
-- INSERT INTO genealogy.statements (...)
-- Started: 1953-01-06 (exact), group founding date

-- Zé Grande leads Grupo Bonfim (from 1969)
-- PENDING: Group not yet in dataset
-- When added, use: s.apelido = 'Zé Grande' AND s.apelido_context = 'Bonfim'
-- INSERT INTO genealogy.statements (...)
-- Started: 1969 (year), when Mário Buscapé returned to Bahia

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Zé Grande family_of Deraldo - brother; needs Deraldo import first
-- Zé Grande family_of Irineu dos Santos - brother; needs Irineu import first

-- Zé Grande co_founded Grupo Bonfim - group needs import first
-- Founded: January 6, 1953 with Mário Buscapé, Irineu, Deraldo

-- Zé Grande leads Grupo Bonfim - group needs import first
-- Started: 1969 when Mário Buscapé returned to Bahia
-- Role: President of the group

-- Zé Grande associated_with Dentinho - co-initiator of Roda da Penha; needs import
-- Context: Both credited as initiators of the Roda da Penha (1960s)

-- Zé Grande associated_with Mintirinha - co-initiator of Roda da Penha; needs import
-- Context: Both credited as initiators of the Roda da Penha (1960s)

-- ============================================================
-- NOTE: Statements where Zé Grande is the OBJECT go in the
-- subject's file, not here. Examples:
-- - Gary student_of Zé Grande → goes in gary-bonfim.sql
-- - Soldado trained_under Zé Grande → goes in soldado.sql
-- ============================================================
