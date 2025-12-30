-- ============================================================
-- STATEMENTS FOR: Damião
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Damião is the SUBJECT.
-- ============================================================

-- Damião student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1945-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources confirm Damião trained under Bimba from late 1945, graduating formado in 1947',
  'Started at age 16-17 in Salvador; received formado medal and diploma from Bimba in 1947',
  'Começou aos 16-17 anos em Salvador; recebeu medalha e diploma de formado do Bimba em 1947'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Damião' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Damião received_title_from Bimba (formado)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "formado"}}'::jsonb, 'verified'::genealogy.confidence,
  'Damião received formado (medal and diploma) from Mestre Bimba in 1947',
  'Received formado graduation with medal and diploma from Mestre Bimba',
  'Recebeu graduação de formado com medalha e diploma do Mestre Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Damião' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Damião co_founded Besouro Mangangá - group needs import first
-- Founded May 16, 1971 with Mestre Esdras (son) and Mestre Lobão

-- Damião associated_with Mestre Lobão - person needs import first
-- Co-founded Besouro Mangangá together in 1971; Lobão still active

-- Damião associated_with Mestre Esdras (Esdras Filho) - person needs import first
-- His son; co-founder of Besouro Mangangá; began learning age 7 in 1960

-- Damião cultural_pioneer_of São Paulo - indirect relationship
-- First to formally teach Capoeira Regional in São Paulo academy (1950-1951)

-- Damião associated_with Mestre Suassuna - person needs import check
-- Consulted on naming of Besouro Mangangá academy
