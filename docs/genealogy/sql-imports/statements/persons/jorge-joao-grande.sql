-- ============================================================
-- STATEMENTS FOR: Jorge (João Grande)
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Jorge (João Grande) is the SUBJECT.
-- Uses apelido_context='João Grande' to distinguish from other Jorges.
-- ============================================================

-- Jorge student_of João Grande
-- Primary teacher-student relationship: father trained both sons from childhood
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
  'CapoeiraHub mestres directory (https://www.capoeirahub.net/mestres) - Jurandir Santos profile',
  E'Jorge was trained by his father Mestre João Grande from early childhood. João Grande would wake Jorge and his brother Jurandir early in the morning to train together in their backyard, instilling a deep connection to Capoeira Angola as a way of life rooted in discipline, respect, and tradition. This represents organic, immersive transmission before the formalization of academy systems.',
  E'Jorge foi treinado por seu pai Mestre João Grande desde a primeira infância. João Grande acordava Jorge e seu irmão Jurandir cedo pela manhã para treinar juntos no quintal, incutindo uma conexão profunda com a Capoeira Angola como modo de vida enraizado em disciplina, respeito e tradição. Isso representa transmissão orgânica e imersiva antes da formalização dos sistemas de academias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jorge' AND s.apelido_context = 'João Grande'
  AND o.apelido = 'João Grande' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jorge family_of João Grande (son relationship)
-- Primary family relationship: Jorge is son of João Grande
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
  '{"relationship_type": "son"}'::jsonb, 'likely'::genealogy.confidence,
  'CapoeiraHub mestres directory (https://www.capoeirahub.net/mestres) - Jurandir Santos profile',
  E'Jorge is one of six sons of Mestre João Grande. He and his brother Jurandir trained together from early childhood in backyard sessions with their father.',
  E'Jorge é um dos seis filhos de Mestre João Grande. Ele e seu irmão Jurandir treinaram juntos desde a primeira infância em sessões no quintal com o pai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jorge' AND s.apelido_context = 'João Grande'
  AND o.apelido = 'João Grande' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None - all relationship objects exist in the dataset:
-- - João Grande: exists (docs/genealogy/sql-imports/entities/persons/joao-grande.sql)
-- - Jurandir Santos: exists (docs/genealogy/sql-imports/entities/persons/jurandir-santos.sql)
-- ============================================================
