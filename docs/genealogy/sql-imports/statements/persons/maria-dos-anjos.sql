-- ============================================================
-- STATEMENTS FOR: Maria dos Anjos
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Maria dos Anjos is the SUBJECT.
-- ============================================================

-- Maria dos Anjos student_of Doze Homens
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Atenilo testimony in "Atenilo, o relâmpago da Capoeira Regional" (1988) by Mestre Itapoan; Gratidão Capoeira article',
  'Maria dos Anjos and Salomé were both students of Doze Homens according to Mestre Atenilo. Both women were known for their love of batuque and samba.',
  'Maria dos Anjos e Salomé foram ambas alunas de Doze Homens segundo Mestre Atenilo. Ambas as mulheres eram conhecidas por seu amor pelo batuque e samba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria dos Anjos' AND o.apelido = 'Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Maria dos Anjos associated_with Salomé (fellow students)
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Fellow students of Doze Homens; contemporary valentonas of 1920s-1930s Salvador; shared love of batuque and samba"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Atenilo testimony in "Atenilo, o relâmpago da Capoeira Regional" (1988) by Mestre Itapoan',
  'Companions who trained together under Doze Homens. Mestre Atenilo knew them both personally and described them as "mulheres de valor" (women of character).',
  'Companheiras que treinaram juntas com Doze Homens. Mestre Atenilo as conheceu pessoalmente e as descreveu como "mulheres de valor."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Maria dos Anjos' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or unclear)
-- ============================================================
-- Maria dos Anjos associated_with Maria Doze Homens - Both were contemporary valentonas in 1920s-1930s Salvador
--   (Maria Doze Homens exists in dataset but relationship is contextual/contemporary, not direct training/mentorship)
