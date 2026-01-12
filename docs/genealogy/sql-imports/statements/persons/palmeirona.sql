-- ============================================================
-- STATEMENTS FOR: Palmeirona
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Palmeirona is the SUBJECT.
-- ============================================================

-- Palmeirona trained_under Pastinha
-- (trained_under rather than student_of because Pastinha was
-- one of multiple teachers and was himself very young at the time)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1902-01-01'::date, 'year'::genealogy.date_precision,
  '1911-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'velhosmestres.com/br/pastinha-1969-3',
  'Pastinha stated these women "learned the art not only with Mestre Pastinha but also with other masters of the time" during 1902-1911. Pastinha was 13-22 years old during this period.',
  'Pastinha afirmou que essas mulheres "aprenderam a arte não só com Mestre Pastinha mas também com outros mestres da época" durante 1902-1911. Pastinha tinha 13-22 anos durante este período.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Palmeirona' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE ON CONTEMPORARIES
-- ============================================================
-- Palmeirona was listed alongside Maria Homem, Júlia Fogareira,
-- and Maria Pernambucana by Pastinha. However, we do NOT generate
-- associated_with statements for mere contemporaries per the
-- import guidelines. These relationships are documented in the
-- bio text and notes only.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships - only known relationship is with
-- Pastinha (already in dataset)
