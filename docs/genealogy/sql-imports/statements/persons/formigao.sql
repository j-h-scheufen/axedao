-- ============================================================
-- STATEMENTS FOR: Formigão
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Formigão is the subject.
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
  'person', formigao.id,
  'associated_with',
  'person', adama.id,
  '1907-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow valentões involved in disturbances on a train returning from a religious festival in 1907. Both were part of Recife''s network of capoeiristas and tough men during the First Republic era"., "pt": "Valentões companheiros envolvidos em distúrbios em um trem que retornava de uma festividade religiosa em 1907. Ambos faziam parte da rede de capoeiristas e valentões do Recife durante a era da Primeira República".}}'::jsonb,
  'likely'::genealogy.confidence,
  'Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife"',
  'Documented association from 1907 train incident returning from religious festival.',
  'Associação documentada do incidente do trem de 1907 retornando de festividade religiosa.'
FROM genealogy.person_profiles formigao, genealogy.person_profiles adama
WHERE formigao.apelido = 'Formigão' AND adama.apelido = 'Adama'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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
  'person', formigao.id,
  'associated_with',
  'person', eleuterio.id,
  '1907-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow valentões involved in disturbances on a train returning from a religious festival in 1907. Both were part of Recife''s network of capoeiristas and tough men during the First Republic era"., "pt": "Valentões companheiros envolvidos em distúrbios em um trem que retornava de uma festividade religiosa em 1907. Ambos faziam parte da rede de capoeiristas e valentões do Recife durante a era da Primeira República".}}'::jsonb,
  'likely'::genealogy.confidence,
  'Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife"',
  'Documented association from 1907 train incident returning from religious festival.',
  'Associação documentada do incidente do trem de 1907 retornando de festividade religiosa.'
FROM genealogy.person_profiles formigao, genealogy.person_profiles eleuterio
WHERE formigao.apelido = 'Formigão' AND eleuterio.apelido = 'Eleutério'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
