-- ============================================================
-- STATEMENTS FOR: Zé de Freitas
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Zé de Freitas is the SUBJECT.
-- ============================================================

-- Zé de Freitas student_of Caiçara (initial teacher, 1946)
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
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Zé de Freitas began training under Mestre Caiçara in 1946 in Bahia. Caiçara later introduced him to Mestre Waldemar.',
  'Zé de Freitas começou a treinar com Mestre Caiçara em 1946 na Bahia. Caiçara mais tarde o apresentou a Mestre Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas student_of Waldemar (primary teacher/mentor after Caiçara's introduction)
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
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.wiki.urucungo.com.br/linhagem-do-urucungo-capoeira/mestre-z%C3%A9-de-freitas',
  'Mestre Caiçara introduced Zé de Freitas to Mestre Waldemar Rodrigues da Paixão (known as "o Poeta" - the Poet). Zé de Freitas became Waldemar''s disciple and refined his technique and musical skills at Waldemar''s famous Barracão in Liberdade, Salvador.',
  'Mestre Caiçara apresentou Zé de Freitas a Mestre Waldemar Rodrigues da Paixão (conhecido como "o Poeta"). Zé de Freitas tornou-se discípulo de Waldemar e aperfeiçoou sua técnica e habilidades musicais no famoso Barracão de Waldemar na Liberdade, Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Suassuna (met at Zé de Freitas's CMTC Club classes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Suassuna met Brasília at Zé de Freitas''s academy/CMTC Club in São Paulo (1965); Zé de Freitas was a unifier of Bahian capoeiristas in SP"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/',
  'Suassuna and Brasília first met at Zé de Freitas''s academy/CMTC Club in São Paulo (1965). Zé de Freitas served as a unifier of Bahian capoeiristas arriving in São Paulo.',
  'Suassuna e Brasília se conheceram na academia/Clube CMTC de Zé de Freitas em São Paulo (1965). Zé de Freitas serviu como unificador de capoeiristas baianos chegando em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Brasília (met at Zé de Freitas's CMTC Club classes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Brasília met Suassuna at Zé de Freitas''s academy/CMTC Club in São Paulo (1965); Zé de Freitas was a unifier of Bahian capoeiristas in SP"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://portalcapoeira.com/capoeira/eventos-agenda/sao-paulo-homenagem-a-mestre-ze-de-freitas/',
  'Brasília and Suassuna first met at Zé de Freitas''s academy/CMTC Club in São Paulo (1965). Zé de Freitas served as a unifier of Bahian capoeiristas arriving in São Paulo.',
  'Brasília e Suassuna se conheceram na academia/Clube CMTC de Zé de Freitas em São Paulo (1965). Zé de Freitas serviu como unificador de capoeiristas baianos chegando em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Brasília'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Limão (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Limão were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971 as pioneers of capoeira in São Paulo.',
  'Tanto Zé de Freitas quanto Limão foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971 como pioneiros da capoeira em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Limão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Silvestre (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Silvestre were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971 as pioneers of capoeira in São Paulo.',
  'Tanto Zé de Freitas quanto Silvestre foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971 como pioneiros da capoeira em São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Silvestre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zé de Freitas associated_with Onça (SP) (Grupo dos Nove; both São Paulo pioneers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971); Onça organized Bimba''s visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://museudapessoa.org/historia-de-vida/hist-ria-da-capoeira-paulista/',
  'Both Zé de Freitas and Onça (SP) were members of the Grupo dos Nove (Group of Nine) recognized by Mestre Bimba in 1971. Onça organized Bimba''s visit to São Paulo.',
  'Tanto Zé de Freitas quanto Onça (SP) foram membros do Grupo dos Nove reconhecidos por Mestre Bimba em 1971. Onça organizou a visita de Bimba a São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé de Freitas' AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zé de Freitas associated_with Joel (SP) - Grupo dos Nove member; met at Zé de Freitas's CMTC Club; needs import first
-- Zé de Freitas associated_with Gilvan - Grupo dos Nove member; needs import first
-- Zé de Freitas associated_with Pinatti - Grupo dos Nove member; student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Mello - student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Serginho - student of Zé de Freitas; needs import first
-- Zé de Freitas associated_with Dulcídio - "eternal student and friend"; now leads his academy; needs import first

-- ============================================================
-- GROUP RELATIONSHIPS (pending - groups not yet in dataset)
-- ============================================================
-- Zé de Freitas founded Associação de Lutas Unidas Capoeira Freitas (~1960s, Sapopemba, São Paulo)
-- Zé de Freitas member_of Federação Paulista de Capoeira (founding association, 1974)
