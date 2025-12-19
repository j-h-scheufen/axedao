-- ============================================================
-- STATEMENTS FOR: Piroca
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Piroca is the SUBJECT.
-- ============================================================

-- Piroca family_of Pedro Porreta (brother relationship)
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
  '{"relationship_type": "brother"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde (Dec 14, 1920); Mestres e capoeiras famosos da Bahia (SciELO)',
  'Brothers who controlled Baixa dos Sapateiros together; known as "Os donos do quarteirão" (The owners of the block)',
  'Irmãos que controlavam a Baixa dos Sapateiros juntos; conhecidos como "Os donos do quarteirão"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Piroca' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Piroca associated_with Pedro Porreta (street confrontation companions)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-12-14'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Participated together in attack on Guruxinha in Taboão"}'::jsonb,
  'verified'::genealogy.confidence,
  'A Tarde (Dec 14, 1920); velhosmestres.com',
  'Piroca assisted brother Pedro Porreta in razor attack on Guruxinha (José Batista da Cruz) on December 14, 1920; victim died from injuries',
  'Piroca auxiliou o irmão Pedro Porreta em ataque com navalha a Guruxinha (José Batista da Cruz) em 14 de dezembro de 1920; vítima morreu dos ferimentos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Piroca' AND o.apelido = 'Pedro Porreta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified - Guruxinha (victim) is not a capoeirista to import
