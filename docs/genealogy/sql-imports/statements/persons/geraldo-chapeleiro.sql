-- ============================================================
-- STATEMENTS FOR: Geraldo Chapeleiro
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Geraldo Chapeleiro is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra (Gengibirra).',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra (Gengibirra).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Geraldo Chapeleiro' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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
  '{"membership_context": "Regular participant in Sunday training sessions at Matatu Preto in the 1930s".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com',
  'Regular at the Matatu Preto Sunday training sessions in Salvador during the 1930s, alongside Aberrê, Onça Preta, Totonho de Maré, and others.',
  'Frequentador das sessões de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Onça Preta, Totonho de Maré e outros.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Geraldo Chapeleiro' AND g.name = 'Roda do Matatu Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
