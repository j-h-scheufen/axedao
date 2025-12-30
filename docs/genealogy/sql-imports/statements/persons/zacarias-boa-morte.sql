-- ============================================================
-- STATEMENTS FOR: Zacarias Boa Morte
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Zacarias Boa Morte is the SUBJECT.
-- ============================================================

-- Zacarias Boa Morte student_of Waldemar (from 1942)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1942-1',
  E'Waldemar confirmed in 1987: "Zacarias foi meu aluno de 1942." First documented student of Waldemar. Waldemar pointed to Zacarias and José Cabelo Bom as "capoeiristas of the future who will continue his tradition."',
  E'Waldemar confirmou em 1987: "Zacarias foi meu aluno de 1942." Primeiro aluno documentado de Waldemar. Waldemar apontou Zacarias e José Cabelo Bom como "capoeiristas do futuro que continuarão sua tradição."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with João Pequeno (performed together at Circo Voador 1984)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Performed together at I Encontro Nacional de Arte-Capoeira at Circo Voador, Rio de Janeiro (1984)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-44',
  E'Participated together in Mestre Camisa''s event at Circo Voador (1984)',
  E'Participaram juntos no evento de Mestre Camisa no Circo Voador (1984)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'João Pequeno' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with Mucungê (performed together at Circo Voador 1984)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1984-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Performed together at I Encontro Nacional de Arte-Capoeira at Circo Voador, Rio de Janeiro (1984)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-44',
  E'Participated together in Mestre Camisa''s event at Circo Voador (1984). Mucungê played berimbau while Camisa and Zacarias played together.',
  E'Participaram juntos no evento de Mestre Camisa no Circo Voador (1984). Mucungê tocou berimbau enquanto Camisa e Zacarias jogaram juntos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Mucungê' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with Traíra (bateria companions)
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
  NULL, NULL,
  '{"association_context": "Training companions at Waldemar''s Barracão; played together in bateria for Vadiação film (1954) and Simone Dreyfus LP (1955)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1954',
  E'Both were key members of Waldemar''s roda. In Vadiação (1954), Zacarias played berimbau while Traíra played pandeiro. Both appeared in the 1955 Simone Dreyfus recordings.',
  E'Ambos foram membros-chave da roda de Waldemar. Em Vadiação (1954), Zacarias tocou berimbau enquanto Traíra tocou pandeiro. Ambos apareceram nas gravações de Simone Dreyfus de 1955.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Traíra' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with Cobrinha Verde (bateria companions at Waldemar's roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Part of bateria at Waldemar''s Corta Braço roda (1955)"}'::jsonb,
  'verified'::genealogy.confidence,
  'grupoliberdadecapoeira.com.br/linhagem-mestres/',
  E'Part of Waldemar''s bateria alongside Traíra, Rafael, Cobrinha Verde, and Bugalho at Corta Braço roda (1955)',
  E'Parte da bateria de Waldemar junto com Traíra, Rafael, Cobrinha Verde e Bugalho na roda de Corta Braço (1955)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Cobrinha Verde' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with Bugalho (bateria companions at Waldemar's roda)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Part of bateria at Waldemar''s Corta Braço roda (1955)"}'::jsonb,
  'verified'::genealogy.confidence,
  'grupoliberdadecapoeira.com.br/linhagem-mestres/',
  E'Part of Waldemar''s bateria alongside Traíra, Rafael, Cobrinha Verde, and Bugalho at Corta Braço roda (1955)',
  E'Parte da bateria de Waldemar junto com Traíra, Rafael, Cobrinha Verde e Bugalho na roda de Corta Braço (1955)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Bugalho' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zacarias Boa Morte associated_with Curió (appeared together in Vadiação 1954)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both appeared in Vadiação documentary (1954)"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1954',
  E'Both appeared in the Vadiação documentary (1954); Zacarias in the bateria, Curió (velho) as a player',
  E'Ambos apareceram no documentário Vadiação (1954); Zacarias na bateria, Curió (velho) como jogador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zacarias Boa Morte' AND s.apelido_context IS NULL
  AND o.apelido = 'Curió' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zacarias Boa Morte associated_with José Cabelo Bom - co-designated by Waldemar as "capoeiristas of the future"; needs import first
-- Zacarias Boa Morte associated_with Evanir - training companion at Waldemar's; needs import first
-- Zacarias Boa Morte associated_with Tatá - training companion at Waldemar's; needs import first
-- Zacarias Boa Morte associated_with Chita - training companion at Waldemar's; needs import first
-- Zacarias Boa Morte associated_with Macário - training companion at Waldemar's; needs import first

-- ============================================================
-- FOUNDED RELATIONSHIP (group exists in backlog but not imported)
-- ============================================================
-- Zacarias Boa Morte founded Escola Zacarias Boa Morte (May 19, 1999) - group needs import first
