-- ============================================================
-- STATEMENTS FOR: Juvenil
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Juvenil is the SUBJECT.
-- ============================================================

-- Juvenil associated_with Leopoldina
-- Context: Street encounter ~1951-1952 on Morro da Favela; Leopoldina
-- recounted this incident in his testimony to Nestor Capoeira (2005 documentary)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1951-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Street encounter on Morro da Favela where Juvenil sparred with young Leopoldina; Quinzinho intervened when Juvenil''s meia-lua grazed Leopoldina''s head"}'::jsonb,
  'verified'::genealogy.confidence,
  'Leopoldina testimony in documentary "Mestre Leopoldina, a Fina Flor da Malandragem" (2005)',
  'Single documented encounter; Leopoldina recounted this incident to Nestor Capoeira for the 2005 documentary',
  'Único encontro documentado; Leopoldina relatou este incidente a Nestor Capoeira para o documentário de 2005'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Juvenil' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
