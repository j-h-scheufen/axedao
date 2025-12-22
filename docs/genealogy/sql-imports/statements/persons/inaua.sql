-- ============================================================
-- STATEMENTS FOR: Inauá
-- Generated: 2025-12-22
-- ============================================================
-- Contains all relationships where Inauá is the SUBJECT.
-- ============================================================

-- Inauá student_of Onça Preta
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
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-34; ipcb-rj.com.br',
  E'Trained under Onça Preta in Ilha do Governador, Rio de Janeiro, after Onça Preta moved from Salvador in 1959. Onça Preta lived on Ilha do Governador while working at Hospital de Puericultura.',
  E'Treinou com Onça Preta na Ilha do Governador, Rio de Janeiro, após Onça Preta se mudar de Salvador em 1959. Onça Preta morava na Ilha do Governador enquanto trabalhava no Hospital de Puericultura.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Inauá' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have subjects that need to be imported first.
-- These will be in the OBJECT's statement files when those entities are created:
--
-- King Kong student_of Inauá - King Kong needs import first (backlog)
-- Cláudio São Bento student_of Inauá - Cláudio São Bento needs import first (backlog)
