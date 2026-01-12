-- ============================================================
-- STATEMENTS FOR: Geni
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Geni is the SUBJECT.
-- ============================================================

-- Geni student_of Canjiquinha (primary teacher, late 1950s onwards)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiraespeto.wordpress.com, lalaue.com, portalcapoeira.com',
  'Primary teacher. Canjiquinha eventually told Geni: "I have taught you as much as you can learn in here. You now have to go to the street rodas and experience capoeira."',
  'Mestre principal. Canjiquinha eventualmente disse a Geni: "Eu te ensinei o máximo que você pode aprender aqui dentro. Agora você tem que ir para as rodas de rua e experimentar a capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geni trained_under Bimba (late 1960s, entered through Tarzan)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahubaustralasia.com, lalaue.com',
  'Entered Bimba''s academy as "beginner" student through friendship with Tarzan (Bimba''s student). Bimba did not accept students from other teachers, so this was the only way in. Graduated from Bimba''s school.',
  'Entrou na academia de Bimba como aluno "iniciante" através de amizade com Tarzan (aluno de Bimba). Bimba não aceitava alunos de outros professores, então esta foi a única forma de entrar. Formou-se na escola de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geni associated_with Itapoan (1986 recording collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "1986_recording"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, discogs.com',
  'Both participated in 1986 LP recording at Boca do Rio studio, Salvador. Geni played atabaque and sang chorus; Itapoan wrote liner notes and sang chorus.',
  'Ambos participaram da gravação do LP de 1986 no estúdio Boca do Rio, Salvador. Geni tocou atabaque e cantou no coro; Itapoan escreveu as notas do encarte e cantou no coro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geni associated_with Suassuna (1986 recording collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "1986_recording"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, discogs.com',
  'Both participated in 1986 LP recording chorus at Boca do Rio studio, Salvador.',
  'Ambos participaram do coro da gravação do LP de 1986 no estúdio Boca do Rio, Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geni associated_with Ezequiel (1986 recording collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "1986_recording"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, discogs.com',
  'Both participated in 1986 LP recording at Boca do Rio studio, Salvador. Geni played atabaque; Ezequiel played pandeiro. Both sang in chorus.',
  'Ambos participaram da gravação do LP de 1986 no estúdio Boca do Rio, Salvador. Geni tocou atabaque; Ezequiel tocou pandeiro. Ambos cantaram no coro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Ezequiel'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geni associated_with Waldemar (1986 recording collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '1986-09-16'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "1986_recording"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/en/waldemar-1986, discogs.com',
  'Geni played atabaque and sang chorus on Waldemar and Canjiquinha''s 1986 LP recording at Boca do Rio studio, Salvador.',
  'Geni tocou atabaque e cantou no coro na gravação do LP de 1986 de Waldemar e Canjiquinha no estúdio Boca do Rio, Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Geni' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Geni founded Zambiacongo (1988) - GROUP needs import first
-- Geni family_of Luizinho Barravento - PERSON needs import first (son)
-- Tarzan (Bimba's student who helped Geni) - insufficient info for import
