-- ============================================================
-- STATEMENTS FOR: Celso Pepe
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Celso Pepe is the SUBJECT.
-- Objects (Leopoldina, Djalma Bandeira) are already in the dataset.
-- ============================================================

-- Celso Pepe student_of Leopoldina (~1957-1960s)
-- Primary teacher; formal classes under almond tree at Academia Guanabara
-- Learned Angola game and São Bento Pequeno
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
  E'Celso was one of Leopoldina''s first students, training with his brother Walter Hugo Pepe and friend Pelé under an almond tree in the patio of Academia Guanabara. Leopoldina taught him the Angola game and São Bento Pequeno style. Celso continued performing with Leopoldina at events including the 1961 Mangueira parade and 1965 Cacique de Ramos performance.',
  E'Celso foi um dos primeiros alunos de Leopoldina, treinando com seu irmão Walter Hugo Pepe e o amigo Pelé debaixo de uma amendoeira no pátio da Academia Guanabara. Leopoldina ensinou-lhe o jogo de Angola e o estilo São Bento Pequeno. Celso continuou se apresentando com Leopoldina em eventos incluindo o desfile da Mangueira de 1961 e a apresentação no Cacique de Ramos em 1965.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Celso Pepe' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Celso Pepe trained_under Djalma Bandeira (~1957-1960s)
-- Observed classes and rodas; later invited to train at Djalma's academy (~1959-60)
-- Learned São Bento Grande game
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'Celso was a neighbor of Djalma Bandeira at the IAPC housing estate in Olaria. From 1957, he observed Djalma''s Sunday classes and rodas at the IAPC Community Centre. Initially refused due to young age (8 years old), he later was invited by Djalma to train at his academy around 1959-60. Celso credits Djalma with teaching him the São Bento Grande game. They performed together on TV Rio (Carlos Imperial program) and TV Tupi ("Em Guarda").',
  E'Celso era vizinho de Djalma Bandeira no conjunto IAPC em Olaria. Desde 1957, ele observava as aulas e rodas de domingo de Djalma no Centro Comunitário do IAPC. Inicialmente recusado devido à pouca idade (8 anos), foi posteriormente convidado por Djalma para treinar em sua academia por volta de 1959-60. Celso credita a Djalma o ensino do jogo de São Bento Grande. Apresentaram-se juntos na TV Rio (programa de Carlos Imperial) e TV Tupi ("Em Guarda").'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Celso Pepe' AND o.apelido = 'Djalma Bandeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: Touro student_of Celso Pepe - NOW IMPORTED, statement in touro.sql
--
-- Lébio student_of Celso Pepe - Lébio not yet imported
--   Mentioned in connection with Mestre Rui Charuto
--
-- Walter Hugo Pepe associated_with Celso Pepe - Walter Hugo Pepe not yet imported
--   Brother and training companion; photo at Almir Ribeiro Academy 1962
--
-- Luiz Garcia Filho "Pelé" associated_with Celso Pepe - not yet imported
--   Childhood friend and training companion
--
-- Paulo Russo associated_with Celso Pepe - Paulo Russo not yet imported
--   Contramestre and student of Djalma; performed together on TV Tupi "Em Guarda"
-- ============================================================
