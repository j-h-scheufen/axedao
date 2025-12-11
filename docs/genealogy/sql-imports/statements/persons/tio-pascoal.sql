-- ============================================================
-- STATEMENTS FOR: Tio Pascoal
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Tio Pascoal is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"discipline": "mandinga"}'::jsonb,
  'verified'::genealogy.confidence,
  'Marcelino dos Santos, "Capoeira e Mandingas: Cobrinha Verde" (1991); Cobrinha Verde interview',
  'Pascoal taught Cobrinha Verde spiritual practices (mandinga): 65 prayers, patuá creation, corpo fechado. He was not a capoeira teacher but a mandingueiro who transmitted African-Brazilian mystical traditions. Cobrinha said: "The person who gave me this amulet was an African who, to this day, when I speak of him, my eyes fill with tears. He was called Uncle Pascoal."',
  'Pascoal ensinou a Cobrinha Verde práticas espirituais (mandinga): 65 orações, criação de patuá, corpo fechado. Ele não era professor de capoeira, mas um mandingueiro que transmitiu tradições místicas afro-brasileiras. Cobrinha disse: "A pessoa que me deu este amuleto foi um africano que, até hoje, quando falo dele, meus olhos se enchem de lágrimas. Ele se chamava Tio Pascoal."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Tio Pascoal'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
