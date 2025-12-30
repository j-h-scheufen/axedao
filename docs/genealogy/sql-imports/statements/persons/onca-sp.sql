-- ============================================================
-- STATEMENTS FOR: Onça (São Paulo)
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Onça (SP) is the SUBJECT.
-- ============================================================

-- Onça (SP) student_of Bimba
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
  'Multiple sources (journals.openedition.org/pontourbe/748, maltabrasil.de/mestre-gladson)',
  'Onça was a certified disciple of Mestre Bimba who learned the fundamentals of Capoeira Regional. Exact training dates unknown.',
  'Onça foi discípulo certificado de Mestre Bimba com quem aprendeu os fundamentos da Capoeira Regional. Datas exatas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça' AND s.apelido_context = 'São Paulo'
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Onça (SP) co_founded K-Poeira (1968) - group not yet in dataset
-- Onça (SP) founded Federação Paulista de Capoeira (1974) - group not yet in dataset
-- Onça (SP) associated_with Acordeon (co-founded K-Poeira) - Acordeon exists, can add when K-Poeira exists
-- Onça (SP) associated_with "Grupo dos Nove" members - several not in dataset

-- ============================================================
-- NOTE: The following relationships have Onça as OBJECT
-- They should be in the SUBJECT's statement file:
-- ============================================================
-- Gladson student_of Onça (SP) → goes in gladson.sql
-- Acordeon co_founded K-Poeira (with Onça) → goes in acordeon.sql when K-Poeira exists
