-- ============================================================
-- STATEMENTS FOR: Nilton
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Nilton is the SUBJECT.
-- ============================================================

-- Nilton student_of Ninho (Ribeira)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'First teacher; rodas at Praça Argolo between Massaranduba and Jardim Cruzeiro',
  'Primeiro mestre; rodas na Praça Argolo entre Massaranduba e Jardim Cruzeiro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Ninho' AND o.apelido_context = 'Ribeira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton student_of Pierrô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Trained with brother Cutica under Pierrô before progressing to Zeca do Uruguai',
  'Treinou com irmão Cutica sob Pierrô antes de progredir para Zeca do Uruguai'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Pierrô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton student_of Zeca do Uruguai
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Elder master in Uruguai neighborhood; taught at space beside his house less than 1km from Massaranduba',
  'Mestre mais velho no bairro do Uruguai; ensinava em espaço ao lado de sua casa a menos de 1km de Massaranduba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton family_of Cutica (brother)
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
  'Older brother; together they trained Mestre Nô and jointly awarded his diploma September 18, 1964',
  'Irmão mais velho; juntos treinaram Mestre Nô e concederam conjuntamente seu diploma em 18 de setembro de 1964'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Cutica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton associated_with Pierrô (co-organizer of rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "co-organizer of street rodas in Lower City"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Organized and commanded many capoeira angola rodas together in Salvador''s Lower City streets',
  'Organizou e comandou muitas rodas de capoeira angola juntos nas ruas da Cidade Baixa de Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Pierrô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton associated_with Zeca do Uruguai (co-organizer of rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "co-organizer of street rodas in Lower City"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Organized and commanded many capoeira angola rodas together in Salvador''s Lower City streets',
  'Organizou e comandou muitas rodas de capoeira angola juntos nas ruas da Cidade Baixa de Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nilton family_of Fernandinho (younger brother)
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
  '2001-01-01'::date, 'year'::genealogy.date_precision,
  '{"relationship_type": "elder brother"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Younger brother; Nilton trained Fernandinho before he moved to Rio and became contra-mestre under Caiçara',
  'Irmão mais novo; Nilton treinou Fernandinho antes de ele mudar-se para o Rio e tornar-se contra-mestre de Caiçara'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nilton' AND s.apelido_context IS NULL
  AND o.apelido = 'Fernandinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (none remaining)
-- ============================================================
