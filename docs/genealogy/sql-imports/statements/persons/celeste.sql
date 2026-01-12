-- ============================================================
-- STATEMENTS FOR: Celeste
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Celeste is the SUBJECT.
-- ============================================================

-- Celeste student_of Pastinha
-- Confirmed via Mestre Roberval's testimony: "M. Celeste da academia do M. Pastinha"
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
  'https://mestreroberval.bandcamp.com/; https://nossa-tribo.com/mestre-roberval/',
  E'Mestre Roberval explicitly states: "Eu também conhecí o M. Celeste da academia do M. Pastinha" (I also met M. Celeste from M. Pastinha''s academy). This confirms Celeste trained at Pastinha''s Centro Esportivo de Capoeira Angola (CECA). Confidence: likely because direct testimony exists but no documentation of formal graduation.',
  E'Mestre Roberval afirma explicitamente: "Eu também conhecí o M. Celeste da academia do M. Pastinha." Isso confirma que Celeste treinou no Centro Esportivo de Capoeira Angola (CECA) de Pastinha. Confiança: provável porque existe testemunho direto mas sem documentação de graduação formal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Celeste' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Celeste and Alfredo co-taught Roberval, but the teaching
-- relationships belong in Roberval's file (Roberval trained_under Celeste,
-- Roberval trained_under Alfredo). Celeste and Canjiquinha are listed
-- together as "great masters of Cosme de Farias neighborhood" but this is
-- a category listing documented in bio/notes only.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationships have Celeste as OBJECT (not subject).
-- Per ownership rules, they belong in the SUBJECT's file.
--
-- Roberval (Espírito Santo) trained_under Celeste
--   → Goes in roberval-espirito-santo.sql when Roberval is imported
--   → Note: This is Roberval do Espírito Santo (b. 1964, Salvador), NOT Roberval
--     Serejo (1936-1971, Maranhão) who is already in the dataset
--   → Started ~1978 when Roberval was 14
--
-- Laércio - encountered Celeste at Friday rodas at D. João Pedro dos Santos school
--   → Laércio IS in dataset but this is not a formal training relationship
--   → Laércio's primary teachers were Caiçara and the GCAP mestres
--   → Documented in bio/notes only, not as a statement
--
-- ============================================================
-- NOTE: Manoel Rezendo (student of Bimba) participated in same Friday rodas
-- as Celeste but no direct documented relationship - not generating statement.
-- ============================================================
