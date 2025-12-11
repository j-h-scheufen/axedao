-- ============================================================
-- STATEMENTS FOR: Pastinha
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Pastinha is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

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
  '1899-01-01'::date, 'year'::genealogy.date_precision,
  '1902-01-01'::date, 'year'::genealogy.date_precision,
  '{"training_location": "Rua das Laranjeiras, n° 26, Pelourinho, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/pastinha-1899; Pastinha interviews 1964, 1967; papoeira.com',
  'Pastinha learned capoeira from Benedito, an African man from Angola, at age 10 after being bullied. Trained for three years at Benedito''s house. Pastinha spoke of him with "the purest gratitude."',
  'Pastinha aprendeu capoeira com Benedito, um africano de Angola, aos 10 anos após ser intimidado. Treinou por três anos na casa de Benedito. Pastinha falava dele com "a mais pura gratidão."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pastinha' AND o.apelido = 'Benedito'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Aberrê trained_under Pastinha is in statements/persons/aberre.sql (subject's file)
-- NOTE: Cobrinha Verde associated_with Pastinha is in statements/persons/cobrinha-verde.sql (subject's file)

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
  'person'::genealogy.entity_type, p.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, b.id,
  '1941-01-01'::date, 'year'::genealogy.date_precision,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "The two great mestres of Salvador: Pastinha preserved traditional Capoeira Angola while Bimba modernized with Capoeira Regional. Their complementary approaches defined 20th century capoeira. Publicly respectful though some reported tensions."}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; Wikipedia; papoeira.com; lalaue.com',
  'The "two fathers" of modern capoeira: Pastinha (Angola) and Bimba (Regional). Both operated academies in Salvador simultaneously (1941-1973).',
  'Os "dois pais" da capoeira moderna: Pastinha (Angola) e Bimba (Regional). Ambos operavam academias em Salvador simultaneamente (1941-1973).'
FROM genealogy.person_profiles p, genealogy.person_profiles b
WHERE p.apelido = 'Pastinha' AND b.apelido = 'Bimba'
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
  'person'::genealogy.entity_type, p.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the founders/leaders of Gengibirra roda and CECA. Totonho was one of the ''four owners and proprietors'' who passed leadership to Pastinha in 1941."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com; nossa-tribo.com; ceca-riovermelho.org.br',
  'Totonho de Maré was one of the four mestres who handed leadership of Gengibirra to Pastinha in 1941. Both trained at CECA.',
  'Totonho de Maré foi um dos quatro mestres que passaram a liderança de Gengibirra para Pastinha em 1941. Ambos treinavam no CECA.'
FROM genealogy.person_profiles p, genealogy.person_profiles t
WHERE p.apelido = 'Pastinha' AND t.apelido = 'Totonho de Maré'
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
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1941-12-31'::date, 'year'::genealogy.date_precision,
  '{"membership_context": "Invited by Aberrê to attend Sunday roda at Ladeira de Gengibirra in February 1941. Amorzinho asked him to assume leadership. Later registered the center officially as CECA and relocated to Pelourinho."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; Pastinha interviews; velhosmestres.com',
  'On Feb 23, 1941, Aberrê brought Pastinha to the Gengibirra roda. Amorzinho asked Pastinha to preserve traditional capoeira angola. After Amorzinho''s death, the mestres handed leadership to Pastinha, who registered it as CECA.',
  'Em 23 de fevereiro de 1941, Aberrê levou Pastinha à roda do Gengibirra. Amorzinho pediu a Pastinha para preservar a capoeira angola tradicional. Após a morte de Amorzinho, os mestres passaram a liderança para Pastinha, que a registrou como CECA.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Pastinha' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
