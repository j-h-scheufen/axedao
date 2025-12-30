-- ============================================================
-- STATEMENTS FOR: Chico Três Pedaços
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Chico Três Pedaços is the subject.
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
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s, alongside Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Paulo Barroquinha, and Barboza.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Paulo Barroquinha e Barboza.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Chico Três Pedaços' AND g.name = 'Roda do Matatu Preto'
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
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Aberrê'
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
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Geraldo Chapeleiro'
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
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Onça Preta'
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
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Paulo Barroquinha'
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
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Creoni'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
