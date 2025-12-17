-- ============================================================
-- STATEMENTS FOR: Madeira
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Madeira is the SUBJECT.
-- ============================================================

-- Madeira influenced_by Waldemar
-- Note: The relationship is described as "meetings" that "particularly influenced" him,
-- not formal student-teacher. Using influenced_by.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1990-03-16'::date, 'exact'::genealogy.date_precision, -- Waldemar died March 16, 1990
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'German sources describe Madeira''s relationship to Waldemar as "meetings" (Treffen) that "particularly influenced" (prägten) him. Named his group in honor of Waldemar''s favorite mestre.',
  E'Fontes alemãs descrevem a relação de Madeira com Waldemar como "encontros" (Treffen) que "particularmente o influenciaram" (prägten). Nomeou seu grupo em homenagem ao mestre favorito de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Madeira received_title_from João Pequeno
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
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna." Exact date unknown.',
  E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna." Data exata desconhecida.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Madeira received_title_from Canjiquinha
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
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
  E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna." Canjiquinha died Nov 8, 1994, so title was received before then.',
  E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna." Canjiquinha morreu em 8 de novembro de 1994, então o título foi recebido antes disso.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Madeira' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Madeira received_title_from Suassuna
-- NOTE: Suassuna (Reinaldo Ramos Suassuna) is NOT yet imported.
-- Suassuna is listed in persons-backlog.md as pending.
-- When imported, add this statement:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'received_title_from'::genealogy.predicate,
--   'person'::genealogy.entity_type, o.id,
--   NULL, NULL,
--   NULL, NULL,
--   '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Sources state Madeira "received the honors of a master by João Pequeno, Canjiquinha, and Suassuna."',
--   E'Fontes afirmam que Madeira "recebeu as honras de mestre de João Pequeno, Canjiquinha e Suassuna."'
-- FROM genealogy.person_profiles s, genealogy.person_profiles o
-- WHERE s.apelido = 'Madeira' AND o.apelido = 'Suassuna';

-- Madeira founded Grupo Siri de Mangue
-- NOTE: Grupo Siri de Mangue is NOT yet imported.
-- Grupo Siri de Mangue is listed in groups-backlog.md as pending.
-- When imported, add this statement:
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   NULL, NULL, -- Exact founding year unknown
--   NULL, NULL,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Madeira founded Grupo Siri de Mangue in São Luís, Maranhão, Brazil.',
--   E'Madeira fundou o Grupo Siri de Mangue em São Luís, Maranhão, Brasil.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Madeira' AND o.name = 'Grupo Siri de Mangue';

-- Madeira leads Grupo Siri de Mangue
-- NOTE: Add when Grupo Siri de Mangue is imported.
--
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'leads'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   NULL, NULL,
--   NULL, NULL,
--   '{}'::jsonb, 'verified'::genealogy.confidence,
--   'https://www.siridemangue.com/grupo-sir%C3%AD-de-mangue/',
--   E'Madeira is the founder and current leader of Grupo Siri de Mangue.',
--   E'Madeira é o fundador e atual líder do Grupo Siri de Mangue.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'Madeira' AND o.name = 'Grupo Siri de Mangue';
