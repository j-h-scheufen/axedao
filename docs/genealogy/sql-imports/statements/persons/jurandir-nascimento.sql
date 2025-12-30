-- ============================================================
-- STATEMENTS FOR: Jurandir Nascimento
-- Generated: 2025-12-28
-- ============================================================
-- Contains all relationships where Jurandir Nascimento is the SUBJECT.
-- Per ownership rule: statements go in the file named after SUBJECT.
-- ============================================================

-- Jurandir Nascimento student_of Moraes
-- Primary teacher-student relationship. Jurandir was a GCAP pioneer.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://ficahawaii.org/mestre-jurandir/, https://gecasp.wordpress.com/about/',
  E'Jurandir was one of the pioneers of GCAP and trained under Mestre Moraes. He started capoeira in 1970, likely training in Rio de Janeiro where Moraes was based. Sources confirm he was part of the core GCAP group alongside Moraes, Cobra Mansa, and others. Exact start date of training with Moraes unknown.',
  E'Jurandir foi um dos pioneiros do GCAP e treinou com Mestre Moraes. Ele começou a capoeira em 1970, provavelmente treinando no Rio de Janeiro onde Moraes estava baseado. Fontes confirmam que ele fazia parte do grupo central do GCAP junto com Moraes, Cobra Mansa e outros. Data exata de início do treinamento com Moraes desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir Nascimento' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jurandir Nascimento associated_with Cobra Mansa
-- Fellow GCAP pioneer and FICA co-founder
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "GCAP pioneers and FICA co-founders; both participated in Roda de Caxias"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://ficahawaii.org/mestre-jurandir/, https://capoeirahistory.com/pt-br/a-roda-de-caxias-nas-fotos-de-maria-buzanowski/',
  E'Jurandir and Cobra Mansa were both participants in the Roda de Caxias in Rio de Janeiro from 1973. They were both pioneers of GCAP and together with Valmir, co-founded FICA in 1995/1996.',
  E'Jurandir e Cobra Mansa participaram da Roda de Caxias no Rio de Janeiro desde 1973. Ambos foram pioneiros do GCAP e, junto com Valmir, co-fundaram a FICA em 1995/1996.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir Nascimento' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Jurandir Nascimento associated_with Valmir
-- Fellow GCAP member and FICA co-founder
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
  'https://ficahawaii.org/mestre-jurandir/, https://www.lalaue.com/learn-capoeira/mestre-valmir/',
  E'Jurandir and Valmir co-founded FICA in 1995/1996 together with Cobra Mansa. Both were trained at GCAP under Moraes.',
  E'Jurandir e Valmir co-fundaram a FICA em 1995/1996 junto com Cobra Mansa. Ambos treinaram no GCAP com Moraes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Jurandir Nascimento' AND o.apelido = 'Valmir'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- These relationships require the object entity to be imported first.
-- Add to persons-backlog.md and groups-backlog.md as appropriate.
-- ============================================================

-- Person-to-Group relationships (groups not yet imported):
-- Jurandir Nascimento co_founded GCAP - was a pioneer of GCAP in early 1980s
-- Jurandir Nascimento co_founded FICA - co-founded 1995/1996 with Cobra Mansa and Valmir
-- Jurandir Nascimento founded N'GOLO Angola - founded 1990 in Minas Gerais
-- Jurandir Nascimento leads FICA - president of ICAF

-- Person-to-Person relationships (persons not yet imported):
-- Silvinho student_of Jurandir Nascimento - trained under Jurandir; led FICA-BH 8 years; succeeded him at ICAF Seattle 2004
-- Rogerio Teber received_title_from Jurandir Nascimento - titled mestre 2013 by Jurandir, Cobra Mansa, and Valmir
-- Jurandir Nascimento associated_with Russo de Caxias - Roda de Caxias participants
-- Jurandir Nascimento associated_with Peixe (Caxias) - Roda de Caxias participants
-- Jurandir Nascimento associated_with Rogério (Caxias) - Roda de Caxias participants
-- Jurandir Nascimento associated_with Manoel (Caxias) - Roda de Caxias participants

-- Note: When these persons/groups are imported, their relationship statements
-- should go in THEIR respective statement files per ownership rule.
