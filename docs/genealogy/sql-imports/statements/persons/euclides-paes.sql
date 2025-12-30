-- ============================================================
-- STATEMENTS FOR: Euclides Paes
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Euclides Paes is the SUBJECT.
-- ============================================================

-- Euclides Paes associated_with Paulinho Salmon (1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Co-taught Zé Maria at Grupo Capoeira da Guanabara; both taught Pulo do Gato technique"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://centrodomundo.org/mestre-zé-maría',
  'Both mestres taught together at Grupo Capoeira da Guanabara in the 1960s, training Zé Maria and teaching the famous "Pulo do Gato" secret technique. When they discontinued training for work reasons, they authorized Zé Maria to continue teaching in their place.',
  'Ambos os mestres ensinavam juntos no Grupo Capoeira da Guanabara nos anos 1960, treinando Zé Maria e ensinando a famosa técnica secreta do "Pulo do Gato." Quando descontinuaram o treinamento por motivos de trabalho, autorizaram Zé Maria a continuar ensinando em seu lugar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Euclides Paes' AND o.apelido = 'Paulinho Salmon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (lineage claim unverified)
-- ============================================================

-- Euclides Paes trained_under Mário Buscapé - UNVERIFIED CLAIM
--   Centro do Mundo website claims both Paulinho Salmon and Euclides Paes
--   were students of Mário Santos (Mário Buscapé).
--   HOWEVER: This is NOT corroborated by Capoeira History or other Tier 1 sources.
--   Documented students of Mário Buscapé are: Zé Grande, Deraldo, Irineu dos Santos.
--   NOT generating this statement until verified by additional sources.

-- ============================================================
-- PENDING RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Euclides Paes associated_with Grupo Capoeira da Guanabara - NEEDS GROUP IMPORT
--   Rio de Janeiro, 1960s
--   Associated with group alongside Paulinho Salmon
--   Zé Maria graduated as instructor there in 1967

-- ============================================================
-- NOTES
-- ============================================================
-- Zé Maria's trained_under Euclides Paes statement belongs in ze-maria.sql
-- per the ownership rule (subject owns the statement).
--
-- The association with Paulinho Salmon is reciprocal - they taught together
-- at Grupo Capoeira da Guanabara in the 1960s.
--
-- The claimed lineage to Mário Buscapé requires verification before
-- generating a trained_under statement.
-- ============================================================
