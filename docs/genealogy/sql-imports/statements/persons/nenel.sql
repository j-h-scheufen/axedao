-- ============================================================
-- STATEMENTS FOR: Nenel
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Nenel is the SUBJECT.
-- ============================================================

-- Nenel student_of Bimba (his father and mestre)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://fundacaomestrebimba.org.br/mestre-nenel/',
  E'Primary teacher. Nenel began formal capoeira training at age 6 in 1966, graduating with blue scarf in June 1967. Training continued until Bimba''s death in February 1974. Nenel was both son and student of Mestre Bimba.',
  E'Professor principal. Nenel começou treinamento formal de capoeira aos 6 anos em 1966, formando-se com lenço azul em junho de 1967. O treinamento continuou até a morte de Bimba em fevereiro de 1974. Nenel foi tanto filho quanto aluno de Mestre Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nenel' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Nenel family_of Bimba (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-09-26'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'https://fundacaomestrebimba.org.br/mestre-nenel/',
  E'Biological son. Nenel is the son of Mestre Bimba and Berenice da Conceição Nascimento. He continues his father''s legacy as guardian of authentic Capoeira Regional.',
  E'Filho biológico. Nenel é filho de Mestre Bimba e Berenice da Conceição Nascimento. Ele continua o legado de seu pai como guardião da autêntica Capoeira Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nenel' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Nenel founded Filhos de Bimba Escola de Capoeira (1986) - group needs import first
-- Nenel leads Fundação Mestre Bimba - group needs import first
-- Nenel associated_with Mestra Preguiça (partner) - person needs import first
-- Nenel associated_with Formiga (brother, trained together June 1967) - person needs import first
