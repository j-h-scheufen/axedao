-- ============================================================
-- STATEMENTS FOR: Poeira
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Poeira is the SUBJECT.
-- ============================================================

-- Poeira student_of Roque
-- Training began 1978 per CapoeiraHub
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://www.capoeirahub.net/mestres/693b4f40abbd160015a637aa-mestre-poeira',
  E'Poeira began training with Mestre Roque in 1978 per CapoeiraHub. This was during Roque''s later teaching career after leaving Pavão/Pavãozinho.',
  E'Poeira começou a treinar com Mestre Roque em 1978 conforme CapoeiraHub. Isso foi durante a fase posterior da carreira de ensino de Roque após deixar o Pavão/Pavãozinho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Poeira' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Poeira founded Grupo Pantera - needs group import first
-- Note: Group is in backlog as "Grupo de Capoeira Pantera" / "Grupo Pantera"
