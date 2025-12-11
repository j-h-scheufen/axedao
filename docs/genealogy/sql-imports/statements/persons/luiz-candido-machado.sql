-- ============================================================
-- STATEMENTS FOR: Luiz Cândido Machado
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Luiz Cândido Machado is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"discipline": "batuque"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; Bimba credited father for batuque training; Waldeloir Rego 1968',
  'Bimba learned batuque techniques from his father, who was a champion of this combat sport. These techniques (banda armada, banda fechada, encruzilhada, rapa, cruz de carreira, baú) were later incorporated into Capoeira Regional.',
  'Bimba aprendeu técnicas de batuque de seu pai, que era campeão deste esporte de combate. Essas técnicas (banda armada, banda fechada, encruzilhada, rapa, cruz de carreira, baú) foram posteriormente incorporadas à Capoeira Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Luiz Cândido Machado'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1899-11-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "parent"}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; universally documented as Bimba''s father',
  'Luiz Cândido Machado was Mestre Bimba''s father. Bimba was born November 23, 1899.',
  'Luiz Cândido Machado foi o pai de Mestre Bimba. Bimba nasceu em 23 de novembro de 1899.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Luiz Cândido Machado'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
