-- ============================================================
-- STATEMENTS FOR: Natanael
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Natanael is the SUBJECT.
-- ============================================================

-- ============================================================
-- PEER ASSOCIATIONS
-- ============================================================

-- NOTE: Natanael's relationship with Limão will be captured through group relationships
-- (both co_founded/teaches_at Academia Quilombo dos Palmares) - no need for associated_with

-- Natanael associated_with Silvestre (came from Bahia together; contemporaries in Santo Amaro SP)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Came from Bahia to São Paulo together; both pioneers of capoeira in Santo Amaro district"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira.jex.com.br, chamadadeangola.fr',
  'Migrated from Bahia to São Paulo together in late 1960s; both contributed to capoeira in Santo Amaro district',
  'Migraram da Bahia para São Paulo juntos no final dos anos 1960; ambos contribuíram para a capoeira no bairro Santo Amaro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Natanael' AND s.apelido_context IS NULL
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Natanael teaches_at Academia Quilombo dos Palmares (SP) - GROUP NOT IN DATASET
--   Taught Capoeira Angola at Quilombo dos Palmares in Santo Amaro district
--   Add to groups-backlog (already there)

-- Natanael associated_with Silvio Acarajé - PERSON NOT IN DATASET
--   Contemporary in Santo Amaro district, São Paulo
--   Add to persons-backlog

-- Natanael associated_with Alemãozinho - PERSON NOT IN DATASET
--   Contemporary in Santo Amaro district, São Paulo
--   Add to persons-backlog

-- Natanael associated_with Robinho Angoleiro - PERSON NOT IN DATASET
--   Contemporary in Santo Amaro district, São Paulo
--   Add to persons-backlog

-- ============================================================
-- TRAINING RELATIONSHIPS (UNCONFIRMED)
-- ============================================================
-- Note: No explicit teacher-student relationship documented for Natanael
-- He likely trained under Mestre Caiçara (since he came with Limão and Silvestre
-- who were both Caiçara students), but this is not confirmed in sources.
-- NOT generating statement without explicit source.
