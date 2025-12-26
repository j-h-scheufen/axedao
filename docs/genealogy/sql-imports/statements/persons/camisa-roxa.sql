-- ============================================================
-- STATEMENTS FOR: Camisa Roxa
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Camisa Roxa is the SUBJECT.
-- ============================================================

-- Camisa Roxa student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com, capoeira-connection.com',
  E'Entered Mestre Bimba''s academy in Salvador in 1962 or 1963. Considered the best student by his Mestre. Graduated as aluno formado.',
  E'Entrou na academia de Mestre Bimba em Salvador em 1962 ou 1963. Considerado o melhor aluno por seu Mestre. Formou-se como aluno formado.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Pastinha (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com',
  E'Enjoyed playing in the traditional rodas at Mestre Pastinha''s academy. Part of his effort to bridge Regional and Angola styles.',
  E'Gostava de jogar nas rodas tradicionais da academia de Mestre Pastinha. Parte de seu esforço para unir os estilos Regional e Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Waldemar (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com, capoeiradobrasil.com.br',
  E'Played in the rodas of Mestres Waldemar and Traíra on Rua Pero Vaz in Liberdade, Salvador. Highly respected for his posture and knowledge of capoeira fundamentals.',
  E'Jogava nas rodas dos Mestres Waldemar e Traíra na Rua Pero Vaz, na Liberdade, Salvador. Muito respeitado por sua postura e conhecimento dos fundamentos da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa trained_under Traíra (roda participation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'abadarodos.wordpress.com, velhosmestres.com, capoeiradobrasil.com.br',
  E'Played in the rodas of Mestres Waldemar and Traíra on Rua Pero Vaz in Liberdade, Salvador. Highly respected for his posture and knowledge of capoeira fundamentals.',
  E'Jogava nas rodas dos Mestres Waldemar e Traíra na Rua Pero Vaz, na Liberdade, Salvador. Muito respeitado por sua postura e conhecimento dos fundamentos da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND s.apelido_context IS NULL AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camisa Roxa associated_with João Grande (photographed together)
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
  '{"association_context": "photographed together, fellow mestres"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com',
  E'Photographed together at capoeira events. Both are major figures in capoeira history.',
  E'Fotografados juntos em eventos de capoeira. Ambos são figuras importantes na história da capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camisa Roxa' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================
-- Note: family_of relationships for the Carneiro brothers are defined
-- in their respective files (ermival.sql, pedrinho-carneiro.sql, camisa.sql)
-- pointing TO Camisa Roxa as the eldest brother and family patriarch.
-- This avoids redundant bi-directional relationships.

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Camisa Roxa associated_with Mestre Moraes - 1992 Spring Encounter, Moraes is in dataset
-- Camisa Roxa associated_with Mestre Santana - 1992 Spring Encounter, needs import
-- Camisa Roxa associated_with Domingos Campos - co-led Brasil Tropical, needs import
-- Camisa Roxa received_title_from Abadá-Capoeira - Grão-Mestre 1989, group needs import
-- Camisa Roxa leads Abadá-Capoeira (Europe) - group needs import
-- Camisa Roxa founded Brasil Tropical - group needs import
-- Camisa Roxa co_founded Olodum Maré - group needs import
