-- ============================================================
-- STATEMENTS FOR: Lua de Bobó
-- Generated: 2025-01-02
-- ============================================================
-- Contains all relationships where Lua de Bobó is the SUBJECT.
-- ============================================================

-- Lua de Bobó student_of Bobô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'approximate'::genealogy.date_precision,
  '1994-07-08'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'http://meninodearembepe.org/site/mestre.php',
  'Primary teacher for 20+ years. Met Bobô around age 15 (circa 1965). Trained at Academia de Capoeira Angola Cinco Estrelas, Dique Pequeno do Tororó, Salvador. Relationship ended with Bobô''s death.',
  'Professor principal por mais de 20 anos. Conheceu Bobô por volta dos 15 anos (circa 1965). Treinou na Academia de Capoeira Angola Cinco Estrelas, Dique Pequeno do Tororó, Salvador. Relação terminou com a morte de Bobô.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua de Bobó received_title_from Bobô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1987-04-05'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "Formatura", "location": "Clube Regatas Vasco da Gama, Dique do Tororó, Salvador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6',
  'Graduated as one of Bobô''s first two mestres alongside Môa do Katendê. Evaluation panel: João Grande, João Pequeno, Vermelho (27), Dona Romélia.',
  'Formado como um dos dois primeiros mestres de Bobô junto com Môa do Katendê. Banca avaliadora: João Grande, João Pequeno, Vermelho (27), Dona Romélia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Bobô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lua de Bobó associated_with Môa do Katendê
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '2018-10-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow_students_same_teacher"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6',
  'Both trained under Mestre Bobô at Academia de Capoeira Angola Cinco Estrelas. Graduated together as Bobô''s first mestres on April 5, 1987.',
  'Ambos treinaram com Mestre Bobô na Academia de Capoeira Angola Cinco Estrelas. Formados juntos como os primeiros mestres de Bobô em 5 de abril de 1987.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lua de Bobó' AND o.apelido = 'Môa do Katendê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Lua de Bobó founded GCAMA (Grupo de Capoeira Angola Menino de Arembepe) - group import pending
-- Lua de Bobó member_of Academia de Capoeira Angola Cinco Estrelas - group import pending
-- Lua de Bobó associated_with Dona Romélia - person import pending (evaluation panel)
-- Lua de Bobó associated_with Mestre Zequinha - person import pending (student)
-- Lua de Bobó associated_with Mestre Malhado (son) - person import pending (student/son)
-- Lua de Bobó associated_with Carlinhos Ferraz - person import pending (guides his group)
-- Lua de Bobó associated_with Eliseu Valverde - person import pending (student, no longer active)
