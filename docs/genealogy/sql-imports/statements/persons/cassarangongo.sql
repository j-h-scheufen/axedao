-- ============================================================
-- STATEMENTS FOR: Cassarangongo
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Cassarangongo is the SUBJECT.
-- ============================================================

-- Cassarangongo associated_with Espinho Remoso
-- (They met at Engenho da Pindoba, worked together, played capoeira together,
-- and became great friends - reuniting later in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Training companions and coworkers at Engenho da Pindoba; played capoeira together after work; reunited in Salvador as great friends"}'::jsonb,
  'verified'::genealogy.confidence,
  'Wikipedia PT - Mestre Espinho Remoso',
  'Met at Engenho da Pindoba (between Santo Amaro and Candeias), worked together in sugarcane fields, played capoeira after work, became great friends, later reunited in Salvador.',
  'Conheceram-se no Engenho da Pindoba (entre Santo Amaro e Candeias), trabalharam juntos nos canaviais, jogavam capoeira após o trabalho, tornaram-se grandes amigos, depois se reencontraram em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cassarangongo' AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: If the "Elói" at Largo do Tanque is confirmed as Cassarangongo,
-- the following relationships would be added:
--
-- Cassarangongo associated_with Aberrê (Largo do Tanque ~1938)
-- Cassarangongo associated_with Bimba (Largo do Tanque ~1938)
-- Cassarangongo associated_with Pastinha (Largo do Tanque ~1938)
-- Cassarangongo associated_with Siri de Mangue (Largo do Tanque ~1938)
--
-- These are NOT added because the identification of "Elói" at Largo do
-- Tanque with Cassarangongo (Antônio Elói dos Santos) is UNCERTAIN.
