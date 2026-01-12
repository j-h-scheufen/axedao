-- ============================================================
-- STATEMENTS FOR: Índio (Mercado Modelo)
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Índio (Mercado Modelo) is the SUBJECT.
-- Note: Uses apelido_context = 'Mercado Modelo' to distinguish
-- ============================================================

-- Índio (Mercado Modelo) student_of Pelé da Bomba
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiradomercado.com, esquiva.wordpress.com, grupoliberdadecapoeira.com.br',
  E'Primary teacher-student relationship. Pelé da Bomba (Natalício Neves da Silva) taught Índio capoeira in Salvador. Multiple sources confirm this lineage. Pelé da Bomba reportedly told him: "Pode ir para o mundo, você é Mestre de Capoeira" (You can go into the world, you are a Master of Capoeira).',
  E'Relação primária mestre-aluno. Pelé da Bomba (Natalício Neves da Silva) ensinou capoeira a Índio em Salvador. Múltiplas fontes confirmam essa linhagem. Pelé da Bomba supostamente disse-lhe: "Pode ir para o mundo, você é Mestre de Capoeira".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Índio' AND s.apelido_context = 'Mercado Modelo'
  AND o.apelido = 'Pelé da Bomba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Índio (Mercado Modelo) trained_under Camafeu de Oxóssi
-- Informal training environment at Mercado Modelo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'lugaresdememoria.com.br',
  E'Per lugaresdememoria.com.br, Camafeu de Oxóssi at Mercado Modelo "formou capoeiristas famosos como Manoel Olímpio, o popular Mestre Índio." This likely represents informal environment influence at the Mercado Modelo rodas rather than formal teacher-student relationship. Pelé da Bomba remains primary teacher.',
  E'Segundo lugaresdememoria.com.br, Camafeu de Oxóssi no Mercado Modelo "formou capoeiristas famosos como Manoel Olímpio, o popular Mestre Índio." Isso provavelmente representa influência do ambiente informal nas rodas do Mercado Modelo em vez de relação formal mestre-aluno. Pelé da Bomba permanece como mestre principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Índio' AND s.apelido_context = 'Mercado Modelo'
  AND o.apelido = 'Camafeu de Oxóssi'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Índio (Mercado Modelo) received_title_from Pelé da Bomba
-- Pelé da Bomba recognized him as Mestre
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'esquiva.wordpress.com, grupoliberdadecapoeira.com.br',
  E'Pelé da Bomba recognized Índio as mestre, reportedly saying: "Pode ir para o mundo, você é Mestre de Capoeira" (You can go into the world, you are a Master of Capoeira). Date unknown but likely before 1968 when he founded Grupo Oxóssi.',
  E'Pelé da Bomba reconheceu Índio como mestre, supostamente dizendo: "Pode ir para o mundo, você é Mestre de Capoeira". Data desconhecida mas provavelmente antes de 1968 quando ele fundou o Grupo Oxóssi.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Índio' AND s.apelido_context = 'Mercado Modelo'
  AND o.apelido = 'Pelé da Bomba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Índio (Mercado Modelo) founded Grupo de Capoeira Oxóssi (1968) - GROUP NOT IN DATASET
--   → Add to groups-backlog.md
--
-- Índio (Mercado Modelo) family_of Mestre Cacau (brother) - PERSON NOT IN DATASET
--   → Add to persons-backlog.md
--
-- Bira de Oxóssi student_of Índio (Mercado Modelo) - goes in bira-de-oxossi.sql (subject)
--   → Add Bira de Oxóssi to persons-backlog.md
--
-- Karcará student_of Índio (Mercado Modelo) - goes in karcara.sql (subject)
--   → Add Karcará to persons-backlog.md
--
-- Mestre Capelão student_of Índio (Mercado Modelo) - goes in capelao.sql (subject)
--   → Add Mestre Capelão to persons-backlog.md
--
-- Mestre Pedreiro student_of Índio (Mercado Modelo) - goes in pedreiro.sql (subject)
--   → Add Mestre Pedreiro to persons-backlog.md
--
-- Mestre Egeo student_of Índio (Mercado Modelo) - goes in egeo.sql (subject)
--   → Add Mestre Egeo to persons-backlog.md
-- ============================================================
