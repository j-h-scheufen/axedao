-- ============================================================
-- STATEMENTS FOR: Bola Sete
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Bola Sete is the SUBJECT.
--
-- RELATIONSHIPS:
-- 1. Bola Sete student_of Pastinha (1969-1981, graduated 1979)
-- 2. Bola Sete trained_under Pessoa Bababá (1968-1969)
-- 3. Bola Sete received_title_from Pastinha (1979) - diploma received
-- 4. Bola Sete founded Centro de Cultura da Capoeira Tradicional Bahia (1980) - PENDING: group not in dataset
-- 5. Bola Sete leads Centro de Cultura da Capoeira Tradicional Bahia - PENDING: group not in dataset
-- 6. Bola Sete member_of ABCA - PENDING: ABCA not in dataset
-- ============================================================

-- Bola Sete student_of Pastinha
-- Primary teacher-student relationship at CECA (1969-1981)
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
  '1981-11-13'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview (2011), Portal Capoeira interview',
  E'Bola Sete entered CECA in 1969 after approximately one year of training with Pessoa Bababá. He served as "Fiscal de Campo" (Field Supervisor) and remained a student for 13 years until Pastinha''s death in November 1981. Received diploma in 1979.',
  E'Bola Sete ingressou no CECA em 1969 após aproximadamente um ano de treinamento com Pessoa Bababá. Serviu como "Fiscal de Campo" e permaneceu aluno por 13 anos até a morte de Pastinha em novembro de 1981. Recebeu diploma em 1979.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bola Sete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bola Sete received_title_from Pastinha
-- Graduated by Pastinha in 1979
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1979-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview (2011), Portal Capoeira interview',
  E'Bola Sete received his diploma from Mestre Pastinha in 1979, after 10 years of dedicated study at CECA. Pastinha famously told him during a chamada: "Zé Luiz… you have a twin soul to mine!"',
  E'Bola Sete recebeu seu diploma de Mestre Pastinha em 1979, após 10 anos de estudo dedicado no CECA. Pastinha famosamente lhe disse durante uma chamada: "Zé Luiz… você tem uma alma gêmea à minha!"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bola Sete' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bola Sete trained_under Pessoa Bababá
-- First formal training before entering CECA (1968-1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Capoeira Connection interview (2011), Portal Capoeira interview',
  E'Bola Sete''s first formal training in capoeira was under Pessoa Bababá, a merchant marine sailor and disciple of Mestre Pastinha. Training took place in a small, poorly-lit basement space in Salvador, for approximately one year before Bola Sete entered Pastinha''s CECA in 1969. Pessoa Bababá was described as "muito forte e valente" (very strong and brave) and taught "the old game the old way."',
  E'O primeiro treinamento formal de Bola Sete em capoeira foi sob Pessoa Bababá, um marinheiro da Marinha Mercante e discípulo de Mestre Pastinha. O treinamento aconteceu em um pequeno espaço mal iluminado no porão em Salvador, por aproximadamente um ano antes de Bola Sete entrar no CECA de Pastinha em 1969. Pessoa Bababá era descrito como "muito forte e valente" e ensinava "o jogo antigo da maneira antiga."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bola Sete' AND o.apelido = 'Pessoa Bababá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Bola Sete founded Centro de Cultura da Capoeira Tradicional Bahia (1980)
--   - Group needs import first
--
-- Bola Sete leads Centro de Cultura da Capoeira Tradicional Bahia (current)
--   - Group needs import first
--
-- Bola Sete member_of Associação Brasileira de Capoeira Angola (ABCA)
--   - ABCA needs import first
--   - He is President of the Council of Mestres
--   - Consider: leads ABCA_Council_of_Mestres or specific predicate
-- ============================================================
