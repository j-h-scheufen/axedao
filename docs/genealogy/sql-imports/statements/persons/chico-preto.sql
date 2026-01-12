-- ============================================================
-- STATEMENTS FOR: Chico Preto
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Chico Preto is the SUBJECT.
-- ============================================================

-- Chico Preto family_of Roque (father-son relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"relationship_type": "parent"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-roque-1938/',
  'Chico Preto is the father of Mestre Roque (born 1938). Multiple sources confirm this.',
  'Chico Preto e o pai de Mestre Roque (nascido em 1938). Multiplas fontes confirmam isto.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Preto' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Preto family_of Zé Bedeu (brother relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  'Brothers - documented through biography of Chico Preto''s son Mestre Roque, who describes Zé Bedeu as his uncle (tio). Zé Bedeu was also a capoeirista and father of Marco Buscapé.',
  'Irmãos - documentado através da biografia do filho de Chico Preto, Mestre Roque, que descreve Zé Bedeu como seu tio. Zé Bedeu também era capoeirista e pai de Marco Buscapé.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Preto' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Chico Preto associated_with [Unnamed Tailor] - tailor identity unknown
--   Note: Tailor lived on Peru hill near Largo do Tanque
--   This friend became Roque's first capoeira teacher in 1948
--   Source: capoeirahistory.com
