-- ============================================================
-- STATEMENTS FOR: Vitor Agaú
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Vitor Agaú is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- NOTE: Onça Preta student_of Vitor Agaú is in statements/persons/onca-preta.sql (subject's file)

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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra. Vitor H.D. is listed in Mestre Pastinha''s account of the mestres present when Amorzinho passed leadership to Pastinha".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; capoeira.fandom.com/wiki/Mestre_Pastinha',
  E'Both were among the mestres present when civil guard Amorzinho passed leadership of the traditional roda at Gengibirra to Pastinha, founding CECA on February 23, 1941.',
  E'Ambos estavam entre os mestres presentes quando o guarda civil Amorzinho passou a liderança da roda tradicional no Gengibirra para Pastinha, fundando o CECA em 23 de fevereiro de 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles p
WHERE v.apelido = 'Vitor Agaú' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Aberrê (CECA founding mestres)
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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941 at Ladeira de Pedra in Gengibirra".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account via jogodavidaweb.wordpress.com; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles a
WHERE v.apelido = 'Vitor Agaú' AND a.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Noronha (CECA founding mestres)
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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, n.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941. Noronha was one of the four ''donos e proprietários'' of Gengibirra".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles n
WHERE v.apelido = 'Vitor Agaú' AND n.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Amorzinho (CECA founding mestres)
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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the founding mestres of Gengibirra/CECA. Amorzinho was one of the four organizational leaders who passed leadership to Pastinha in 1941".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts; velhosmestres.com',
  'Both were among the founding mestres of Gengibirra and present at CECA''s establishment. Amorzinho died in 1943.',
  'Ambos estavam entre os mestres fundadores do Gengibirra e presentes no estabelecimento do CECA. Amorzinho morreu em 1943.'
FROM genealogy.person_profiles v, genealogy.person_profiles a
WHERE v.apelido = 'Vitor Agaú' AND a.apelido = 'Amorzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vitor Agaú associated_with Livino (CECA founding mestres)
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
  'person'::genealogy.entity_type, v.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, l.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both present at the founding of CECA on February 23, 1941. Livino was one of the four ''donos e proprietários'' of Gengibirra".}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts',
  'Both were among the founding mestres present at CECA''s establishment in 1941.',
  'Ambos estavam entre os mestres fundadores presentes no estabelecimento do CECA em 1941.'
FROM genealogy.person_profiles v, genealogy.person_profiles l
WHERE v.apelido = 'Vitor Agaú' AND l.apelido = 'Livino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
