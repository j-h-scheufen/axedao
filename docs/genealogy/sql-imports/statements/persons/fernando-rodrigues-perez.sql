-- ============================================================
-- STATEMENTS FOR: Fernando Rodrigues Perez
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Fernando Rodrigues Perez (Perez) is the SUBJECT.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Perez student_of Bimba
-- Confirmed: Perez trained under Mestre Bimba and represented his academy in 1949
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://nossa-tribo.com/mestre-sinhozinho/; Globo Esportivo April 7, 1949',
  'Fernando Rodrigues Perez trained at Mestre Bimba''s academy and represented it in the 1949 challenge against Sinhozinho''s school. The Globo Esportivo newspaper identified him as "capoeira de Mestre Bimba".',
  'Fernando Rodrigues Perez treinou na academia de Mestre Bimba e a representou no desafio de 1949 contra a escola de Sinhozinho. O jornal Globo Esportivo o identificou como "capoeira de Mestre Bimba".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perez associated_with Jurandir (Bimba 1949) - fellow Bimba students at 1949 challenge
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-04-07'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow Bimba students selected to represent Capoeira Regional at the 1949 challenge against Sinhozinho''s school"}'::jsonb,
  'verified'::genealogy.confidence,
  'Globo Esportivo April 7, 1949; nossa-tribo.com',
  'Both Perez and Jurandir were selected by Mestre Bimba to represent Capoeira Regional at the April 7, 1949 challenge against Sinhozinho''s school at Estádio Carioca.',
  'Tanto Perez quanto Jurandir foram selecionados por Mestre Bimba para representar a Capoeira Regional no desafio de 7 de abril de 1949 contra a escola de Sinhozinho no Estádio Carioca.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Jurandir' AND o.apelido_context = 'Bimba 1949'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perez associated_with Rudolf Hermanny - opponents at 1949 challenge
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-04-07'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Opponents at 1949 Capoeira Challenge; Hermanny (Sinhozinho school) defeated Perez (Bimba school) in 2 minutes"}'::jsonb,
  'verified'::genealogy.confidence,
  'Globo Esportivo April 7, 1949; nossa-tribo.com',
  'Rudolf Hermanny defeated Fernando Rodrigues Perez in approximately 2 minutes at the April 7, 1949 challenge at Estádio Carioca. Perez suffered an arm injury from a kick.',
  'Rudolf Hermanny derrotou Fernando Rodrigues Perez em aproximadamente 2 minutos no desafio de 7 de abril de 1949 no Estádio Carioca. Perez sofreu uma lesão no braço por um chute.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perez' AND s.apelido_context IS NULL
  AND o.apelido = 'Rudolf Hermanny'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
