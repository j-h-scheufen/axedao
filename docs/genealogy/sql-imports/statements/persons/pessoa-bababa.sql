-- ============================================================
-- STATEMENTS FOR: Pessoa Bababá
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Pessoa Bababá is the SUBJECT.
--
-- RELATIONSHIPS:
-- 1. Pessoa Bababá student_of Pastinha (timing unknown)
--
-- INVERSE RELATIONSHIPS (documented in other files):
-- - Bola Sete trained_under Pessoa Bababá (1968-1969) → in bola-sete.sql
-- ============================================================

-- Pessoa Bababá student_of Pastinha
-- Training at CECA, timing unknown but before 1968
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
  'Mestre Bola Sete interviews (Capoeira Connection 2011, Portal Capoeira); "Mestres e capoeiras famosos da Bahia" (Pedro Abib, EDUFBA)',
  E'Pessoa Bababá was documented as a disciple of Mestre Pastinha. The exact timing of his training at CECA is unknown, but he must have completed sufficient training to be teaching by 1968 when he instructed Bola Sete. He is listed among Pastinha''s Additional Named Students (as "Pessoa Bá-Bá-Bá") in Pastinha documentation.',
  E'Pessoa Bababá foi documentado como discípulo de Mestre Pastinha. O período exato de seu treinamento no CECA é desconhecido, mas ele deve ter completado treinamento suficiente para estar ensinando em 1968 quando instruiu Bola Sete. Ele está listado entre os Alunos Adicionais de Pastinha (como "Pessoa Bá-Bá-Bá") na documentação de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pessoa Bababá' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- INVERSE RELATIONSHIP (to be added to bola-sete.sql)
-- ============================================================
-- The relationship "Bola Sete trained_under Pessoa Bababá" should
-- be added to bola-sete.sql since Bola Sete is the subject.
-- This is documented below for reference but will be added to
-- the correct file.
-- ============================================================
