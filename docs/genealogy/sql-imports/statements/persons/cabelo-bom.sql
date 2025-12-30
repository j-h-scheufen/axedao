-- ============================================================
-- STATEMENTS FOR: Cabelo Bom
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Cabelo Bom is the SUBJECT.
-- ============================================================

-- Cabelo Bom student_of Waldemar
-- Source: Mestre Waldemar's 1989 interview - "Others were José Cabelo Bom"
-- Also: velhosmestres.com, capoeira-connection.com
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989-2; capoeira-connection.com',
  'Primary student of Waldemar at Barracão in Corta-Braço/Liberdade. Waldemar designated him as one of two "capoeiristas of the future who will continue his tradition" alongside Zacarias Boa Morte.',
  'Aluno principal de Waldemar no Barracão em Corta-Braço/Liberdade. Waldemar o designou como um dos dois "capoeiristas do futuro que continuarão sua tradição" ao lado de Zacarias Boa Morte.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cabelo Bom associated_with Zacarias Boa Morte
-- Source: Waldemar's 1989 interview - both designated as tradition continuers
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
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Fellow students of Waldemar, jointly designated as tradition continuers"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989-2; velhosmestres.com/en/featured-44',
  'Both students of Waldemar at Barracão. Waldemar pointed to them as "the capoeiristas of the future who will continue his tradition."',
  'Ambos alunos de Waldemar no Barracão. Waldemar os apontou como "os capoeiristas do futuro que continuarão sua tradição."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'Zacarias Boa Morte'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cabelo Bom associated_with Traíra
-- Source: Multiple sources note similar playing style
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Fellow students of Waldemar with similar playing style"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-58',
  'Training companions at Waldemar''s Barracão. Both described as playing with subtlety similar to Waldemar''s style. Photographed together by Alice Brill (1953).',
  'Companheiros de treino no Barracão de Waldemar. Ambos descritos como jogando com sutileza similar ao estilo de Waldemar. Fotografados juntos por Alice Brill (1953).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'Traíra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cabelo Bom associated_with João Grande
-- Source: João Grande interview about Conceição da Praia encounter
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Played together at Waldemar rodas and Conceição da Praia"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeira-connection.com/capoeira/2011/10/interview-with-mestre-joao-grande/',
  'João Grande described playing against Cabelo Bom at Conceição da Praia on December 8th: "I gave him a meia lua and he gave me a meia lua and I retreated and then gave him a cabeçada and he lightly gave a knee strike to my jaw." João Grande listed Cabelo Bom among the elite at Waldemar''s: "There were only snakes, experts."',
  'João Grande descreveu jogar contra Cabelo Bom na Conceição da Praia em 8 de dezembro: "Eu dei uma meia lua nele e ele me deu uma meia lua e eu recuei e então dei uma cabeçada nele e ele suavemente me deu uma joelhada no queixo." João Grande listou Cabelo Bom entre a elite de Waldemar: "Ali só tinha cobra, perito."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cabelo Bom associated_with Bugalho
-- Source: Alice Brill 1953 photograph shows them together at Waldemar's barracão
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Photographed together at Waldemar rodas"}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/br/destaques-58',
  'Photographed together by Alice Brill (1953) at Waldemar''s barracão alongside Mulunga, Waldemar, and Traíra.',
  'Fotografados juntos por Alice Brill (1953) no barracão de Waldemar ao lado de Mulunga, Waldemar e Traíra.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'Bugalho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Cabelo Bom associated_with Caiçara
-- Source: velhosmestres.com lists Caiçara among training companions
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1950-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "Training companions at Waldemar rodas"}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/en/featured-58',
  'Listed among Cabelo Bom''s training companions/playing partners at Waldemar''s rodas.',
  'Listado entre os companheiros de treino/parceiros de jogo de Cabelo Bom nas rodas de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cabelo Bom' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Cabelo Bom family_of Anilton Silva - nephew (Anilton is nephew of Cabelo Bom, Waldemar's last student)
-- Note: If Anilton is imported, the relationship should be FROM Anilton TO Cabelo Bom (uncle)
-- Cabelo Bom associated_with Evanir - training companion at Waldemar's roda
-- Cabelo Bom associated_with Tatá - training companion at Waldemar's roda
-- Cabelo Bom associated_with Chita - training companion at Waldemar's roda
-- Cabelo Bom associated_with Macário - training companion at Waldemar's roda
-- Cabelo Bom associated_with Pai de Família - photographed playing together (1954)
-- Cabelo Bom associated_with Vanildo (Quebra-Jumelo) - photographed at same roda (1954)
-- Cabelo Bom associated_with Mulunga - photographed together at Waldemar's (1953)
