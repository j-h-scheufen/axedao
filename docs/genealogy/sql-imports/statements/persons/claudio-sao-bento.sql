-- ============================================================
-- STATEMENTS FOR: Cláudio São Bento
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Cláudio São Bento is the SUBJECT.
-- ============================================================

-- Cláudio São Bento student_of Inauá
-- Primary teacher-student relationship in Rio de Janeiro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'IPCB-RJ: "teve como aluno o mestre Inauá, que manteve a sua linhagem formando os mestres King Kong e Cláudio São Bento"',
  E'Trained under Mestre Inauá Mendes in Rio de Janeiro. Inauá was a direct student of Mestre Onça Preta, who brought the Bahian Angola tradition to Rio.',
  E'Treinou com Mestre Inauá Mendes no Rio de Janeiro. Inauá foi aluno direto de Mestre Onça Preta, que trouxe a tradição Angola baiana para o Rio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cláudio São Bento' AND o.apelido = 'Inauá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No additional relationships documented
-- ============================================================
-- Cláudio São Bento's activities beyond his training with Inauá
-- are not documented in available sources. No students, groups
-- founded, or other relationships are known at this time.
-- ============================================================
