-- ============================================================
-- STATEMENTS FOR: Marcio (Praia do Sol)
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Marcio (Praia do Sol) is the SUBJECT.
-- ============================================================

-- Marcio (Praia do Sol) student_of Limão
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  '1985-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cncapoeira.nl/en/about-us/',
  'Trained under Mestre Limão in São Paulo during the 1970s-80s. Relationship ended with Limão''s death in 1985.',
  'Treinou com Mestre Limão em São Paulo durante os anos 1970-80. Relacionamento terminou com a morte de Limão em 1985.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marcio' AND s.apelido_context = 'Praia do Sol'
  AND o.apelido = 'Limão' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (group not yet in dataset)
-- ============================================================
-- Marcio (Praia do Sol) leads Grupo Praia do Sol - group needs import first
-- Marcio (Praia do Sol) founded Associação de Capoeira Praia do Sol (Oct 31, 1979) - group needs import first
