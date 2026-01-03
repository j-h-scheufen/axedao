-- ============================================================
-- STATEMENTS FOR: Paulo dos Anjos
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Paulo dos Anjos is the SUBJECT.
-- Teachers and groups he founded/joined.
-- ============================================================

-- Paulo dos Anjos student_of Canjiquinha
-- Primary teacher relationship (1950-1957); graduated under Canjiquinha
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'year'::genealogy.date_precision,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-10',
  'Primary teacher; began 1950, graduated 1957; consecrated as mestre by Canjiquinha',
  'Mestre principal; começou 1950, graduou 1957; consagrado como mestre por Canjiquinha'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo dos Anjos trained_under Gato Preto
-- Worked alongside Gato Preto; taught at his academy from 1963
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-paulo-dos-anjos/',
  'Worked alongside Gato Preto; taught at his academy from 1963; continued collaboration on Itaparica Island',
  'Trabalhou ao lado de Gato Preto; ensinou em sua academia a partir de 1963; continuou colaboração na Ilha de Itaparica'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paulo dos Anjos received_title_from Canjiquinha
-- Mestre title conferred at graduation 1957
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1957-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-10',
  'Consecrated as mestre by Canjiquinha upon graduation in 1957',
  'Consagrado como mestre por Canjiquinha ao se graduar em 1957'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paulo dos Anjos' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships require the objects to be imported first.
-- They should be added once the respective person/group profiles exist.
-- ============================================================
--
-- GROUPS (pending group imports):
-- Paulo dos Anjos founded "Associação de Capoeira Anjos de Angola" (Aug 15, 1975, São José dos Campos)
-- Paulo dos Anjos founded "Associação Cultural de Capoeira Grupo Anjos de Angola Academia" (1980s, Salvador)
-- Paulo dos Anjos member_of ABCA (from 1987, as vice-president)
-- Paulo dos Anjos teaches_at "Academia de Gato Preto" (from 1963)
--
-- STUDENTS (pending person imports):
-- All below should generate statements FROM the student TO Paulo dos Anjos (student student_of Paulo dos Anjos)
-- - Virgílio do Retiro
-- - Jaime de Mar Grande (first student on Itaparica, ~1965)
-- - Jorge Satélite
-- - Pássaro Preto
-- - Renê (Renê Bittencourt)
-- - Amâncio
-- - Neguinho
-- - Alfredo
-- - Djalma
-- - Galego
-- - Mala (already in backlog - Gato Preto import)
-- - Josias
-- - Cabeção
-- - Jequié
-- - Feijão
-- - Vital
-- - Al Capone
--
-- CONTEMPORARIES (pending person imports):
-- Paulo dos Anjos associated_with João Pequeno (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Mário Bom Cabrito (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Nô (ABCA co-leadership 1987)
-- Paulo dos Anjos associated_with Renê (ABCA co-leadership 1987, also student)
--
-- ============================================================
