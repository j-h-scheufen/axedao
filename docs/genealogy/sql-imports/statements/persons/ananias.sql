-- ============================================================
-- STATEMENTS FOR: Ananias
-- Generated: 2025-12-21
-- ============================================================
-- Contains all relationships where Ananias is the SUBJECT.
-- ============================================================

-- Ananias student_of Juvêncio (1938+, São Félix dock rodas)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview 2011',
  E'First capoeira teacher in informal dock rodas during religious festivals in São Félix. "Juvêncio was the mestre. He was a dock worker who did capoeira on the docks of São Félix... Nobody taught classes, but the real master was Juvêncio, everyone got together and played."',
  E'Primeiro professor de capoeira nas rodas informais nas docas durante festas religiosas em São Félix. "Juvêncio era o mestre. Ele era estivador e fazia capoeira na beira do cais de São Félix... Ninguém ensinava, mas o mestre mesmo era o Juvêncio, todo mundo se reunia e pronto."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Juvêncio' AND o.apelido_context = 'São Félix'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ananias trained_under Canjiquinha (1942-1946, Pastinha's space)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview 2011; velhosmestres.com',
  E'Trained with Canjiquinha in Pastinha''s space in Liberdade. Played in Pastinha''s bateria during street rodas alongside Gato Preto. Ananias said he "got his diploma" from Canjiquinha, though "at that time, there wasn''t this business of diplomas."',
  E'Treinou com Canjiquinha no espaço de Pastinha na Liberdade. Tocou na bateria de Pastinha durante rodas de rua ao lado de Gato Preto. Ananias disse que "tirou seu diploma" com Canjiquinha, embora "naquele tempo, não tinha esse negócio de diploma."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Canjiquinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ananias student_of Waldemar (1946-1953, primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1946-01-01'::date, 'year'::genealogy.date_precision,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com; Capoeira Connection interview 2011',
  E'Primary teacher at Barracão de Waldemar in Liberdade. Received position of contra-mestre de bateria from Waldemar after rigorous testing by the mestres.',
  E'Professor principal no Barracão de Waldemar na Liberdade. Recebeu posição de contra-mestre de bateria de Waldemar após testes rigorosos pelos mestres.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ananias associated_with Traíra (training companions at São Félix and Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview 2011; Traíra report',
  E'Training companions from São Félix dock rodas (~1938) and later at Waldemar''s Barracão in Salvador (1947+). Both learned from Juvêncio in São Félix and trained under Waldemar.',
  E'Companheiros de treino das rodas das docas de São Félix (~1938) e depois no Barracão de Waldemar em Salvador (1947+). Ambos aprenderam com Juvêncio em São Félix e treinaram com Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Traíra' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ananias associated_with Pastinha (played in his bateria, trained in his space)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "roda_participant"}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview 2011; velhosmestres.com',
  E'Played in Pastinha''s bateria during street rodas in early 1940s while training with Canjiquinha. Listed among training companions at Waldemar''s barracão.',
  E'Tocou na bateria de Pastinha durante rodas de rua no início dos anos 1940 enquanto treinava com Canjiquinha. Listado entre companheiros de treino no barracão de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ananias received_title_from Waldemar (contra-mestre de bateria)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'approximate'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "contra-mestre de bateria"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com',
  E'Received position of contra-mestre de bateria from Waldemar after rigorous testing by the mestres. Date approximate (sometime between 1946-1953 training period).',
  E'Recebeu posição de contra-mestre de bateria de Waldemar após testes rigorosos pelos mestres. Data aproximada (em algum momento entre 1946-1953, período de treinamento).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ananias' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Ananias cultural_pioneer_of São Paulo cannot be expressed as a statement
-- because 'region' is not a valid entity_type (only 'person' and 'group' are valid).
-- This pioneering role is documented in person_profiles.achievements_en/pt and notes_en/pt instead.
-- Context: Considered the "father" of São Paulo capoeira. Founded Associação de Capoeira Angola
-- Senhor do Bonfim (1953) and established the legendary Sunday roda at Praça da República.

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Ananias associated_with Gato Preto - played together in Pastinha's bateria (needs Gato Preto import)
-- Ananias associated_with Nagé - training companion at Waldemar's (needs Nagé import)
-- Ananias associated_with Onça Preta - training companion at Waldemar's (needs Onça Preta import - may be different from Rio Onça Preta)
-- Ananias associated_with Noronha - training companion at Waldemar's (needs Noronha import)
-- Ananias associated_with Cobrinha Verde - training companion at Waldemar's (needs Cobrinha Verde import)
-- Ananias associated_with Zacaria - training companion at Waldemar's (needs Zacaria import)
-- Ananias associated_with Mucungê - training companion at Waldemar's (needs Mucungê import)
-- Ananias founded Associação de Capoeira Angola Senhor do Bonfim (needs group import)
-- Ananias founded Roda da Praça da República (needs group/roda import)
-- Ananias teaches_at Casa Mestre Ananias (needs group import)
-- ============================================================
