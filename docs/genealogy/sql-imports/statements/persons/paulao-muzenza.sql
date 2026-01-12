-- ============================================================
-- STATEMENTS FOR: Paulão (Muzenza)
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Paulão (Muzenza) is the SUBJECT.
-- NOTE: Uses apelido_context 'Muzenza' to distinguish from other Paulãos.
-- ============================================================

-- Paulão (Muzenza) student_of Mintirinha (brother and "first and only master")
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/master-paulao-da-muzenza/',
  E'Paulão considers his older brother Mestre Mintirinha his "first and only master." Training began at age 8 (~1963) on Rua Ozéas Mota, continuing at Milton Ribeiro gymnasium in Olaria and Club Santo Antônio de Ramos.',
  E'Paulão considera seu irmão mais velho Mestre Mintirinha seu "primeiro e único mestre." O treinamento começou aos 8 anos (~1963) na Rua Ozéas Mota, continuando na academia Milton Ribeiro em Olaria e Club Santo Antônio de Ramos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulão' AND s.apelido_context = 'Muzenza'
  AND o.apelido = 'Mintirinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulão (Muzenza) family_of Mintirinha (brothers - Paulão is younger)
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
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/the-world-is-a-ginga-take-it-from-there-to-here-mestre-mintirinha-obituary/',
  E'Paulão (b. 1955) is the younger brother of Mintirinha (b. 1950). In his obituary tribute to Mintirinha, Paulão referred to him as his "blood brother."',
  E'Paulão (n. 1955) é o irmão mais novo de Mintirinha (n. 1950). Em seu tributo de obituário a Mintirinha, Paulão referiu-se a ele como seu "irmão de sangue."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulão' AND s.apelido_context = 'Muzenza'
  AND o.apelido = 'Mintirinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulão (Muzenza) associated_with Gegê (CD collaboration)
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
  NULL, NULL,
  '{"association_context": "CD collaboration; Muzenza Vol. 10 (2017) with Gegê and Burguês"}'::jsonb, 'verified'::genealogy.confidence,
  'aldeiacapoeira.com/mestregege.html; music.apple.com',
  E'Paulão collaborated on a CD with Mestre Gegê (Grupo Maragojipe de Capoeira founder). In 2017, they recorded Capoeira Muzenza Vol. 10 "Maestro Paulão" together with Mestre Burguês.',
  E'Paulão colaborou em um CD com Mestre Gegê (fundador do Grupo Maragojipe de Capoeira). Em 2017, gravaram juntos o Capoeira Muzenza Vol. 10 "Maestro Paulão" com Mestre Burguês.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulão' AND s.apelido_context = 'Muzenza'
  AND o.apelido = 'Gegê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Paulão (Muzenza) co_founded Kapoarte group - needs Kapoarte group import
-- Co-founded Jan 20, 1965 with Mintirinha, Piriquito, Khorvo, Silas

-- Paulão (Muzenza) founded Grupo Muzenza - needs Muzenza group import
-- Founded May 5, 1972 in Rio de Janeiro

-- Paulão (Muzenza) leads Grupo Muzenza - from 1972 to 1978 (then Burguês)
-- needs Muzenza group import

-- Paulão (Muzenza) baptized_by Mintirinha (gave apelido "Burguês" to student)
-- NOTE: This is Paulão baptizing Burguês, not receiving baptism
-- This statement belongs in Burguês's file as: Burguês baptized_by Paulão (Muzenza)

-- Paulão (Muzenza) associated_with Burguês - student who became successor
-- Needs Burguês import; should include:
-- - Training relationship (student_of from Burguês's file)
-- - Gave him nickname "Burguês"
-- - Successor relationship (leadership transfer 1978)
-- - Recording collaboration (Muzenza Vol. 10, 2017)

-- Paulão (Muzenza) associated_with Piriquito - Kapoarte co-founder
-- Needs Piriquito import

-- Paulão (Muzenza) associated_with Khorvo - Kapoarte co-founder
-- Needs Khorvo import

-- Paulão (Muzenza) associated_with Silas - Kapoarte co-founder
-- Needs Silas import

-- Paulão (Muzenza) associated_with Fernando (student elevated to mestre)
-- Needs Fernando import (note: many Fernandos - need to identify correct one)

-- Paulão (Muzenza) associated_with Paulinho Suam (student elevated to mestre)
-- Needs Paulinho Suam import
