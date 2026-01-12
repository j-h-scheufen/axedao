-- ============================================================
-- STATEMENTS FOR: Evanir
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Evanir is the SUBJECT.
--
-- NOTE: Evanir was listed alongside Zacarias, Cabelo Bom, Tatá,
-- Chita, Macário, Sete Molas as "snakes, experts" at Waldemar's
-- roda, but these are documented as contemporaries in bio/notes,
-- not as associated_with statements (no specific interactions).
-- ============================================================

-- Evanir associated_with João Grande (documented rivalry and reconciliation)
-- Multiple incidents: injury at Conceição da Praia, two-hour Carnival battle, became friends
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "rivalry that became friendship after two-hour Carnival battle"}'::jsonb,
  'verified'::genealogy.confidence,
  'João Grande interview with Poloca, Sept 1, 2004 (Capoeira Connection)',
  'Multiple documented encounters: Evanir injured João Grande''s face at Conceição da Praia (Dec 8); estranged for one year; reconciled after exhausting two-hour Carnival battle; "we became friends"',
  'Múltiplos encontros documentados: Evanir feriu o rosto de João Grande na Conceição da Praia (8 dez); afastados por um ano; reconciliaram após exaustiva batalha de duas horas no Carnaval; "nos tornamos amigos"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Evanir' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Evanir associated_with Antônio Cabeceiro (documented incident at Waldemar's roda)
-- Cabeceiro bought the game from João Grande who was playing with Evanir
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "contemporaries at Waldemar''s roda; present during documented incident"}'::jsonb,
  'verified'::genealogy.confidence,
  'João Grande interview with Poloca, Sept 1, 2004 (Capoeira Connection)',
  'Cabeceiro bought the game from João Grande who was playing with Evanir, then threw JG into the street',
  'Cabeceiro comprou o jogo de João Grande que estava jogando com Evanir, depois jogou JG na rua'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Evanir' AND o.apelido = 'Antônio Cabeceiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (documented in bio/notes, NOT as statements)
-- ============================================================
-- The following were listed by João Grande among "snakes, experts"
-- at Waldemar's roda, but no specific interactions documented:
-- - Zacarias Boa Morte
-- - Cabelo Bom (Bom Cabelo)
-- - Tatá (pending import)
-- - Chita (pending import)
-- - Macário (pending import)
-- - Sete Molas (pending import)
-- - Bugalho (played berimbau at Conceição da Praia roda)
--
-- These relationships are documented in:
-- - Entity SQL: notes_en/notes_pt TRAINING COMPANIONS section
-- - Person report: Connections table
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Evanir associated_with Natividade (Raimundo Natividade) - Pastinha student whom Evanir was defeating at Carnival roda; needs import first
-- (This IS a valid associated_with - documented fight/conflict)
