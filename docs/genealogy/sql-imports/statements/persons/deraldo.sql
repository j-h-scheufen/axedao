-- ============================================================
-- STATEMENTS FOR: Deraldo
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Deraldo is the SUBJECT.
-- ============================================================

-- ============================================================
-- STUDENT_OF RELATIONSHIP
-- ============================================================

-- Deraldo student_of Mário Buscapé
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Learned capoeira from Mário Buscapé in the early 1950s through his brother Irineu, who was Mário''s first student. Training continued until 1969 when Mário returned to Bahia and Deraldo became co-leader of Bonfim.',
  E'Aprendeu capoeira com Mário Buscapé no início dos anos 1950 através de seu irmão Irineu, que foi o primeiro aluno de Mário. O treinamento continuou até 1969 quando Mário retornou à Bahia e Deraldo tornou-se co-líder do Bonfim.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Deraldo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Mário Buscapé' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CO_FOUNDED RELATIONSHIP
-- ============================================================

-- Deraldo co_founded Associação Cultural Bonfim
-- PENDING: Group not yet in dataset
-- Once Associação Cultural Bonfim is imported, add:
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'co_founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   '1953-01-06'::date, 'exact'::genealogy.date_precision,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
--   'Co-founded with Mário Buscapé, Irineu dos Santos, and brother Zé Grande on January 6, 1953.',
--   'Co-fundou com Mário Buscapé, Irineu dos Santos e o irmão Zé Grande em 6 de janeiro de 1953.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Deraldo' AND o.name = 'Associação Cultural Bonfim'
-- ON CONFLICT ... DO NOTHING;

-- ============================================================
-- LEADS RELATIONSHIP
-- ============================================================

-- Deraldo leads Associação Cultural Bonfim (from 1969)
-- PENDING: Group not yet in dataset
-- Once imported, add leads relationship starting 1969

-- ============================================================
-- FAMILY_OF RELATIONSHIPS
-- ============================================================

-- Deraldo family_of Zé Grande (brother)
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
  'https://capoeirahistory.com/mestre/master-mario-buscape-1934-2021/',
  E'Brothers from the dos Santos family of Bahia. They came to Rio together in the early 1950s and co-led Grupo Bonfim from 1969.',
  E'Irmãos da família dos Santos da Bahia. Vieram juntos para o Rio no início dos anos 1950 e co-lideraram o Grupo Bonfim a partir de 1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Deraldo' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Zé Grande' AND o.apelido_context = 'Bonfim'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATED_WITH RELATIONSHIPS (co-initiators of Roda da Penha)
-- ============================================================

-- Deraldo associated_with Dentinho (co-initiator of Roda da Penha)
-- PENDING: Dentinho not yet in dataset
-- Once Dentinho is imported, add:
-- INSERT INTO genealogy.statements (...)
--   WHERE s.apelido = 'Deraldo' AND o.apelido = 'Dentinho'
--   properties: '{"association_context": "Co-initiators of the Roda da Penha (1960s)"}'

-- Deraldo associated_with Mintirinha (co-initiator of Roda da Penha)
-- PENDING: Mintirinha not yet in dataset
-- Once Mintirinha is imported, add:
-- INSERT INTO genealogy.statements (...)
--   WHERE s.apelido = 'Deraldo' AND o.apelido = 'Mintirinha'
--   properties: '{"association_context": "Co-initiators of the Roda da Penha (1960s)"}'

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Deraldo co_founded Associação Cultural Bonfim - group needs import
-- Deraldo leads Associação Cultural Bonfim (from 1969) - group needs import
-- Deraldo associated_with Dentinho - Dentinho needs import
-- Deraldo associated_with Mintirinha - Mintirinha needs import
-- Deraldo family_of Irineu - Irineu needs import (third brother)
