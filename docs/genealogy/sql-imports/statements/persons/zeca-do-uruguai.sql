-- ============================================================
-- STATEMENTS FOR: Zeca do Uruguai
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Zeca do Uruguai is the SUBJECT.
--
-- Key relationships:
-- - family_of Gato Preto (first cousin / primo carnal)
-- - family_of Cobrinha Verde (cousin / primo)
-- - associated_with Waldemar (1955 Ribeira roda)
-- - associated_with Bigodinho (1955 Ribeira roda)
--
-- NOTE: Student relationships go in the STUDENT's file, not Zeca's:
-- - Pierrô student_of Zeca - DONE in pierro.sql
-- - Nilton student_of Zeca - DONE in nilton.sql
-- - Cutica trained_under Zeca - DONE in cutica.sql
-- - Canjiquinha trained_under Zeca - DONE in canjiquinha.sql
-- - Gaguinho Preto trained_under Zeca - DONE in gaguinho-preto.sql
-- ============================================================

-- Zeca do Uruguai family_of Gato Preto (first cousin / primo carnal)
-- Both from Santo Amaro da Purificação
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
  NULL, NULL,
  '{"relationship_type": "first cousin"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  'First cousin (primo carnal) - both from Santo Amaro da Purificação',
  'Primo carnal - ambos de Santo Amaro da Purificação'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca do Uruguai' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca do Uruguai family_of Cobrinha Verde (cousin / primo)
-- Both from Santo Amaro da Purificação
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
  NULL, NULL,
  '{"relationship_type": "cousin"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-39',
  'Cousin (primo) - both from Santo Amaro da Purificação',
  'Primo - ambos de Santo Amaro da Purificação'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca do Uruguai' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca do Uruguai associated_with Waldemar (1955 Ribeira roda)
-- Photographed together by Marcel Gautherot at Segunda-Feira Gorda, January 1955
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Photographed playing berimbau together at Segunda-Feira Gorda carnival in Ribeira by Marcel Gautherot"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1955-2',
  'Both played berimbau at the 1955 Ribeira carnival roda; documented in Marcel Gautherot photographs held by Instituto Moreira Salles',
  'Ambos tocaram berimbau na roda de carnaval de 1955 na Ribeira; documentado em fotografias de Marcel Gautherot sob guarda do Instituto Moreira Salles'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca do Uruguai' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca do Uruguai associated_with Bigodinho (1955 Ribeira roda)
-- Photographed together by Marcel Gautherot at Segunda-Feira Gorda, January 1955
-- Note: Bigodinho also known as Gigante
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Photographed playing berimbau together at Segunda-Feira Gorda carnival in Ribeira by Marcel Gautherot"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1955-2',
  'Both played berimbau at the 1955 Ribeira carnival roda; documented in Marcel Gautherot photographs held by Instituto Moreira Salles; Bigodinho also known as Gigante',
  'Ambos tocaram berimbau na roda de carnaval de 1955 na Ribeira; documentado em fotografias de Marcel Gautherot sob guarda do Instituto Moreira Salles; Bigodinho também conhecido como Gigante'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca do Uruguai' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- These relationships require the object entity to be imported first.
-- The SQL should be added to the OBJECT's statements file once created.
--
-- Edinho do Uruguai student_of Zeca do Uruguai - Edinho needs import first

-- ============================================================
-- COMPLETED RELATIONSHIPS (now in respective files)
-- ============================================================
-- Pierrô student_of Zeca do Uruguai - DONE in pierro.sql
-- Nilton student_of Zeca do Uruguai - DONE in nilton.sql
-- Cutica trained_under Zeca do Uruguai - DONE in cutica.sql
-- Gaguinho Preto trained_under Zeca do Uruguai - DONE in gaguinho-preto.sql

-- ============================================================
-- ADDITIONAL COMPLETED RELATIONSHIPS
-- ============================================================
-- In canjiquinha.sql - DONE:
-- Canjiquinha trained_under Zeca do Uruguai (berimbau instruction)
