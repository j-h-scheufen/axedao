-- ============================================================
-- STATEMENTS FOR: Edgar (Dois Rios)
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where Edgar is the SUBJECT.
-- ============================================================

-- Edgar associated_with Sete Coroas (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã". Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios. Sete Coroas was from Bahia.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios. Sete Coroas era da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edgar' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Sete Coroas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Edgar associated_with Americano (fellow prisoners at Dois Rios)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": {"en": "Both identified as capoeira rogues imprisoned at Dois Rios Correctional Colony on Ilha Grande", "pt": "Ambos identificados como malandros capoeiras presos na Colônia Correcional de Dois Rios na Ilha Grande"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Paezzo, Sylvan. "Memórias de Madame Satã". Rio de Janeiro: Lidador, 1972.',
  'Mentioned together in Madame Satã''s prison memoirs as capoeira rogues at Dois Rios.',
  'Mencionados juntos nas memórias de prisão de Madame Satã como malandros capoeiras em Dois Rios.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Edgar' AND COALESCE(s.apelido_context, '') = 'Dois Rios'
  AND o.apelido = 'Americano' AND COALESCE(o.apelido_context, '') = 'Dois Rios'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS
-- ============================================================
-- No teacher-student relationships documented for Edgar.
-- No students documented.
-- Madame Satã was not his teacher; they were fellow prisoners.
-- ============================================================
