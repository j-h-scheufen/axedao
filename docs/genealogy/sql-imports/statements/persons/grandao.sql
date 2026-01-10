-- ============================================================
-- STATEMENTS FOR: Grandão
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Grandão is the SUBJECT.
-- ============================================================

-- Grandão student_of Baiano (Canjiquinha) - primary teacher, father
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com/mestres-cmestres/m-grandao/',
  'Primary teacher from childhood; father and founder of ACE',
  'Mestre principal desde a infância; pai e fundador da ACE'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Grandão' AND o.apelido = 'Baiano' AND o.apelido_context = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Grandão family_of Baiano (Canjiquinha) - son
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
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com/mestres-cmestres/m-grandao/',
  'Biological son of Mestre Baiano (Canjiquinha)',
  'Filho biológico de Mestre Baiano (Canjiquinha)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Grandão' AND o.apelido = 'Baiano' AND o.apelido_context = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Grandão trained_under Cabeludo - at Grupo Porto da Barra, formado 1997
-- NOTE: Cabeludo is in backlog (not yet imported), so this will need to be run after Cabeludo import
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1997-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com/mestres-cmestres/m-grandao/',
  'Trained at Grupo Porto da Barra; became formado 1997; won sequence and balloon competitions',
  'Treinou no Grupo Porto da Barra; tornou-se formado 1997; venceu competições de sequências e balões'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Grandão' AND o.apelido = 'Cabeludo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Grandão received_title_from Cabeludo - formado rank 1997
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1997-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "formado"}}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraengenho.wordpress.com/mestres-cmestres/m-grandao/',
  'Received formado rank at Grupo Porto da Barra',
  'Recebeu graduação de formado no Grupo Porto da Barra'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Grandão' AND o.apelido = 'Cabeludo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Grandão trained_under [ACMB instructors] - trained at ACMB at age 19
--   ACMB is a group (in backlog), leadership was Bamba (in dataset)
--   Unclear if Bamba personally taught Grandão or other instructors
--   Need to add statement to Bamba or ACMB group once clarified
--
-- Grandão regional_coordinator_of Associação de Capoeira Engenho (Bahia/Europe)
--   ACE is in groups backlog - will add when group is imported
--
-- Grandão co_founded Grupo Porto da Barra - mentioned as participating in founding
--   with Cabeludo, but primary founder was Cabeludo (1993)
--   This relationship is uncertain - sources say "participou da fundação"
--   but context suggests he joined later and trained there, not co-founded
