-- ============================================================
-- STATEMENTS FOR: Barbosa (Duque de Caxias)
-- Generated: 2025-12-30
-- ============================================================
-- Contains all relationships where Barbosa (Caxias) is the SUBJECT.
-- ============================================================

-- Barbosa trained_under Artur Emídio
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/capoeira-carioca-1/',
  'Listed as one of Barbosa''s teachers in Museu da Pessoa interview.',
  'Listado como um dos professores de Barbosa na entrevista do Museu da Pessoa.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Duque de Caxias'
  AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Barbosa founded Associação de Capoeira Zum Zum Zum
-- Note: Group not yet in database - using comment for pending relationship

-- Barbosa associated_with Josias (fellow pioneers of Caxias capoeira academies)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow pioneers of capoeira academies in Duque de Caxias"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.brasildefato.com.br/2018/08/31/em-duque-de-caxias-rj-roda-de-capoeira-completa-45-anos/',
  'Both Barbosa and Josias are credited as the pioneer mestres who ran the first formal capoeira academies in Duque de Caxias.',
  'Barbosa e Josias são creditados como os mestres pioneiros que administraram as primeiras academias formais de capoeira em Duque de Caxias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barbosa' AND s.apelido_context = 'Duque de Caxias'
  AND o.apelido = 'Josias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Barbosa trained_under Valdir Sales - Valdir Sales not in dataset, add to backlog
-- Barbosa founded Associação de Capoeira Zum Zum Zum (1970) - group not in dataset
-- Barbosa founded Grupo de Capoeira Regional (~2000) - group not in dataset
-- Barbosa teaches_at Academia Líder - group/place not in dataset

-- ============================================================
-- REVERSE RELATIONSHIPS (for reference - should be in student files)
-- ============================================================
-- These relationships have Barbosa as the OBJECT and should be added
-- to the respective student's statement files when they are imported:
--
-- Russo (Jonas Rabelo) trained_under Barbosa - 1972-1976
-- Peixe (Itamar da Silva Barbosa) trained_under Barbosa - ~1972
-- Velho (Ulisses Ribeiro de Sousa) trained_under Barbosa
-- Marcão PQD (Marcos Antônio dos Santos) trained_under Barbosa
-- Luizão (Luislan de Oliveira) trained_under Barbosa
