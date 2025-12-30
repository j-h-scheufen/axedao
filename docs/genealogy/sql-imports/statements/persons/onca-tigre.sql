-- ============================================================
-- STATEMENTS FOR: Onça Tigre
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Onça Tigre is the SUBJECT.
-- ============================================================

-- Onça Tigre student_of Bimba
-- Described as graduating in Bimba's "primeira turma" (first class), ~1939
-- Became Bimba's "most illustrious student" and served as monitor at CPOR academy
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-01'::date, 'year'::genealogy.date_precision,
  '1939-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://iesambi.org.br/capoeira_arquivos/mestreoncatigre.htm',
  E'Part of Mestre Bimba''s first graduating class. 1939 photograph documents graduation of Maia, Decânio, and Onça Tigre. Described as "o aluno mais ilustre do grande Mestre" (the most illustrious student of the great Master). Served as monitor at CPOR academy under Bimba''s supervision.',
  E'Parte da primeira turma de formatura de Mestre Bimba. Fotografia de 1939 documenta formatura de Maia, Decânio e Onça Tigre. Descrito como "o aluno mais ilustre do grande Mestre." Atuou como monitor na academia do CPOR sob supervisão de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Tigre' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Tigre received_title_from Bimba
-- Received apelido "Onça Tigre" from Mestre Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1939-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"apelido_given": "Onça Tigre"}'::jsonb, 'verified'::genealogy.confidence,
  'https://iesambi.org.br/capoeira_arquivos/mestreoncatigre.htm',
  E'Received apelido "Onça Tigre" (Tiger Jaguar) from Mestre Bimba upon graduation from his first class.',
  E'Recebeu o apelido "Onça Tigre" de Mestre Bimba ao se formar na sua primeira turma.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Tigre' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Onça Tigre received_title_from Mestre Dom Ivan - REVERSED (Dom Ivan received from Onça Tigre)
-- Note: Dom Ivan (Ivan Zacarias Guimarães Gobbo) is a STUDENT of Onça Tigre
-- Relationship should be: Dom Ivan student_of/received_title_from Onça Tigre
-- This goes in DOM IVAN's statements file, not Onça Tigre's

-- Onça Tigre founded Grupo de Capoeira Meia Lua (May 29, 1962) - GROUP NOT IN DATASET
-- Onça Tigre leads AscaDF (Associação de Capoeira do DF) - GROUP NOT IN DATASET
-- Onça Tigre associated_with UNICAPOEIRA - GROUP NOT IN DATASET
-- Onça Tigre associated_with IESAMBI - GROUP NOT IN DATASET
-- Onça Tigre associated_with ASCA - GROUP NOT IN DATASET

-- Onça Tigre family_of Mestre Gato de Silvestre (Julival do Espírito Santo) - PERSON NOT IN DATASET
-- Note: Gato is Onça Tigre's nephew; first contact with capoeira through Onça Tigre in Goiás
-- Relationship: Onça Tigre is uncle (relationship_type: uncle-nephew)
