-- ============================================================
-- STATEMENTS FOR: Onça Negra
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Onça Negra is the SUBJECT.
-- ============================================================

-- Onça Negra student_of Bimba
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
  'capoeira-connection.com interview with Mestre Camisa, girafaabadacapoeira.wordpress.com, recantodasletras.com.br',
  E'Onça Negra was a student at Mestre Bimba''s Centro de Cultura Física Regional in Salvador. He graduated as aluno formado in 1969 alongside Camisa, Macarrão, and Torpedo. Training period estimated to start around 1967 based on Camisa''s timeline (joined at age 12 in 1967, graduated at 14 in 1969).',
  E'Onça Negra foi aluno do Centro de Cultura Física Regional de Mestre Bimba em Salvador. Formou-se como aluno formado em 1969 ao lado de Camisa, Macarrão e Torpedo. Período de treinamento estimado a começar por volta de 1967 baseado na cronologia de Camisa (entrou aos 12 anos em 1967, formou-se aos 14 em 1969).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Negra' AND s.apelido_context IS NULL AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Onça Negra associated_with Deputado - musical collaborator (2014 CD), needs import first
-- Onça Negra member_of Grupo Bimba meu Mestre - group needs import first
