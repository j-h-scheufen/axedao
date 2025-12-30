-- ============================================================
-- STATEMENTS FOR: Vítor Benedito Lopes
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Vítor Benedito Lopes is the SUBJECT.
-- ============================================================

-- Vítor Benedito Lopes associated_with Bimba (1936 Parque Odeon challenge fight)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Defeated by Bimba in 1936 Parque Odeon challenge - finished with asfixiante/galopante hand strikes", "pt": "Derrotado por Bimba no desafio do Parque Odeon 1936 - finalizado com golpes de mão asfixiante/galopante"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Jornal A Tarde, Mar 16, 1936',
  'Bimba''s use of hand strikes against Vítor sparked controversy about technique rules. Police chief Lúcio Barra Preta allegedly lost money betting on this fight.',
  'O uso de golpes de mão por Bimba contra Vítor gerou controvérsia sobre regras de técnicas. O chefe de polícia Lúcio Barra Preta supostamente perdeu dinheiro apostando nesta luta.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vítor Benedito Lopes' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
