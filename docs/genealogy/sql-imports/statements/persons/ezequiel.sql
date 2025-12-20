-- ============================================================
-- STATEMENTS FOR: Ezequiel
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Ezequiel is the SUBJECT.
-- ============================================================

-- Ezequiel student_of Bimba
-- Primary teacher at Centro de Cultura Física e Luta Regional
-- Graduated with lenço azul (blue handkerchief)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-16; lalaue.com; capoeiranews.com.br',
  'Introduced to Bimba by Mestre Saci in the mid-1960s. Graduated with lenço azul alongside Mestre Galo. Training ended when Bimba left for Goiânia in 1972.',
  'Apresentado a Bimba por Mestre Saci em meados dos anos 1960. Formou-se com lenço azul junto com Mestre Galo. Treinamento terminou quando Bimba partiu para Goiânia em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ezequiel' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ezequiel associated_with Vermelho 27
-- Collaborated to maintain Bimba's academy after 1972
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Co-maintained Mestre Bimba''s academy at Terreiro de Jesus after Bimba left for Goiânia"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-16; lalaue.com',
  'Vermelho 27 purchased Bimba''s academy in 1972, and Ezequiel was chosen to help run the work there. Collaborated until at least the mid-1970s.',
  'Vermelho 27 comprou a academia de Bimba em 1972, e Ezequiel foi escolhido para ajudar a gerenciar o trabalho lá. Colaboraram pelo menos até meados dos anos 1970.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ezequiel' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Ezequiel trained_under Saci
-- Mestre Saci (Josevaldo Lima de Jesus) introduced Ezequiel to Capoeira Regional
-- at Quartel dos Dendezeiros, then brought him to Bimba's academy
-- NEEDS: Mestre Saci import

-- Ezequiel associated_with Galo
-- Luciano Figueiredo (Mestre Galo) - graduated lenço azul together
-- Training companions at Bimba's academy
-- NEEDS: Mestre Galo import

-- ============================================================
-- PERSON-TO-GROUP RELATIONSHIPS
-- ============================================================

-- Ezequiel co_founded Grupo Luanda
-- Founded 1964 with Mestre Franklin
-- NEEDS: Grupo Luanda import

-- Ezequiel member_of Olodum/Olodumaré
-- Folkloric groups he participated in
-- NEEDS: Olodum/Olodumaré import (evaluate if capoeira-relevant)

-- ============================================================
-- NOTE ON STUDENTS
-- ============================================================
-- Student relationships flow FROM student TO teacher, so:
-- - Jelon Vieira student_of Ezequiel → goes in jelon-vieira.sql
-- - Omar student_of Ezequiel → goes in omar.sql
-- - Franklin student_of Ezequiel → goes in franklin.sql
