-- ============================================================
-- STATEMENTS FOR: Omar
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Omar is the SUBJECT.
-- ============================================================

-- Omar student_of Ezequiel
-- Primary teacher from age 12 at Escola de Capoeira Mestre Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '1985-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeira-uniao.ch/mestre-omar; lalaue.com/baden/capoeira-uniao',
  E'Omar began training with Mestre Ezequiel at age 12 (~1969) at the Escola de Capoeira Mestre Bimba in Salvador. Training continued until Omar moved to Switzerland in 1985. Ezequiel later traveled to Baden to personally elevate Omar to mestre (1996).',
  E'Omar começou a treinar com Mestre Ezequiel aos 12 anos (~1969) na Escola de Capoeira Mestre Bimba em Salvador. O treinamento continuou até Omar se mudar para a Suíça em 1985. Ezequiel mais tarde viajou para Baden para pessoalmente elevar Omar a mestre (1996).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Omar' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Omar received_title_from Ezequiel
-- Received Mestre title on August 30, 1996 in Baden, Switzerland
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1996-08-30'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Academia de Capoeira União inauguration", "location": "Baden, Switzerland"}}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira-uniao.ch/mestre-omar; capoeira-muenchen.de/en/capoeira/the-masters',
  E'Mestre Ezequiel traveled from Brazil to Baden, Switzerland to inaugurate the Academia de Capoeira União and personally presented Omar with the white corda (mestre title). This was one of Ezequiel''s final acts as a teacher before his death in March 1997.',
  E'Mestre Ezequiel viajou do Brasil para Baden, Suíça, para inaugurar a Academia de Capoeira União e pessoalmente apresentou a Omar a corda branca (título de mestre). Este foi um dos últimos atos de Ezequiel como professor antes de sua morte em março de 1997.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Omar' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: cultural_pioneer_of Switzerland info is stored in Omar's
-- achievements and bio rather than as a statement, since statements
-- require an object entity (person or group).
-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Omar founded Grupo de Capoeira União (1994)
-- NEEDS: Grupo de Capoeira União group import first
-- Founded 1994; HQ Itaparica, Bahia; IPHAN registered (Ponto de Cultura, Ponto de Memória)

-- ============================================================
-- NOTE ON STUDENTS
-- ============================================================
-- Student relationships flow FROM student TO teacher, so if Omar
-- has documented students with profiles, their student_of statements
-- would go in their respective SQL files.
-- Current IPHAN data shows: 12 contra-mestres, 16 professors
