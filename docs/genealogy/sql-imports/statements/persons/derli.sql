-- ============================================================
-- STATEMENTS FOR: Derli
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Derli is the SUBJECT.
-- ============================================================

-- Derli student_of Roque
-- Primary teacher; trained on streets of Ipanema/Zona Sul (~1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cidadededeus.org.br, capoeirahistory.com',
  'Primary teacher; started practicing after being rescued from streets at age ~9-10',
  'Mestre principal; começou a praticar após ser resgatado das ruas aos ~9-10 anos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Derli' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Derli founded Grupo Aliança Ariri - needs group import first
-- Derli leads Grupo Aliança Ariri - needs group import first
-- Derli associated_with Grupo Filhos de Angola - needs group import first (pending in groups-backlog)
