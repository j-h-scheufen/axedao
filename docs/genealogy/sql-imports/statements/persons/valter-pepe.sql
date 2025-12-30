-- ============================================================
-- STATEMENTS FOR: Valter Pepe
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Valter Pepe is the SUBJECT.
-- ============================================================

-- Valter Pepe student_of Leopoldina (primary teacher, ~1957)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'One of Leopoldina''s first three students alongside brother Celso Pepe and Pelé. Training began at Academia Guanabara under an almond tree. Relationship lasted decades - Leopoldina received Valter and Celso at his home in Cidade de Deus in the early 2000s.',
  E'Um dos primeiros três alunos de Leopoldina junto com o irmão Celso Pepe e Pelé. O treinamento começou na Academia Guanabara debaixo de uma amendoeira. O relacionamento durou décadas - Leopoldina recebeu Valter e Celso em sua casa em Cidade de Deus no início dos anos 2000.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valter Pepe' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valter Pepe trained_under Djalma Bandeira (observed classes/rodas ~1957+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'Observed Djalma Bandeira''s classes and rodas at IAPC Community Centre in Olaria from 1957. Like brother Celso, learned the São Bento Grande game by watching Djalma. Less formal than training with Leopoldina.',
  E'Observou as aulas e rodas de Djalma Bandeira no Centro Comunitário do IAPC em Olaria a partir de 1957. Como o irmão Celso, aprendeu o jogo de São Bento Grande observando Djalma. Menos formal que o treinamento com Leopoldina.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valter Pepe' AND o.apelido = 'Djalma Bandeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valter Pepe family_of Celso Pepe (brothers)
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
  'https://capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'Brothers. Trained capoeira together from childhood at IAPC estate in Olaria. Both became mestres. Photographed together at Almir Ribeiro Academy, Tijuca (1962) and visiting Leopoldina at Cidade de Deus (early 2000s).',
  E'Irmãos. Treinaram capoeira juntos desde a infância no conjunto IAPC em Olaria. Ambos se tornaram mestres. Fotografados juntos na Academia Almir Ribeiro, Tijuca (1962) e visitando Leopoldina em Cidade de Deus (início dos anos 2000).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valter Pepe' AND o.apelido = 'Celso Pepe'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valter Pepe associated_with Artur Emídio (lineage context)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "lineage"}'::jsonb, 'likely'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'Lineage connection. Both Leopoldina and Djalma Bandeira (Valter''s teachers) were students of Artur Emídio. Thus Valter learned from two distinct branches of the Artur Emídio lineage.',
  E'Conexão de linhagem. Tanto Leopoldina quanto Djalma Bandeira (mestres de Valter) eram alunos de Artur Emídio. Assim Valter aprendeu de dois ramos distintos da linhagem de Artur Emídio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valter Pepe' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Valter Pepe associated_with Luiz Garcia Filho "Pelé" - training companion; needs import first
-- Note: Pelé (Luiz Garcia Filho) is in backlog with status "?" - unclear if became notable capoeirista
