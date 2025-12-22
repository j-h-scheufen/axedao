-- ============================================================
-- STATEMENTS FOR: Curió Velho (Pedro Virício)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Curió Velho is the SUBJECT.
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Curió Velho family_of Malvadeza (father-son relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "parent"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-25',
  E'Pedro Virício (Curió Velho) was the father of José Martins dos Santos (Malvadeza). He taught his son capoeira, continuing the family tradition.',
  E'Pedro Virício (Curió Velho) era o pai de José Martins dos Santos (Malvadeza). Ele ensinou capoeira a seu filho, continuando a tradição familiar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Curió Velho' AND o.apelido = 'Malvadeza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Relationships where Curió Velho is OBJECT:
-- ============================================================
-- Malvadeza student_of Curió Velho - to add to malvadeza.sql
-- Curió student_of Curió Velho - to add to curio.sql (family training from 1943)
