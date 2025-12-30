-- ============================================================
-- STATEMENTS FOR: Adama
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Adama is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source
)
SELECT
  'person', adama.id,
  'associated_with',
  'person', ng.id,
  '{"association_context": {"en": "Both were among the legendary valentões of Recife during the First Republic era. Sources describe them as the two greatest valentões of the city. Both were capoeiristas who dominated the carnival culture and street life of Recife.", "pt": "Ambos estavam entre os lendários valentões do Recife durante a era da Primeira República. Fontes os descrevem como os dois maiores valentões da cidade. Ambos eram capoeiristas que dominavam a cultura carnavalesca e a vida nas ruas do Recife."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Oscar Mello, "Recife Sangrento" (1937); Academia.edu: Capoeira e capoeiras entre a Guarda Negra'
FROM genealogy.person_profiles adama, genealogy.person_profiles ng
WHERE adama.apelido = 'Adama' AND ng.apelido = 'Nascimento Grande'
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
  'person', adama.id,
  'associated_with',
  'person', eleuterio.id,
  '1907-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow valentões involved in disturbances on a train returning from a religious festival in 1907. Both were part of Recife''s network of capoeiristas and tough men during the First Republic era.", "pt": "Valentões companheiros envolvidos em distúrbios em um trem que retornava de uma festividade religiosa em 1907. Ambos faziam parte da rede de capoeiristas e valentões do Recife durante a era da Primeira República."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife"; Jornal Pequeno Nov 9, 1938',
  'Documented association from 1907 train incident returning from religious festival.',
  'Associação documentada do incidente do trem de 1907 retornando de festividade religiosa.'
FROM genealogy.person_profiles adama, genealogy.person_profiles eleuterio
WHERE adama.apelido = 'Adama' AND eleuterio.apelido = 'Eleutério'
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
  'person', adama.id,
  'associated_with',
  'person', formigao.id,
  '1907-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": {"en": "Fellow valentões involved in disturbances on a train returning from a religious festival in 1907. Both were part of Recife''s network of capoeiristas and tough men during the First Republic era.", "pt": "Valentões companheiros envolvidos em distúrbios em um trem que retornava de uma festividade religiosa em 1907. Ambos faziam parte da rede de capoeiristas e valentões do Recife durante a era da Primeira República."}}'::jsonb,
  'likely'::genealogy.confidence,
  'Israel Ozanam, "Capoeira e capoeiras entre a Guarda Negra e a Educação Física no Recife"',
  'Documented association from 1907 train incident returning from religious festival.',
  'Associação documentada do incidente do trem de 1907 retornando de festividade religiosa.'
FROM genealogy.person_profiles adama, genealogy.person_profiles formigao
WHERE adama.apelido = 'Adama' AND formigao.apelido = 'Formigão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
