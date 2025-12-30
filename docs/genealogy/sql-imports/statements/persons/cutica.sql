-- ============================================================
-- STATEMENTS FOR: Cutica
-- Generated: 2025-12-27
-- Updated: 2025-12-27 (added Ninho relationship)
-- ============================================================
-- Contains all relationships where Cutica is the SUBJECT.
-- ============================================================

-- ============================================================
-- ACTIVE STATEMENTS
-- ============================================================

-- Cutica trained_under Ninho (Ribeira)
-- Context: First teacher of Cutica, rodas at Praça Argolo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com',
  'First teacher of Cutica at Praça Argolo rodas (between Massaranduba and Jardim Cruzeiro). Cutica learned with Ninho alongside his brother Nilton before progressing to Pierrô and Zeca do Uruguai.',
  'Primeiro professor de Cutica nas rodas da Praça Argolo (entre Massaranduba e Jardim Cruzeiro). Cutica aprendeu com Ninho junto com seu irmão Nilton antes de progredir para Pierrô e Zeca do Uruguai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cutica' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Ninho' AND COALESCE(o.apelido_context, '') = 'Ribeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cutica trained_under Zeca do Uruguai
-- Context: Elder master in Uruguai neighborhood (~1km from Massaranduba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  'Cutica trained under Zeca do Uruguai in the Uruguai neighborhood. He and his brother Nilton lived in Massaranduba and would carry their berimbaus the short walk (not even a kilometer) to train with Zeca and Pierrô.',
  'Cutica treinou com Zeca do Uruguai no bairro do Uruguai. Ele e seu irmão Nilton moravam em Massaranduba e carregavam seus berimbaus na curta caminhada (nem um quilômetro) para treinar com Zeca e Pierrô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cutica' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cutica trained_under Pierrô
-- Context: Student of Zeca do Uruguai; taught Cutica and Nilton
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  'Cutica studied with Pierrô in the Uruguai neighborhood, training in the space next to Mestre Zeca''s house where students prepared for street rodas.',
  'Cutica estudou com Pierrô no bairro do Uruguai, treinando no espaço ao lado da casa de Mestre Zeca onde os alunos se preparavam para as rodas de rua.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cutica' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Pierrô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cutica family_of Nilton (brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Younger brother of Nilton; together they trained Mestre Nô and jointly awarded his diploma September 18, 1964',
  'Irmão mais novo de Nilton; juntos treinaram Mestre Nô e concederam conjuntamente seu diploma em 18 de setembro de 1964'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cutica' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Nilton'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Cutica family_of Fernandinho - Fernandinho pending in backlog
--   Context: Brothers; Fernando Olímpio Paes Filho (Mano) is younger (b. 1948)
--   Properties: relationship_type = 'brother'
--   Note: Fernandinho is pending in persons-backlog.md
