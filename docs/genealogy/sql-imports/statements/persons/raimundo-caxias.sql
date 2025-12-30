-- ============================================================
-- STATEMENTS FOR: Raimundo (Duque de Caxias)
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Raimundo (Duque de Caxias) is the SUBJECT.
-- Uses apelido_context to distinguish from other Raimundos.
-- ============================================================

-- Raimundo trained_under Josias da Silva
-- Note: Sources are ambiguous - some describe Raimundo as Josias's training partner,
-- others list him among Josias's students. Using trained_under with uncertain confidence.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'uncertain'::genealogy.confidence,
  'acaz.site/historicoacaz',
  'Sources list Raimundo among Josias''s students (alongside Canela, Butt, Crispin, Irani). However, other sources describe Josias and Raimundo as training partners who started together. May have formalized under Josias''s association after initial peer training.',
  'Fontes listam Raimundo entre os alunos de Josias (junto com Canela, Butt, Crispin, Irani). Porém, outras fontes descrevem Josias e Raimundo como parceiros de treino que começaram juntos. Pode ter se formalizado sob a associação de Josias após treino inicial como pares.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Raimundo' AND s.apelido_context = 'Duque de Caxias'
  AND o.apelido = 'Josias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- No additional pending relationships identified
