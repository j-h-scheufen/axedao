-- ============================================================
-- STATEMENTS FOR: Paizinho (Teodoro Ramos)
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Paizinho is the SUBJECT.
-- Relationships where Paizinho is the OBJECT belong in the
-- subject's file (e.g., artur-emidio.sql for Artur's student_of).
-- ============================================================

-- Paizinho student_of Neném (Itabuna)
-- Primary teacher; African-born capoeirista who taught in Itabuna
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,  -- Started unknown
  NULL, NULL,  -- Ended unknown
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-69; capoeirahistory.com/mestre/master-artur-emidio-1930-2011/',
  E'Paizinho was a disciple of Mestre Neném, described as "an African" or "of African origin". The training likely took place in Itabuna in the late 1800s/early 1900s, during the criminalization period. Neném represents the Layer Zero anchor of this southern Bahia lineage.',
  E'Paizinho foi discípulo de Mestre Neném, descrito como "um africano" ou "de origem africana". O treinamento provavelmente ocorreu em Itabuna no final de 1800/início de 1900, durante o período de criminalização. Neném representa a âncora da Camada Zero desta linhagem do sul da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paizinho' AND COALESCE(s.apelido_context, '') = ''
  AND o.apelido = 'Neném' AND COALESCE(o.apelido_context, '') = 'Itabuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: The following relationship has the OBJECT in the dataset:
-- Artur Emídio student_of Paizinho
-- This statement belongs in artur-emidio.sql (subject's file).
-- Verified that artur-emidio.sql exists and contains this relationship.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None - all known relationships have objects in dataset:
-- - Neném (Itabuna) - EXISTS (nenem-itabuna.sql)
-- - Artur Emídio - EXISTS (artur-emidio.sql) - relationship in his file
-- ============================================================
