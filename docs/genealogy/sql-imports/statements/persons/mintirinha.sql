-- ============================================================
-- STATEMENTS FOR: Mintirinha
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Mintirinha is the SUBJECT.
-- ============================================================

-- Mintirinha student_of Paraná
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
  'capoeirahistory.com, lalaue.com',
  'Started training at age 6 in 1956 in Mestre Paraná''s backyard in Bonsucesso. Continued until Paraná''s death on March 7, 1972. Inherited berimbau mastery and atabaque skills from Paraná.',
  'Começou a treinar aos 6 anos em 1956 no quintal de Mestre Paraná em Bonsucesso. Continuou até a morte de Paraná em 7 de março de 1972. Herdou a maestria no berimbau e habilidades de atabaque de Paraná.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mintirinha' AND o.apelido = 'Paraná' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mintirinha influenced_by Artur Emídio
-- (not trained directly, but inspired by his fast game to create Barravento style)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com',
  'Inspired by Artur Emídio''s fast, explosive game to create his own Barravento style. Circulated in rodas de bamba where Emídio played. Traveled to Portugal with Grão-Mestre Artur Emídio in 2003.',
  'Inspirado pelo jogo rápido e explosivo de Artur Emídio para criar seu próprio estilo Barravento. Circulava nas rodas de bamba onde Emídio jogava. Viajou a Portugal com Grão-Mestre Artur Emídio em 2003.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mintirinha' AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mintirinha family_of Paulão (Muzenza)
-- (Note: Mintirinha is older, but we need one direction only. Since we're generating
-- from Mintirinha's perspective as subject, we use this. Paulão's file should NOT
-- duplicate this.)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-06-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com, lalaue.com',
  'Brothers. Mintirinha (b. Aug 28, 1950) is the older brother. Paulão (b. Jun 16, 1955) is approximately 5 years younger. Paulão considers Mintirinha his "first and only master."',
  'Irmãos. Mintirinha (n. 28 ago 1950) é o irmão mais velho. Paulão (n. 16 jun 1955) é aproximadamente 5 anos mais novo. Paulão considera Mintirinha seu "primeiro e único mestre."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Mintirinha' AND o.apelido = 'Paulão' AND o.apelido_context = 'Muzenza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Mintirinha co_founded Kapoarte
-- (Group not yet in database - pending import)

-- Mintirinha co_founded Grupo Muzenza
-- (Group not yet in database - pending import)

-- Mintirinha founded Grupo Terra
-- (Group not yet in database - pending import)

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Mintirinha co_founded Kapoarte - group needs import first
-- Mintirinha co_founded Grupo Muzenza - group needs import first
-- Mintirinha founded Grupo Terra - group needs import first
-- Mintirinha associated_with Mário Santos (taught at his gymnasium 1966) - person needs import
-- Mintirinha associated_with Zé Maria (traveled together internationally) - person needs verification if in dataset
-- Mintirinha associated_with Jorge Crioulo (traveled together internationally) - person needs import
-- Mintirinha received_title_from [unknown] - no formal title ceremony documented
-- Mintirinha associated_with Alexandre Batata (student, invited to Portugal) - person needs import
-- Mintirinha associated_with Mestra Cleide (successor at Grupo Terra) - person needs import
