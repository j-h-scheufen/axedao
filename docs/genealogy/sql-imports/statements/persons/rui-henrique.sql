-- ============================================================
-- STATEMENTS FOR: Rui Henrique
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Rui Henrique is the SUBJECT.
-- ============================================================

-- Rui Henrique student_of Zé Maria (1968+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/master-rui-henrique/',
  'Primary teacher. Rui Henrique began training under Mestre Zé Maria in 1968 in the Grupo Império da Tijuca. By 1969 he was already teaching capoeira, and in 1973 received mestre recognition from the Brazilian Boxing Federation.',
  'Professor principal. Rui Henrique começou a treinar sob Mestre Zé Maria em 1968 no Grupo Império da Tijuca. Em 1969 já estava ensinando capoeira, e em 1973 recebeu reconhecimento como mestre pela Confederação Brasileira de Pugilismo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rui Henrique' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Rui Henrique co_founded Grupo IUNA - NEEDS GROUP IMPORT
--   Grupo IUNA (Irmãos Unidos das Nações Africanas), Rio de Janeiro
--   Founded 1975 with Bené and Ziza
--   Note: Different from Grupo Iuna de Capoeira Angola (Belo Horizonte, 1983, Mestre Primo)
--   The co_founded relationships will connect Rui Henrique, Bené, and Ziza through the group

-- Rui Henrique member_of Grupo Império da Tijuca - NEEDS GROUP IMPORT
--   Training group under Mestre Zé Maria
--   Member from 1968

-- Rui Henrique member_of Conselho Superior de Mestres, Confederação Brasileira de Capoeira - NEEDS ORG IMPORT
--   High-level leadership position in national capoeira governance

-- ============================================================
-- NOTES
-- ============================================================
-- COMPLETED RELATIONSHIPS:
-- - Rui Henrique student_of Zé Maria (1968+) - DONE
--
-- NOT NEEDED (connections captured through other means):
-- - Rui Henrique associated_with Canela: Both are students of Zé Maria, so their
--   connection is captured through their respective student_of relationships.
--   "Capoeira brothers" (irmãos de capoeira) = fellow students, NOT biological brothers.
-- - Rui Henrique associated_with Bené/Ziza: IUNA co-founders will be connected
--   through co_founded relationships to the group once imported.
--
-- STILL PENDING (need entity imports first):
-- 1. Grupo IUNA - group entity, needs group import (will connect Rui Henrique, Bené, Ziza)
-- 2. Grupo Império da Tijuca / Grupo Zéma - Zé Maria's group, needs group import
-- 3. Confederação Brasileira de Capoeira - organization entity
--
-- Note on Zé Pedro's roda: Rui Henrique participated in the legendary roda at
-- Zé Pedro's academy (1973-1979), but this is documented in bio/notes rather than
-- as a separate statement, as it represents regular roda participation rather
-- than a formal membership relationship.
