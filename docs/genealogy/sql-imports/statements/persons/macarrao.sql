-- ============================================================
-- STATEMENTS FOR: Macarrão (Bimba lineage)
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Macarrão (apelido_context='Bimba') is the SUBJECT.
--
-- NOTE: Graduation companions (Camisa, Torpedo, Onça Negra) are documented
-- in bio/notes rather than as separate statements - the context is clear
-- from Mestre Camisa's interview which is the primary source.
-- ============================================================

-- Macarrão student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Mestre Camisa interview (capoeira.online); Multiple sources documenting 1969 graduation',
  E'Trained at Centro de Cultura Física Regional in Salvador during the propagation phase (1967-1973). Graduated as aluno formado in 1969 alongside Camisa, Onça Negra, and Torpedo.',
  E'Treinou no Centro de Cultura Física Regional em Salvador durante a fase de propagação (1967-1973). Formou-se como aluno formado em 1969 junto com Camisa, Onça Negra e Torpedo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Macarrão' AND COALESCE(s.apelido_context, '') = 'Bimba'
  AND o.apelido = 'Bimba' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
