-- ============================================================
-- STATEMENTS FOR: Pedrinho (Carneiro)
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Pedrinho (Carneiro) is the SUBJECT.
-- ============================================================

-- Pedrinho (Carneiro) student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, jogosfemininosabada.wordpress.com, ABADÁ sources',
  E'Trained at Mestre Bimba''s academy in Salvador alongside brothers Ermival and José Tadeu (Camisa). Graduated as aluno formado. Start date estimated mid-1960s based on family timeline.',
  E'Treinou na academia de Mestre Bimba em Salvador junto com os irmãos Ermival e José Tadeu (Camisa). Formou-se como aluno formado. Data de início estimada em meados dos anos 1960 com base na cronologia familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedrinho' AND s.apelido_context = 'Carneiro' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pedrinho (Carneiro) family_of Camisa Roxa
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, jogosfemininosabada.wordpress.com, velhosmestres.com',
  E'Younger brother of Camisa Roxa. Both were born at Fazenda Estiva, Jacobina, Bahia.',
  E'Irmão mais novo de Camisa Roxa. Ambos nasceram na Fazenda Estiva, Jacobina, Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pedrinho' AND s.apelido_context = 'Carneiro' AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Pedrinho's family connections to Ermival and Camisa are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- All four brothers point to Camisa Roxa as eldest brother and family patriarch.
