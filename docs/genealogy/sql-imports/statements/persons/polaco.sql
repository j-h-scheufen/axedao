-- ============================================================
-- STATEMENTS FOR: Polaco
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Polaco is the SUBJECT.
-- ============================================================

-- Polaco student_of Paraná (primary teacher, 1956-1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  '1972-03-07'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/master-polaco/',
  E'Polaco was introduced to Mestre Paraná in 1956 and trained in his famous backyard academy in Bonsucesso until Paraná''s death on March 7, 1972. Paraná gave him his apelido "Polaco".',
  E'Polaco foi apresentado a Mestre Paraná em 1956 e treinou em sua famosa academia de quintal em Bonsucesso até a morte de Paraná em 7 de março de 1972. Paraná lhe deu o apelido "Polaco".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Polaco' AND o.apelido = 'Paraná'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Polaco baptized_by Paraná (received apelido "Polaco")
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"baptism": {"apelido_given": "Polaco"}}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/master-polaco/',
  E'Polaco received his apelido from Mestre Paraná when he became a disciple in 1956. The nickname "Polaco" (Polish) likely refers to his physical appearance.',
  E'Polaco recebeu seu apelido de Mestre Paraná quando se tornou discípulo em 1956. O apelido "Polaco" provavelmente refere-se à sua aparência física.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Polaco' AND o.apelido = 'Paraná'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Polaco associated_with Genaro (fellow guardians of Rio capoeira history)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '2021-04-10'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "fellow guardians of Rio de Janeiro capoeira history"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/from-the-ring-to-the-stage-a-movie-about-master-artur-emidio/',
  E'Polaco and Genaro were recognized as the two great "guardians of the history of capoeira in Rio de Janeiro". Both gave testimonies for the documentary "From the Ring to the Stage" about Mestre Artur Emídio before their deaths.',
  E'Polaco e Genaro eram reconhecidos como os dois grandes "guardiões da história da capoeira no Rio de Janeiro". Ambos deram depoimentos para o documentário "Do Ringue aos Palcos" sobre Mestre Artur Emídio antes de suas mortes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Polaco' AND o.apelido = 'Genaro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Polaco leads Grupo Capoeira São Bento Pequeno (from 1972) - GROUP needs import first
-- Polaco associated_with Mintirinha (fellow student of Paraná) - Mintirinha needs import first
-- Polaco associated_with Bira (fellow student of Paraná) - Bira needs import first
-- Polaco associated_with Wilson Malhado (fellow student of Paraná) - Malhado needs import first
-- Polaco associated_with Indio Aranha (fellow student of Paraná) - Indio Aranha needs import first
-- Polaco associated_with Pé de Valsa (fellow student of Paraná) - Pé de Valsa needs import first
-- Polaco associated_with Denis (fellow student of Paraná) - Denis needs import first
-- Polaco associated_with Marreta (fellow student of Paraná) - Marreta needs import first
