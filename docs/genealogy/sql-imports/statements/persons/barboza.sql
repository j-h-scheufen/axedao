-- ============================================================
-- STATEMENTS FOR: Barboza
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Barboza is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"membership_context": "Regular participant in Sunday training sessions at Matatu Preto in the 1930s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s. Referred to as "finado Barboza" (the late Barboza) by Canjiquinha, indicating he had passed away by the time of the 1989 testimony.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930. Referido como "finado Barboza" por Canjiquinha, indicando que já havia falecido na época do testemunho de 1989.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Barboza' AND g.name = 'Roda do Matatu Preto'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto training circle led by Aberrê',
  'Parte do círculo de treino do Matatu Preto liderado por Aberrê'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barboza' AND o.apelido = 'Aberrê'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barboza' AND o.apelido = 'Onça Preta'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barboza' AND o.apelido = 'Paulo Barroquinha'
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
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Barboza' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
