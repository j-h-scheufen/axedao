-- ============================================================
-- STATEMENTS FOR: Dois de Ouro
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Dois de Ouro is the SUBJECT.
-- ============================================================

-- Dois de Ouro co_founded Filhos de Angola (Rio 1960)
-- On July 21, 1960, Dois de Ouro co-founded this group with Mucungê,
-- Baleado, Onça Preta, Imagem do Cão, and Roque
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founded Grupo Filhos de Angola in Rio de Janeiro alongside Mucungê, Baleado, Onça Preta, Imagem do Cão, and Roque.',
  'Co-fundou o Grupo Filhos de Angola no Rio de Janeiro junto com Mucungê, Baleado, Onça Preta, Imagem do Cão e Roque.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.name = 'Filhos de Angola'
  AND COALESCE(o.name_context, '') = 'Rio 1960'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro member_of Associação Brasileira de Capoeira Angola
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://esquiva.wordpress.com/mestres/mestre-dois-de-ouro/',
  'Member of the Associação Brasileira de Capoeira Angola in Salvador, Bahia.',
  'Membro da Associação Brasileira de Capoeira Angola em Salvador, Bahia.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.name = 'Associação Brasileira de Capoeira Angola'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Onça Preta (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Onça Preta.',
  'Co-fundador do Grupo Filhos de Angola junto com Onça Preta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Roque (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Roque.',
  'Co-fundador do Grupo Filhos de Angola junto com Roque.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Dois de Ouro associated_with Mucungê (co-founded Filhos de Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-07-21'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-founder of Grupo Filhos de Angola"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-34',
  'Co-founder of Grupo Filhos de Angola alongside Mucungê.',
  'Co-fundador do Grupo Filhos de Angola junto com Mucungê.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Dois de Ouro'
  AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Dois de Ouro associated_with Baleado - needs Baleado import first
-- Dois de Ouro associated_with Imagem do Cão - needs Imagem do Cão import first
-- ============================================================
-- STUDENT RELATIONSHIPS (where Dois de Ouro is the OBJECT)
-- These should go in the student's file, NOT here:
-- ============================================================
-- Bira de Oxóssi student_of Dois de Ouro - goes in bira-de-oxossi.sql
-- Sergio Ferreira trained_under Dois de Ouro - goes in sergio-ferreira.sql
-- Mestre Trovoada [relationship unclear] Dois de Ouro - needs research
