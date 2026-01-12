-- ============================================================
-- STATEMENTS FOR: Menino Gordo da Curva Grande
-- Generated: 2025-12-21
-- Updated: 2026-01-11 - Removed redundant co-teacher associations
-- ============================================================
-- Contains all relationships where Menino Gordo da Curva Grande is the SUBJECT.
-- Note: Gaguinho Preto's student_of relationship goes in gaguinho-preto.sql
--
-- Co-teacher relationships with Roque and Vitor Agaú are NOT generated
-- as explicit associated_with statements because they are implicit from
-- Gaguinho Preto having student_of to all three teachers.
-- ============================================================

-- Menino Gordo associated_with João Pequeno (Roça do Lobo 1953)
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
  '{"association_context": "Present together at Roça do Lobo roda witnessed by João Grande"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38',
  'Both present at the 1953 Roça do Lobo roda that João Grande witnessed upon arriving in Salvador',
  'Ambos presentes na roda da Roça do Lobo de 1953 que João Grande testemunhou ao chegar em Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Menino Gordo' AND s.apelido_context = 'Curva Grande'
  AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Menino Gordo associated_with Barbosa (Roça do Lobo 1953)
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
  '{"association_context": "Present together at Roça do Lobo roda witnessed by João Grande"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38',
  'Both present at the 1953 Roça do Lobo roda that João Grande witnessed',
  'Ambos presentes na roda da Roça do Lobo de 1953 que João Grande testemunhou'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Menino Gordo' AND s.apelido_context = 'Curva Grande'
  AND o.apelido = 'Barbosa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Menino Gordo associated_with Cobrinha Verde (Roça do Lobo 1953)
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
  '{"association_context": "Present together at Roça do Lobo roda witnessed by João Grande"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-38',
  'Both present at the 1953 Roça do Lobo roda that João Grande witnessed',
  'Ambos presentes na roda da Roça do Lobo de 1953 que João Grande testemunhou'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Menino Gordo' AND s.apelido_context = 'Curva Grande'
  AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Menino Gordo associated_with Tiburcinho (1953 Roça do Lobo roda)
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
  '{"association_context": "1953 Roça do Lobo roda witnessed by João Grande"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/meninogordo',
  E'Both present at the historic 1953 Roça do Lobo roda that João Grande witnessed.',
  E'Ambos presentes na histórica roda da Roça do Lobo de 1953 que João Grande testemunhou.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Menino Gordo' AND s.apelido_context = 'Curva Grande'
  AND o.apelido = 'Tiburcinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Menino Gordo associated_with Manoel Carregador - needs import first (present at 1953 Roça do Lobo roda)
-- NOTE: Menino Gordo/Gigante "parceiros" relationship is vague - documented in bio, not as formal association
-- ============================================================
