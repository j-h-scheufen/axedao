-- ============================================================
-- STATEMENTS FOR: Capazans
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Capazans is the SUBJECT.
-- ============================================================

-- Capazans student_of Bimba (likely - based on 1982 O Globo context)
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
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'The 1982 O Globo article lists Capazans among Regional mestres who were "almost all direct disciples of the legendary Bimba". Without additional sources confirming direct training, using "likely" confidence.',
  E'O artigo do O Globo de 1982 lista Capazans entre os mestres de Regional que eram "quase todos discípulos diretos do lendário Bimba". Sem fontes adicionais confirmando treinamento direto, usando confiança "likely".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (associated_with)
-- These are mestres listed together in the 1982 O Globo article
-- as prominent Regional figures in Salvador.
-- ============================================================

-- Capazans associated_with Itapoan
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Vermelho 27
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Ezequiel
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Brás Amansa Brabo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Capazans'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Vinte e Nove
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Vinte e Nove'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Medicina
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Medicina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Capazans associated_with Banduê
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'O Globo newspaper (February 16, 1982) via velhosmestres.com',
  E'Both listed among prominent Capoeira Regional mestres in Salvador in 1982 O Globo survey.',
  E'Ambos listados entre os mestres de Capoeira Regional proeminentes em Salvador na pesquisa do O Globo de 1982.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Capazans' AND o.apelido = 'Banduê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Capazans associated_with Hélio Xaréu - needs import first (pending in backlog)
