-- ============================================================
-- STATEMENTS FOR: Manoel Carregador
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Manoel Carregador is the SUBJECT.
-- ============================================================

-- Manoel Carregador associated_with João Pequeno (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1953 Roça do Lobo roda"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-38',
  'Both present at 1953 Roça do Lobo roda witnessed by João Grande',
  'Ambos presentes na roda da Roça do Lobo de 1953 testemunhada por João Grande'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manoel Carregador' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Manoel Carregador associated_with Barbosa (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1953 Roça do Lobo roda"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-38',
  'Both present at 1953 Roça do Lobo roda witnessed by João Grande; both worked as carregadores',
  'Ambos presentes na roda da Roça do Lobo de 1953 testemunhada por João Grande; ambos trabalhavam como carregadores'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manoel Carregador' AND o.apelido = 'Barbosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Manoel Carregador associated_with Menino Gordo da Curva Grande (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1953 Roça do Lobo roda"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-38',
  'Both present at 1953 Roça do Lobo roda witnessed by João Grande',
  'Ambos presentes na roda da Roça do Lobo de 1953 testemunhada por João Grande'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manoel Carregador' AND o.apelido = 'Menino Gordo da Curva Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Manoel Carregador associated_with Cobrinha Verde (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1953 Roça do Lobo roda"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-38',
  'Both present at 1953 Roça do Lobo roda witnessed by João Grande',
  'Ambos presentes na roda da Roça do Lobo de 1953 testemunhada por João Grande'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manoel Carregador' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Manoel Carregador associated_with Tiburcinho (1953 Roça do Lobo roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1953 Roça do Lobo roda"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-38',
  'Both present at 1953 Roça do Lobo roda witnessed by João Grande',
  'Ambos presentes na roda da Roça do Lobo de 1953 testemunhada por João Grande'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Manoel Carregador' AND o.apelido = 'Tiburcinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: No teacher/student relationships documented
-- ============================================================
-- The only documentation of Manoel Carregador is his presence at the
-- 1953 Roça do Lobo roda. No information about his teachers, students,
-- or other relationships has been found.
-- ============================================================
