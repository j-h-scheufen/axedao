-- ============================================================
-- STATEMENTS FOR: Rogério Teber
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Rogério Teber is the SUBJECT.
-- ============================================================

-- Rogério Teber trained_under Jurandir Nascimento (FICA mentor 1998-2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1998-01-01'::date, 'year'::genealogy.date_precision,
  '2018-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'FICA mentor from 1998 affiliation until 2018 departure; helped guide his development within FICA',
  'Mentor na FICA desde afiliação em 1998 até saída em 2018; ajudou a guiar seu desenvolvimento dentro da FICA'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Jurandir Nascimento'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber trained_under Cobra Mansa (FICA co-founder mentor 1998-2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1998-01-01'::date, 'year'::genealogy.date_precision,
  '2018-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'FICA co-founder and mentor from 1998 affiliation until 2018 departure',
  'Co-fundador da FICA e mentor desde afiliação em 1998 até saída em 2018'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber trained_under Valmir (FICA co-founder mentor 1998-2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1998-01-01'::date, 'year'::genealogy.date_precision,
  '2018-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'FICA co-founder and mentor from 1998 affiliation until 2018 departure',
  'Co-fundador da FICA e mentor desde afiliação em 1998 até saída em 2018'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Valmir'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Jurandir Nascimento (Mestre 2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2013-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "FICA International Conference", "location": "Belo Horizonte, Brazil"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'Received Mestre title at FICA International Conference in Belo Horizonte, 2013, from Jurandir, Cobra Mansa, and Valmir',
  'Recebeu título de Mestre na Conferência Internacional da FICA em Belo Horizonte, 2013, de Jurandir, Cobra Mansa e Valmir'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Jurandir Nascimento'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Cobra Mansa (Mestre 2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2013-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "FICA International Conference", "location": "Belo Horizonte, Brazil"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'Received Mestre title at FICA International Conference in Belo Horizonte, 2013, from Jurandir, Cobra Mansa, and Valmir',
  'Recebeu título de Mestre na Conferência Internacional da FICA em Belo Horizonte, 2013, de Jurandir, Cobra Mansa e Valmir'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Valmir (Mestre 2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2013-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "FICA International Conference", "location": "Belo Horizonte, Brazil"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites, ECA Renascer',
  'Received Mestre title at FICA International Conference in Belo Horizonte, 2013, from Jurandir, Cobra Mansa, and Valmir',
  'Recebeu título de Mestre na Conferência Internacional da FICA em Belo Horizonte, 2013, de Jurandir, Cobra Mansa e Valmir'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Valmir'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Jurandir Nascimento (Contramestre 2003)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2003-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites',
  'Received second Contramestre title for ICAF from Mestres Jurandir, Cobra Mansa, and Valmir in 2003',
  'Recebeu segundo título de Contramestre para ICAF dos Mestres Jurandir, Cobra Mansa e Valmir em 2003'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Jurandir Nascimento'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Cobra Mansa (Contramestre 2003)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2003-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites',
  'Received second Contramestre title for ICAF from Mestres Jurandir, Cobra Mansa, and Valmir in 2003',
  'Recebeu segundo título de Contramestre para ICAF dos Mestres Jurandir, Cobra Mansa e Valmir em 2003'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rogério Teber received_title_from Valmir (Contramestre 2003)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2003-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb,
  'verified'::genealogy.confidence,
  'FICA websites',
  'Received second Contramestre title for ICAF from Mestres Jurandir, Cobra Mansa, and Valmir in 2003',
  'Recebeu segundo título de Contramestre para ICAF dos Mestres Jurandir, Cobra Mansa e Valmir em 2003'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rogério Teber' AND o.apelido = 'Valmir'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Rogério Teber student_of Manoel (Ypiranga de Pastinha)
-- Primary teacher in GCAP Rio 1985-1996; gave Contramestre title 1999
-- PENDING: Mestre Manoel (Grupo Ypiranga de Pastinha) not yet imported

-- Rogério Teber received_title_from Manoel (Contramestre 1999)
-- Received first Contramestre title from Mestre Manoel in 1999
-- PENDING: Mestre Manoel (Grupo Ypiranga de Pastinha) not yet imported

-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Rogério Teber member_of GCAP (1985-1996) - trained at GCAP Rio under Mestre Manoel
-- PENDING: GCAP group not yet imported

-- Rogério Teber founded FICA Oakland (1998) - after initial Renascer group was incorporated into FICA
-- PENDING: FICA Oakland group not yet imported

-- Rogério Teber founded Quilombo Cultural México-Brasil FICA (2004)
-- PENDING: Quilombo Cultural group not yet imported

-- Rogério Teber founded ECA Renascer (2018)
-- PENDING: ECA Renascer group not yet imported

-- Rogério Teber departed_from FICA (2018) - separated to continue personal work
-- departure_type: neutral (amicable separation to follow own path)
-- PENDING: FICA group not yet imported

-- ============================================================
-- STUDENT RELATIONSHIPS (will be in their files when imported)
-- ============================================================

-- Daniel Mattar trained_under Rogério Teber (2002-2020, FICA Oakland)
-- Oscar González trained_under Rogério Teber (2012-2018, FICA Xalapa)
-- Andreia (Andrea) trained_under Rogério Teber (FICA Oakland)
-- Javier trained_under Rogério Teber (FICA Mexico)
-- Amaranta trained_under Rogério Teber (FICA Mexico)
