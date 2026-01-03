-- ============================================================
-- STATEMENTS FOR: Baiano (Canjiquinha)
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Baiano (Canjiquinha) is the SUBJECT.
-- Uses apelido_context to find the correct Baiano record.
-- ============================================================

-- Baiano (Canjiquinha) student_of Canjiquinha (primary teacher 1955-1962)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com, tribunadoreconcavo.com',
  E'Primary teacher relationship. Baiano began training under Canjiquinha at age 10 in Salvador. Seven-year apprenticeship shaped his entire approach to capoeira.',
  E'Relação de mestre principal. Baiano começou a treinar com Canjiquinha aos 10 anos em Salvador. Aprendizado de sete anos moldou toda sua abordagem à capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) trained_under Bimba (Regional course 1962)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '1962-12-31'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com (via web search results)',
  E'Completed Mestre Bimba''s Regional Capoeira course in Salvador in 1962, expanding his technical repertoire beyond his Angola foundation under Canjiquinha.',
  E'Completou o curso de Capoeira Regional de Mestre Bimba em Salvador em 1962, expandindo seu repertório técnico além de sua base de Angola sob Canjiquinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Virgílio da Fazenda Grande (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres from Canjiquinha/Angola lineage.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários da linhagem Canjiquinha/Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Virgílio da Fazenda Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Fernando de Saubara (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Fernando de Saubara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Boa Gente (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Boa Gente'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Baiano (Canjiquinha) associated_with Nô (VI Rede Capoeira 2025 co-honorees)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2025-01-22'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "VI Rede Capoeira 2025 - Sankofa trophy honorees"}'::jsonb,
  'verified'::genealogy.confidence,
  'tribunadoreconcavo.com',
  E'Both honored as "popular heroes" with Sankofa trophy at VI Rede Capoeira, January 22-25, 2025. Both octogenarian mestres.',
  E'Ambos homenageados como "heróis populares" com troféu Sankofa no VI Rede Capoeira, 22-25 de janeiro de 2025. Ambos mestres octogenários.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Baiano' AND s.apelido_context = 'Canjiquinha' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Baiano (Canjiquinha) founded Associação de Capoeira Engenho
--   Group needs import first - add to groups-backlog.md
--
-- Baiano (Canjiquinha) family_of Grandão (Antonio Marcos dos A. Reis)
--   Son needs import first - add to persons-backlog.md
--   relationship_type: 'parent-child'
