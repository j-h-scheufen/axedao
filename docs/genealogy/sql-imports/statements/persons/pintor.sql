-- ============================================================
-- STATEMENTS FOR: Pintor
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Pintor is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- Primary teacher: João Pequeno de Pastinha
-- Additional training in Bahia with multiple mestres
-- ============================================================

-- Pintor student_of João Pequeno (primary teacher, ~1970s-1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'Primary teacher. After training with various mestres in Bahia, Pintor settled on the teaching and practice of Mestre João Pequeno de Pastinha in Salvador. João Pequeno graduated him as Mestre in 1989.',
  E'Mestre principal. Após treinar com vários mestres na Bahia, Pintor estabeleceu-se no ensino e prática de Mestre João Pequeno de Pastinha em Salvador. João Pequeno o graduou como Mestre em 1989.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor received_title_from João Pequeno (Mestre, 1989)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "location": "Escola de Educação Física, Belo Horizonte"}}'::jsonb,
  'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'Graduated as Mestre by João Pequeno in 1989 with Grupo Macaco at Escola de Educação Física in Belo Horizonte. Later also received Mestre of Capoeira Angola title.',
  E'Graduado como Mestre por João Pequeno em 1989 com o Grupo Macaco na Escola de Educação Física em Belo Horizonte. Depois também recebeu título de Mestre de Capoeira Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Atenilo (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Atenilo among other mestres. Atenilo was one of Bimba''s oldest students (45 years).',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Atenilo entre outros mestres. Atenilo era um dos alunos mais antigos de Bimba (45 anos).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Waldemar (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Waldemar among other mestres. Waldemar was the iconic Angola mestre of Liberdade neighborhood.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Waldemar entre outros mestres. Waldemar era o icônico mestre de Angola do bairro da Liberdade.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Canjiquinha (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Canjiquinha among other mestres. Canjiquinha was known as "The Joy of Capoeira."',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Canjiquinha entre outros mestres. Canjiquinha era conhecido como "A Alegria da Capoeira."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Caiçara (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Caiçara among other mestres. Caiçara was known for his bengala (cane) fighting style.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Caiçara entre outros mestres. Caiçara era conhecido por seu estilo de luta com bengala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Bigodinho/Gigante (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Gigante (Bigodinho) among other mestres. Bigodinho was a student of Waldemar.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Gigante (Bigodinho) entre outros mestres. Bigodinho era aluno de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Bigodinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under João Grande (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under João Grande among other mestres. João Grande was one of Pastinha''s two most prepared students.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com João Grande entre outros mestres. João Grande era um dos dois alunos mais preparados de Pastinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pintor trained_under Curió (Bahia training period)
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://taylorsbantus.wordpress.com/gbc-masters-teachers/mestre-pintor/',
  E'As a teenager, Pintor traveled to Bahia and trained under Curió among other mestres. Curió was a disciple of Mestre Pastinha, guardian of the Angola tradition.',
  E'Na adolescência, Pintor viajou para a Bahia e treinou com Curió entre outros mestres. Curió era discípulo de Mestre Pastinha, guardião da tradição Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pintor' AND o.apelido = 'Curió'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS
-- ============================================================

-- Pintor founded Grupo Bantus Capoeira (1991)
-- NOTE: This statement will be active once the group is imported
-- INSERT INTO genealogy.statements ...
-- WHERE s.apelido = 'Pintor' AND o.name = 'Grupo Bantus Capoeira'

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Pintor trained_under Boa Gente - not yet imported
-- Pintor trained_under Bom Cabrito (Mário Bom Cabrito) - not yet imported
-- Pintor trained_under Medicina - not yet imported
-- Pintor trained_under Papo de Santo Amaro - not yet imported
-- Pintor founded Grupo Bantus Capoeira - group not yet imported
