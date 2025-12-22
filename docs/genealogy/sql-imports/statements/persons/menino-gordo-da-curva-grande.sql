-- ============================================================
-- STATEMENTS FOR: Menino Gordo da Curva Grande
-- Generated: 2025-12-21
-- ============================================================
-- Contains all relationships where Menino Gordo da Curva Grande is the SUBJECT.
-- Note: Gaguinho Preto's student_of relationship goes in gaguinho-preto.sql
-- ============================================================

-- Menino Gordo associated_with Vitor Agaú (co-teachers in Curva Grande)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-teachers of Gaguinho Preto in Curva Grande neighborhood"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'Taught Gaguinho Preto together with Vitor Agaú and Roque in Curva Grande from ~1938',
  'Ensinou Gaguinho Preto junto com Vitor Agaú e Roque na Curva Grande a partir de ~1938'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Menino Gordo' AND s.apelido_context = 'Curva Grande'
  AND o.apelido = 'Vitor Agaú'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Menino Gordo associated_with Roque (Curva Grande) - needs import first (DISTINCT from Mestre Roque Mendes dos Santos)
-- Menino Gordo associated_with Mestre Gigante - needs import first (often confused because looked similar, "parceiros")
-- Menino Gordo associated_with Tiburcinho - needs import first (present at 1953 Roça do Lobo roda)
-- Menino Gordo associated_with Manoel Carregador - needs import first (present at 1953 Roça do Lobo roda)
--
-- Note: Gaguinho Preto's student_of relationship will go in gaguinho-preto.sql when imported:
-- Gaguinho Preto student_of Menino Gordo (Curva Grande) - from age 4 (~1938)
-- ============================================================
