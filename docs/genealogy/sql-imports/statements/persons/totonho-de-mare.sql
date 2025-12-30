-- ============================================================
-- STATEMENTS FOR: Totonho de Maré
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Totonho de Maré is the subject.
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
  'Mestre Canjiquinha testimony (1989); velhosmestres.com',
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s, alongside Aberrê, Onça Preta, Geraldo Chapeleiro, Creoni, Chico Três Pedaços, Paulo Barroquinha, and Barboza.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Onça Preta, Geraldo Chapeleiro, Creoni, Chico Três Pedaços, Paulo Barroquinha e Barboza.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Totonho de Maré' AND g.name = 'Roda do Matatu Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

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
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Amorzinho. One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Amorzinho. Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Totonho de Maré' AND g.name = 'Gengibirra'
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
  'leads'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{"leadership_role": "dono_proprietario", "context": "One of four organizational leaders recognized by Noronha; leadership ended when center was handed to Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com/mestre-totonho-de-mare/',
  'One of four "donos e proprietários" providing organizational leadership. Term indicates custodianship/leadership, not property ownership (Ladeira de Pedra was a public street).',
  'Um dos quatro "donos e proprietários" fornecendo liderança organizacional. O termo indica custódia/liderança, não propriedade (Ladeira de Pedra era uma rua pública).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Totonho de Maré' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1936-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Edison Carneiro named them together as the two aces of capoeira in Bahia: the fisherman Samuel Querido de Deus and the docker Maré."}'::jsonb,
  'verified'::genealogy.confidence,
  'Edison Carneiro, Negros Bantus (1937); velhosmestres.com',
  'Edison Carneiro declared in 1936-1937 that "the aces of capoeira in Bahia were the fisherman Samuel Querido de Deus and the docker Maré". Both were first-generation mestres active in Salvador in the 1930s.',
  'Edison Carneiro declarou em 1936-1937 que "os ases da capoeira na Bahia eram o pescador Samuel Querido de Deus e o estivador Maré". Ambos eram mestres da primeira geração ativos em Salvador nos anos 1930.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Totonho de Maré' AND o.apelido = 'Querido de Deus'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
