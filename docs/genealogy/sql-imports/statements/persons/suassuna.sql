-- ============================================================
-- STATEMENTS FOR: Suassuna
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Suassuna is the SUBJECT.
-- ============================================================

-- Suassuna trained_under Bimba (1950s-1960s in Salvador terreiros)
-- Note: Using trained_under rather than student_of since Suassuna
-- visited Bimba's terreiro in Salvador periodically, not as a formal
-- ongoing student. Bimba later recognized him as mestre (1972).
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, lalaue.com, capoeira.online',
  'Suassuna visited Bimba''s terreiro in Salvador during trips from Itabuna to expand his knowledge. Bimba became a primary reference for his work and later recognized him as mestre in 1972.',
  'Suassuna visitou o terreiro de Bimba em Salvador durante viagens de Itabuna para expandir seu conhecimento. Bimba tornou-se referência primária para seu trabalho e depois o reconheceu como mestre em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna trained_under Canjiquinha (1950s-1960s in Salvador terreiros)
-- Note: Using trained_under since Suassuna visited Canjiquinha's terreiro
-- in Salvador periodically. Canjiquinha later recognized him as mestre.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, lalaue.com, capoeira.online',
  'Suassuna visited Canjiquinha''s terreiro in Salvador during trips from Itabuna. Canjiquinha influenced his entire artistic career and later recognized him as mestre.',
  'Suassuna visitou o terreiro de Canjiquinha em Salvador durante viagens de Itabuna. Canjiquinha influenciou toda sua carreira artística e depois o reconheceu como mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna influenced_by Pastinha (1950s-1960s in Salvador terreiros)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeira.online, portalcapoeira.com',
  'Suassuna visited Pastinha''s terreiro in Salvador as part of his efforts to learn from the most famous mestres of Bahia.',
  'Suassuna visitou o terreiro de Pastinha em Salvador como parte de seus esforços para aprender com os mestres mais famosos da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna influenced_by Waldemar (1950s-1960s in Salvador terreiros)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeira.online, portalcapoeira.com',
  'Suassuna visited Waldemar''s terreiro in Salvador as part of his efforts to learn from the most famous mestres of Bahia.',
  'Suassuna visitou o terreiro de Waldemar em Salvador como parte de seus esforços para aprender com os mestres mais famosos da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna influenced_by Caiçara (1950s-1960s in Salvador terreiros)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeira.online, portalcapoeira.com',
  'Suassuna visited Caiçara''s terreiro in Salvador as part of his efforts to learn from the most famous mestres of Bahia.',
  'Suassuna visitou o terreiro de Caiçara em Salvador como parte de seus esforços para aprender com os mestres mais famosos da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna influenced_by João Grande (development of Miudinho)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1958-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com',
  'João Grande (João Batestaca), disciple of Pastinha, influenced the development of Suassuna''s famous Miudinho game - a closed angola game played close.',
  'João Grande (João Batestaca), discípulo de Pastinha, influenciou o desenvolvimento do famoso jogo Miudinho de Suassuna - um jogo de angola fechado jogado de perto.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna received_title_from Bimba (1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  'In 1972, Mestre Bimba visited Suassuna in São Paulo and awarded him a certificate recognizing his work and his status as mestre. Some sources say 1975.',
  'Em 1972, Mestre Bimba visitou Suassuna em São Paulo e lhe concedeu um certificado reconhecendo seu trabalho e seu status como mestre. Algumas fontes dizem 1975.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna received_title_from Canjiquinha (date unknown)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeira.online, portalcapoeira.com',
  'Canjiquinha recognized Suassuna''s work and awarded him the title of mestre. Exact date unknown.',
  'Canjiquinha reconheceu o trabalho de Suassuna e lhe concedeu o título de mestre. Data exata desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Suassuna associated_with Brasília (co-founders of Cordão de Ouro, lifelong friends)
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
  NULL, NULL,
  '{"association_context": "co-founders of Cordão de Ouro; met at Zé de Freitas academy in São Paulo 1965"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, lalaue.com, brasilia.md',
  'Suassuna and Brasília met at Zé de Freitas''s academy in São Paulo (1965). They co-founded Cordão de Ouro on September 1, 1967. Though Brasília departed in 1969 to found São Bento Grande, they remain lifelong friends.',
  'Suassuna e Brasília se conheceram na academia de Zé de Freitas em São Paulo (1965). Eles co-fundaram o Cordão de Ouro em 1° de setembro de 1967. Embora Brasília tenha saído em 1969 para fundar o São Bento Grande, eles permanecem amigos por toda a vida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Suassuna' AND o.apelido = 'Brasília'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Suassuna student_of Maneca (primary teacher in Itabuna ~1957-1958)
--   Mestre Maneca was student of Bimba and Zoião; taught Suassuna in Itabuna
--   --> Add Mestre Maneca to backlog
-- Suassuna trained_under Sururú (Itabuna, 1950s)
--   --> Add Mestre Sururú to backlog
-- Suassuna trained_under Bigode de Arame (Itabuna, 1950s)
--   --> Add Mestre Bigode de Arame to backlog
-- Suassuna trained_under Tonho Rale (Itabuna, 1950s)
--   --> Add Mestre Tonho Rale to backlog
-- Suassuna trained_under Maneca Brandão (Itabuna, 1950s)
--   --> Add Mestre Maneca Brandão to backlog
-- Suassuna founded Cordão de Ouro (1967)
--   --> Cordão de Ouro is in groups-backlog
-- Suassuna co_founded Cordão de Ouro (1967)
--   --> Cordão de Ouro is in groups-backlog
-- ============================================================

-- ============================================================
-- STUDENTS (OBJECTS - Suassuna as teacher, statements go in STUDENT files)
-- These are noted for reference but statements belong in student files:
-- ============================================================
-- Lobão student_of Suassuna --> goes in lobao.sql
-- Esdras Filho student_of Suassuna --> goes in esdras-filho.sql
-- Tarzan student_of Suassuna --> goes in tarzan.sql
-- Belisco student_of Suassuna --> goes in belisco.sql
-- Almir das Areias student_of Suassuna --> goes in almir-das-areias.sql
-- Mestre Madeira received_title_from Suassuna --> already in madeira.sql
-- (Many others in Miudinho Generation)
-- ============================================================
