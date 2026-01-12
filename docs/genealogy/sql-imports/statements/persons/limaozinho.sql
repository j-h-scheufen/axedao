-- ============================================================
-- STATEMENTS FOR: Limãozinho
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Limãozinho is the SUBJECT.
-- Limãozinho (José Carlos dos Santos, 1957-) nephew and student of Mestre Limão
-- ============================================================

-- Limãozinho student_of Limão (uncle, primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '1985-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'IPHAN Capoeira, Diário Causa Operária, Lelecapoeira.com',
  'Began training at age 8 (1965) with uncle Mestre Limão; one of only three students taught Capoeira Angola by Limão (others: Silvio Acarajé, Jorginho); training ended with Limão''s death in 1985',
  'Começou a treinar aos 8 anos (1965) com tio Mestre Limão; um dos apenas três alunos ensinados Capoeira Angola por Limão (outros: Silvio Acarajé, Jorginho); treino terminou com a morte de Limão em 1985'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Limão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limãozinho trained_under Silvestre (influence per IPHAN)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'IPHAN Capoeira profile',
  'Listed as influence on IPHAN profile; Silvestre trained at Academia Quilombo dos Palmares with Limão',
  'Listado como influência no perfil IPHAN; Silvestre treinou na Academia Quilombo dos Palmares com Limão'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Silvestre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limãozinho trained_under Pinatti (influence per IPHAN)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'IPHAN Capoeira profile',
  'Listed as influence on IPHAN profile; Pinatti co-founded Academia São Bento Pequeno with Limão',
  'Listado como influência no perfil IPHAN; Pinatti co-fundou Academia São Bento Pequeno com Limão'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Pinatti'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limãozinho trained_under Suassuna (influence per IPHAN)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'IPHAN Capoeira profile',
  'Listed as influence on IPHAN profile; Suassuna was part of São Paulo capoeira community with Limão',
  'Listado como influência no perfil IPHAN; Suassuna fazia parte da comunidade de capoeira de São Paulo com Limão'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limãozinho received_title_from Limão (contra-mestre 1972)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1972-12-03'::date, 'exact'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'Diário Causa Operária, IPHAN Capoeira',
  'Received contra-mestre title December 3, 1972, at age 15; began teaching in São Paulo same year',
  'Recebeu título de contra-mestre em 3 de dezembro de 1972, aos 15 anos; começou a ensinar em São Paulo no mesmo ano'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Limão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limãozinho family_of Limão (nephew)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "nephew"}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources',
  'Limãozinho is the nephew of Mestre Limão; family connection through Santo Amaro da Purificação',
  'Limãozinho é sobrinho de Mestre Limão; conexão familiar através de Santo Amaro da Purificação'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limãozinho' AND o.apelido = 'Limão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Limãozinho associated_with Silvio Acarajé - PERSON NOT IN DATASET
--   Fellow Angola student under Limão; nephew of Limão; later became Limãozinho's brother-in-law
--   Silvio dos Santos (1954-1996); they collaborated on preserving rare berimbau toques
--   Limãozinho's album track "Sylvio Acarajé no Reino do Senhor" honors him
--
-- Limãozinho associated_with Jorginho (Limão student) - PERSON NOT IN DATASET
--   One of three students taught Angola by Mestre Limão
--
-- Limãozinho teaches_at Fábio Lima (student, Piracicaba) - PERSON NOT IN DATASET
--   Student of Limãozinho; teaches at Centro Cultural Zazá, Piracicaba
--
-- Limãozinho founded TOCA - GROUP NOT IN DATASET
--   Terreiro Original de Capoeira Angola Centro de Cultura e Arte
--   Evolved from Quilombinho; his primary organization
--
-- Limãozinho founded Quilombinho - GROUP NOT IN DATASET
--   First academy founded by Limãozinho in early 1970s; later became TOCA
--
-- Limãozinho member_of Academia Quilombo dos Palmares (SP) - GROUP NOT IN DATASET
--   Trained at his uncle Limão's academy
