-- ============================================================
-- STATEMENTS FOR: Toni Vargas
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Toni Vargas is the SUBJECT.
-- ============================================================

-- Toni Vargas trained_under Touro (mid-1970s at Grupo Corda Bamba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeirawiki.org, portalcapoeira.com',
  E'Trained at Grupo Corda Bamba in Penha neighborhood; received blue cord (cordel azul); transitioned from Mestre Rony to Touro in mid-1970s before joining Senzala in 1977',
  E'Treinou no Grupo Corda Bamba no bairro da Penha; recebeu cordel azul; transição de Mestre Rony para Touro em meados dos anos 1970 antes de ingressar na Senzala em 1977'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Toni Vargas' AND o.apelido = 'Touro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Toni Vargas student_of Peixinho (1977-1985 at Grupo Senzala)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, capoeirawiki.org, portalcapoeira.com',
  E'Primary mestre relationship; trained at Travessa Angrense academy in Copacabana; received corda vermelha (red cord) in 1985; described as "first graduated Formado" under Peixinho',
  E'Relação de mestre principal; treinou na academia da Travessa Angrense em Copacabana; recebeu corda vermelha em 1985; descrito como "primeiro Formado graduado" por Peixinho'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Toni Vargas' AND o.apelido = 'Peixinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Toni Vargas received_title_from Peixinho (corda vermelha 1985)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1985-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre", "ceremony": "Grupo Senzala graduation"}}'::jsonb,
  'verified'::genealogy.confidence,
  'lalaue.com, capoeirawiki.org, portalcapoeira.com',
  E'Received corda vermelha (red cord) in 1985, signifying mestre status in Grupo Senzala; first Formado graduated by Mestre Peixinho',
  E'Recebeu corda vermelha em 1985, significando status de mestre no Grupo Senzala; primeiro Formado graduado por Mestre Peixinho'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Toni Vargas' AND o.apelido = 'Peixinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Toni Vargas trained_under Rony (1968-mid 1970s) - Mestre Rony needs import first
-- Toni Vargas member_of Grupo Palmares de Capoeira (1968-mid 1970s) - group needs import first
-- Toni Vargas member_of Grupo Corda Bamba (mid-1970s) - group needs import first (in groups-backlog)
-- Toni Vargas member_of Grupo Senzala (1977-present) - group needs import first (in groups-backlog)
