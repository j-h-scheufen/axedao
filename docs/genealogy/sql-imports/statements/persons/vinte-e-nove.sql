-- ============================================================
-- STATEMENTS FOR: Vinte e Nove
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Vinte e Nove is the SUBJECT.
-- ============================================================

-- Vinte e Nove student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'O Globo newspaper article, February 16, 1982 (archived at velhosmestres.com)',
  'Direct disciple of Mestre Bimba according to 1982 O Globo article listing prominent Regional mestres in Salvador',
  'Discípulo direto de Mestre Bimba segundo artigo do O Globo de 1982 listando mestres Regional proeminentes em Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vinte e Nove' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES - Associated with (1982 O Globo article)
-- ============================================================

-- Vinte e Nove associated_with Itapoan (1982 contemporaries)
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
  '{"association_context": "Both listed as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper article, February 16, 1982 (archived at velhosmestres.com)',
  'Both named as prominent Capoeira Regional mestres in Salvador, direct disciples of Bimba',
  'Ambos nomeados como mestres de Capoeira Regional proeminentes em Salvador, discípulos diretos de Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vinte e Nove' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vinte e Nove associated_with Brás Amansa Brabo (1982 contemporaries)
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
  '{"association_context": "Both listed as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper article, February 16, 1982 (archived at velhosmestres.com)',
  'Both named as prominent Capoeira Regional mestres in Salvador, direct disciples of Bimba',
  'Ambos nomeados como mestres de Capoeira Regional proeminentes em Salvador, discípulos diretos de Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vinte e Nove' AND o.apelido = 'Brás Amansa Brabo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vinte e Nove associated_with Vermelho 27 (1982 contemporaries)
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
  '{"association_context": "Both listed as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper article, February 16, 1982 (archived at velhosmestres.com)',
  'Both named as prominent Capoeira Regional mestres in Salvador, direct disciples of Bimba; both have number-based apelidos',
  'Ambos nomeados como mestres de Capoeira Regional proeminentes em Salvador, discípulos diretos de Bimba; ambos têm apelidos baseados em números'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vinte e Nove' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vinte e Nove associated_with Ezequiel (1982 contemporaries)
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
  '{"association_context": "Both listed as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper article, February 16, 1982 (archived at velhosmestres.com)',
  'Both named as prominent Capoeira Regional mestres in Salvador, direct disciples of Bimba',
  'Ambos nomeados como mestres de Capoeira Regional proeminentes em Salvador, discípulos diretos de Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vinte e Nove' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Vinte e Nove associated_with Medicina - needs import first (in backlog)
-- Vinte e Nove associated_with Banduê - needs import first (in backlog)
-- Vinte e Nove associated_with Capazans - needs import first (in backlog)
-- Vinte e Nove associated_with Hélio Xaréu - needs import first (in backlog)
