-- ============================================================
-- STATEMENTS FOR: Formiga
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Formiga is the SUBJECT.
-- ============================================================

-- Formiga student_of Bimba (his father, primary teacher)
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
  '1967-06-01'::date, 'month'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Capoeira Connection, Fundação Mestre Bimba',
  'Trained under his father at Centro de Cultura Física Regional in Salvador; graduated June 1967 alongside half-brother Nenel',
  'Treinou com seu pai no Centro de Cultura Física Regional em Salvador; formou-se em junho de 1967 junto com o meio-irmão Nenel'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga family_of Bimba (son)
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
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Fundação Mestre Bimba, Wikipedia',
  'Son of Mestre Bimba with Dona Nair; one of 13 children',
  'Filho de Mestre Bimba com Dona Nair; um de 13 filhos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga family_of Nenel (half-brother)
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
  '{"relationship_type": "half-brother"}'::jsonb, 'verified'::genealogy.confidence,
  'Portal Capoeira, Fundação Mestre Bimba',
  'Half-brothers; different mothers (Formiga: Dona Nair; Nenel: Berenice da Conceição Nascimento); same father (Bimba); graduated together June 1967; taught together in Goiânia 1973-1974',
  'Meios-irmãos; mães diferentes (Formiga: Dona Nair; Nenel: Berenice da Conceição Nascimento); mesmo pai (Bimba); formaram-se juntos em junho de 1967; ensinaram juntos em Goiânia 1973-1974'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Formiga' AND o.apelido = 'Nenel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Formiga associated_with Frede Abreu (collaboration on UFBA Honoris Causa speech)
-- NOTE: Frede Abreu is not in dataset yet - adding to pending relationships

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Formiga associated_with Frede Abreu - Co-wrote UFBA Honoris Causa speech (1996); needs import first
-- Formiga family_of Mestre Luís (Luiz Lopes Machado / Melodia) - Full brother (same mother Dona Nair); needs import first
-- Formiga co_founded FUMEB (Fundação Mestre Bimba) - Mentor/co-founder alongside Nenel (1994); group needs import first
