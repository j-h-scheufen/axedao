-- ============================================================
-- STATEMENTS FOR: Valmir
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Valmir is the SUBJECT.
-- ============================================================

-- Valmir student_of Moraes (GCAP 1982-1994)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-01-01'::date, 'year'::genealogy.date_precision,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-valmir/, https://clinicadecapoeira.wordpress.com/mestres-2/mestres/',
  'Primary teacher at GCAP from 1982 until Valmir left in 1994',
  'Professor principal no GCAP de 1982 até Valmir sair em 1994'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valmir' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valmir student_of Cobra Mansa (GCAP 1982-1994)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-01-01'::date, 'year'::genealogy.date_precision,
  '1994-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-valmir/, https://clinicadecapoeira.wordpress.com/mestres-2/mestres/',
  'Teacher at GCAP alongside Moraes; later co-founded FICA together',
  'Professor no GCAP junto com Moraes; depois co-fundaram a FICA juntos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valmir' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valmir received_title_from Moraes (contra-mestre 1992)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1992-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://clinicadecapoeira.wordpress.com/mestres-2/mestres/',
  'Received contra-mestre title mid-1992; Moraes was GCAP leader, likely conferred the title',
  'Recebeu título de contra-mestre em meados de 1992; Moraes era líder do GCAP, provavelmente conferiu o título'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valmir' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valmir associated_with Jurandir Nascimento (FICA co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1995-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "FICA co-founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-valmir/, https://ficahawaii.org/mestre-jurandir/',
  'Valmir and Jurandir co-founded FICA in 1995/1996 together with Cobra Mansa. Both were trained at GCAP under Moraes.',
  'Valmir e Jurandir co-fundaram a FICA em 1995/1996 junto com Cobra Mansa. Ambos treinaram no GCAP com Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valmir' AND o.apelido = 'Jurandir Nascimento'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Valmir member_of GCAP (1982-1994) - group not yet imported
-- Valmir departed_from GCAP (1994) - group not yet imported
-- Valmir co_founded FICA (1995/1996) - group not yet imported
-- Valmir leads FICA-Bahia/FICA-Salvador (1996-2023) - group not yet imported
-- Valmir departed_from FICA (2023) - group not yet imported
-- Valmir founded ICAA/Alagbedé (2023) - group not yet imported
-- Valmir leads ICAA/Alagbedé (2023-present) - group not yet imported
