-- ============================================================
-- STATEMENTS FOR: Touro
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Touro is the SUBJECT.
-- ============================================================

-- Touro student_of Celso Pepe (~1957 onwards)
-- Childhood friend; grew up together in Penha neighborhood; primary teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'nossa-tribo.com/mestre-touro/, capoeirahistory.com/mestre/master-celso-pepe-1949/',
  E'Touro''s childhood friend and primary teacher. They grew up together in the Penha neighborhood and began learning capoeira together around 1957. Touro later took over Celso Pepe''s Grupo de Capoeira Cativeiro in 1964.',
  E'Amigo de infância e mestre principal de Touro. Cresceram juntos no bairro da Penha e começaram a aprender capoeira juntos por volta de 1957. Touro mais tarde assumiu o Grupo de Capoeira Cativeiro de Celso Pepe em 1964.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Touro' AND o.apelido = 'Celso Pepe'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Touro family_of Dentinho (brother)
-- PENDING: Dentinho not yet in dataset
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'family_of'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
--   'capoeirahistory.com/mestre/master-dentinho-1952-2011/',
--   'Brothers. Both were born in Cachoeiro do Itapemirim, Espírito Santo. They competed together in the 1973 Brazilian Championship with the Guanabara team and co-led the famous Roda da Penha.',
--   'Irmãos. Ambos nasceram em Cachoeiro do Itapemirim, Espírito Santo. Competiram juntos no Campeonato Brasileiro de 1973 com a equipe Guanabara e co-lideraram a famosa Roda da Penha.'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Touro' AND o.apelido = 'Dentinho'
-- ON CONFLICT DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Touro family_of Dentinho - Dentinho needs import first
-- Touro associated_with Banzo Africano - Banzo Africano needs import first (introduced Touro to Tele Catch)
-- Touro associated_with José de Arimatéia - José de Arimatéia needs import first (NOT capoeira - TV actor)
-- Touro associated_with Carlos de Carvalho - NOT capoeira (politician)

-- ============================================================
-- NOTE: The following relationships have Touro as OBJECT, not SUBJECT
-- They should be recorded in the respective subject's statement files:
-- ============================================================
-- Preto Velho student_of Touro - goes in preto-velho.sql (Preto Velho not yet imported)
-- Toni Vargas trained_under Touro - goes in toni-vargas.sql (Toni Vargas not yet imported)
-- Braga trained_under Touro - goes in braga.sql (Braga not yet imported)
-- Alcino Auê student_of Touro - goes in alcino-aue.sql (Alcino Auê not yet imported)
