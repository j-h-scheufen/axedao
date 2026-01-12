-- ============================================================
-- STATEMENTS FOR: Gato II
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Gato II is the SUBJECT.
-- ============================================================

-- Gato II student_of Gato Preto (father and primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '2002-08-06'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/gatopreto',
  'Gato Preto began teaching his son in 1958 when Sinésio was 8 years old. Father declared him his "successor" to ensure capoeira stays in the family.',
  'Gato Preto começou a ensinar o filho em 1958 quando Sinésio tinha 8 anos. Pai o declarou seu "sucessor" para garantir que a capoeira fique na família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato II' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato II family_of Gato Preto (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-09-07'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/gatopreto',
  'Eldest son of Mestre Gato Preto. Born September 7, 1950.',
  'Filho mais velho de Mestre Gato Preto. Nascido em 7 de setembro de 1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato II' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato II family_of Zeca (elder brother)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-04-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "elder brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/gato-2024',
  'Elder brother of Mestre Zeca (José Souza Góes). They performed together in Brasília in 1969.',
  'Irmão mais velho de Mestre Zeca (José Souza Góes). Apresentaram-se juntos em Brasília em 1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato II' AND o.apelido = 'Zeca' AND o.apelido_context = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Gato II family_of Eutíquio (grandson) and Gato II family_of Oleriano de Góes (great-grandson)
-- relationships removed - lineage can be inferred via:
-- Gato II → son of → Gato Preto → son of → Eutíquio → son of → Oleriano de Góes

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gato II associated_with Brasil Tropical - toured Europe 1970s (group not yet imported)
-- Gato II leads ASSEBA - administrative coordinator (organization not in genealogy scope)
-- Gato II teaches_at Núcleo de Artes Afro-Brasileiras da USP (group not yet imported)
