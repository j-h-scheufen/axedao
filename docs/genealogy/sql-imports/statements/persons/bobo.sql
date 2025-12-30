-- ============================================================
-- STATEMENTS FOR: Bobô
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Bobô is the SUBJECT.
-- ============================================================

-- Bobô associated_with João Grande (1989 LP recording)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "LP recording collaborator, fellow angoleiro"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6, https://velhosmestres.com/en/featured-22',
  E'Recorded LP "Capoeira: Afro-Brazilian Art Form" with Mestre Jelon Vieira (1989), featuring João Grande and João Pequeno. Both were listed among the eight surviving "great master-angoleiros" in the 1988 Tribuna da Bahia article.',
  E'Gravou LP "Capoeira: Afro-Brazilian Art Form" com Mestre Jelon Vieira (1989), com participação de João Grande e João Pequeno. Ambos foram listados entre os oito "grandes mestres angoleiros" sobreviventes no artigo da Tribuna da Bahia de 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô associated_with João Pequeno (1989 LP recording, fellow angoleiro)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "LP recording collaborator, fellow angoleiro"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6, https://velhosmestres.com/en/featured-22',
  E'Recorded LP "Capoeira: Afro-Brazilian Art Form" with Mestre Jelon Vieira (1989), featuring João Grande and João Pequeno. Both were listed among the eight surviving "great master-angoleiros" in the 1988 Tribuna da Bahia article.',
  E'Gravou LP "Capoeira: Afro-Brazilian Art Form" com Mestre Jelon Vieira (1989), com participação de João Grande e João Pequeno. Ambos foram listados entre os oito "grandes mestres angoleiros" sobreviventes no artigo da Tribuna da Bahia de 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô associated_with Pastinha (helped maintain Pastinha's academy 1979)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1979-01-01'::date, 'year'::genealogy.date_precision,
  '1981-11-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "caretaker of Pastinha legacy at Pelourinho academy"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6, http://meninodearembepe.org/site/mestre_bobo.php',
  E'Invited by Mestre Bola Sete (José Luiz) in 1979 to help maintain Pastinha''s work at "51" Pelourinho after Pastinha''s health declined. Bobô played instruments and gave continuity to the Angola tradition until Pastinha''s death in November 1981.',
  E'Convidado por Mestre Bola Sete (José Luiz) em 1979 para ajudar a manter o trabalho de Pastinha no "51" do Pelourinho após o declínio da saúde de Pastinha. Bobô tocava instrumentos e dava continuidade à tradição Angola até a morte de Pastinha em novembro de 1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô associated_with Canjiquinha (fellow "eight great master-angoleiros" 1988)
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
  '{"association_context": "fellow master-angoleiro of the same generation"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-22',
  E'Both listed among eight surviving "great master-angoleiros" in the 1988 Tribuna da Bahia article: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.',
  E'Ambos listados entre os oito "grandes mestres angoleiros" sobreviventes no artigo da Tribuna da Bahia de 1988: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô associated_with Bom Cabrito (fellow "eight great master-angoleiros" 1988)
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
  '{"association_context": "fellow master-angoleiro of the same generation"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-22',
  E'Both listed among eight surviving "great master-angoleiros" in the 1988 Tribuna da Bahia article: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.',
  E'Ambos listados entre os oito "grandes mestres angoleiros" sobreviventes no artigo da Tribuna da Bahia de 1988: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'Bom Cabrito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô associated_with Curió (fellow "eight great master-angoleiros" 1988)
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
  '{"association_context": "fellow master-angoleiro of the same generation"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-22',
  E'Both listed among eight surviving "great master-angoleiros" in the 1988 Tribuna da Bahia article: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.',
  E'Ambos listados entre os oito "grandes mestres angoleiros" sobreviventes no artigo da Tribuna da Bahia de 1988: Canjiquinha, Paulo dos Anjos, Curió, Virgílio da Fazenda Grande, Bobó, Bom Cabrito, João Grande, João Pequeno.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'Curió'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bobô founded Academia de Capoeira Angola Cinco Estrelas (1962)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1962-12-26'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6, http://meninodearembepe.org/site/mestre_bobo.php',
  E'Founded Academia de Capoeira Angola Cinco Estrelas on December 26, 1962 in the backyard of Senhor Mané Jegue''s house with over 40 students. Academy later relocated to Clube de Regatas Vasco da Gama at Dique do Tororó.',
  E'Fundou a Academia de Capoeira Angola Cinco Estrelas em 26 de dezembro de 1962 no quintal da casa do Senhor Mané Jegue com mais de 40 alunos. A academia depois se mudou para o Clube de Regatas Vasco da Gama no Dique do Tororó.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Bobô' AND o.name = 'Academia de Capoeira Angola Cinco Estrelas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Bobô associated_with Jelon Vieira - taught him Angola in Santo Amaro ~1963-1969, LP collaboration 1989 - Jelon EXISTS but statement goes in Jelon's file as student_of
-- Bobô received_title_from [Unknown] - no formal title granting documented
-- Bobô associated_with Paulo dos Anjos - fellow "eight great master-angoleiros" 1988 - needs Paulo dos Anjos import
-- Bobô associated_with Virgílio da Fazenda Grande - fellow "eight great master-angoleiros" 1988 - needs Virgílio import
-- Bobô associated_with Môa do Katendê - graduated him April 5, 1987 - needs Môa import (statement goes in Môa's file as student_of)
-- Bobô associated_with Lua de Bobó - graduated him April 5, 1987 - needs Lua de Bobó import (statement goes in Lua's file as student_of)
-- Bobô associated_with Bola Sete - invited Bobô to help at Pastinha's academy 1979 - Bola Sete EXISTS in dataset

-- Bobô associated_with Bola Sete (invited by him to help at Pastinha's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1979-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "collaborator at Pastinha academy"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-6',
  E'Bola Sete (José Luiz) invited Bobô in 1979 to help maintain Pastinha''s work at "51" Pelourinho after Pastinha''s health declined.',
  E'Bola Sete (José Luiz) convidou Bobô em 1979 para ajudar a manter o trabalho de Pastinha no "51" do Pelourinho após o declínio da saúde de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bobô' AND o.apelido = 'Bola Sete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Bobô is the OBJECT go in other files:
-- - Jelon student_of Bobô → jelon-vieira.sql (needs to be added)
-- - Môa do Katendê student_of Bobô → moa-do-katende.sql (needs import)
-- - Lua de Bobó student_of Bobô → lua-de-bobo.sql (needs import)
-- ============================================================
