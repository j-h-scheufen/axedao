-- ============================================================
-- STATEMENTS FOR: Paraná
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Paraná is the SUBJECT.
-- Relationships where Paraná is the OBJECT go in the other
-- person's statements file.
-- ============================================================

-- ============================================================
-- TEACHER RELATIONSHIPS
-- ============================================================

-- Paraná student_of Antônio Corró (primary teacher, 1932)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1932-01-01'::date, 'year'::genealogy.date_precision,
  '1945-02-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-14, capoeiranews.com.br',
  E'Paraná began learning capoeira from Antônio Corró in 1932 at age 10 in the Alto das Pombas neighborhood, Federação district of Salvador. Corró was 62 years old at the time, an ex-slave born in 1870 who worked as a cart driver at the Cais Dourado. This training continued until Paraná left for Rio de Janeiro in February 1945.',
  E'Paraná começou a aprender capoeira com Antônio Corró em 1932 aos 10 anos no bairro do Alto das Pombas, região da Federação em Salvador. Corró tinha 62 anos na época, um ex-escravo nascido em 1870 que trabalhava como carroceiro no Cais Dourado. Este treinamento continuou até Paraná partir para o Rio de Janeiro em fevereiro de 1945.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context IS NULL AND o.apelido = 'Antônio Corró'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- MUSICAL/PROFESSIONAL ASSOCIATIONS
-- ============================================================

-- Paraná associated_with Artur Emídio (played berimbau at his rodas)
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
  '1972-03-07'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Paraná frequently played berimbau at Artur Emídio''s Sunday rodas and directed the percussion section"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com, velhosmestres.com',
  E'Paraná was a regular collaborator at Artur Emídio''s legendary Sunday rodas in Bonsucesso. According to Mestre Leopoldina, "it was Mestre Paraná who played the berimbau at Artur''s academy". Paraná also participated in the show "Arco-Íris" featuring Mestre Artur Emídio.',
  E'Paraná era um colaborador regular nas lendárias rodas de domingo de Artur Emídio em Bonsucesso. Segundo Mestre Leopoldina, "era Mestre Paraná quem tocava o berimbau na academia de Artur". Paraná também participou do show "Arco-Íris" com Mestre Artur Emídio.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context IS NULL AND o.apelido = 'Artur Emídio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paraná associated_with Onça Preta (musical collaboration on 1963 LP)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Onça Preta played pandeiro on Paraná''s 1963 CBS LP recording"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-34',
  E'According to Mestre Gegê, Onça Preta played pandeiro on Paraná''s historic 1963 LP "Capoeira – Mestre Paraná" for CBS.',
  E'Segundo Mestre Gegê, Onça Preta tocou pandeiro no histórico LP de Paraná de 1963 "Capoeira – Mestre Paraná" pela CBS.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context IS NULL AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Paraná founded Grupo São Bento Pequeno
-- PENDING: Grupo São Bento Pequeno not yet in database
-- Founded 1950 on Rua Miguel Burnier, Rio de Janeiro
-- Later became foundation for Grupo Muzenza

-- Paraná associated_with Joel Lourenço (O Pagador de Promessas 1962 film)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "O Pagador de Promessas film 1962"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/parana',
  E'Both appeared in the 1962 film "O Pagador de Promessas" (The Given Word), directed by Anselmo Duarte, which won the Palme d''Or at Cannes.',
  E'Ambos apareceram no filme "O Pagador de Promessas" de 1962, dirigido por Anselmo Duarte, que ganhou a Palma de Ouro em Cannes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context IS NULL AND o.apelido = 'Joel Lourenço'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Paraná associated_with Mucungê (1963 LP collaboration)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1963 LP recording collaboration"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/parana',
  E'Collaborated on a 1963 LP recording together.',
  E'Colaboraram em uma gravação de LP em 1963.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Paraná' AND s.apelido_context IS NULL AND o.apelido = 'Mucungê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Paraná associated_with Mintirinha (appeared at rodas) - Mintirinha needs import first
-- Paraná founded Grupo São Bento Pequeno (1950) - Group needs import first

-- ============================================================
-- NOTE: Relationships where Paraná is the OBJECT
-- ============================================================
-- These go in the OTHER person's statements file per ownership rule:
-- Polaco student_of Paraná (1956) → polaco.sql
-- Polaco baptized_by Paraná (1956, apelido "Polaco") → polaco.sql
-- Genaro trained_under Paraná (learned berimbau) → genaro.sql
-- Mintirinha associated_with Paraná (appeared at rodas) → mintirinha.sql
