-- ============================================================
-- STATEMENTS FOR: Amorzinho
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Amorzinho is the subject.
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
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, n.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Totonho de Maré. Amorzinho led the rodas while Noronha provided organizational support."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Noronha were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia. Noronha later documented Amorzinho''s role in his manuscripts.',
  'Amorzinho e Noronha foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia. Noronha depois documentou o papel de Amorzinho em seus manuscritos.'
FROM genealogy.person_profiles a, genealogy.person_profiles n
WHERE a.apelido = 'Amorzinho' AND n.apelido = 'Noronha'
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
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Noronha and Livino."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Totonho de Maré were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Amorzinho e Totonho de Maré foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles a, genealogy.person_profiles t
WHERE a.apelido = 'Amorzinho' AND t.apelido = 'Totonho de Maré'
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
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, l.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Noronha and Totonho de Maré."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Livino were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Amorzinho e Livino foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles a, genealogy.person_profiles l
WHERE a.apelido = 'Amorzinho' AND l.apelido = 'Livino'
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
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Amorzinho handed leadership of the Centro Nacional de Capoeira de Origem Angola (Gengibirra) to Pastinha on February 23, 1941. According to Pastinha: ''Amorzinho in the grip of my hand went and handed over capoeira for me to take care of.'' Amorzinho reportedly said: ''I have been waiting a long time to give you this capoeira for you to master.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts; velhosmestres.com; jogodavidaweb.wordpress.com',
  'Amorzinho passed leadership of Capoeira Angola to Pastinha in 1941. This transfer (whether on the day or after Amorzinho''s death in 1943) was foundational to CECA''s establishment.',
  'Amorzinho passou a liderança da Capoeira Angola para Pastinha em 1941. Esta transferência (seja no dia ou após a morte de Amorzinho em 1943) foi fundamental para o estabelecimento do CECA.'
FROM genealogy.person_profiles a, genealogy.person_profiles p
WHERE a.apelido = 'Amorzinho' AND p.apelido = 'Pastinha'
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
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, ab.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Aberrê was one of the 22 founding mestres of Gengibirra (listed as ''Raimundo ABR'' in Noronha''s manuscripts) and a key associate of Amorzinho. In 1941, Aberrê brought Pastinha to the Gengibirra roda and introduced him to Amorzinho, facilitating the transfer of leadership. Aberrê died in September 1942, shortly before Amorzinho died in 1943."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; Pastinha account; Portal Capoeira',
  'Aberrê was a founding mestre of Gengibirra who brought Pastinha to meet Amorzinho in 1941. Both died within months of each other (Aberrê Sept 1942, Amorzinho 1943).',
  'Aberrê era um mestre fundador do Gengibirra que trouxe Pastinha para conhecer Amorzinho em 1941. Ambos morreram com meses de diferença (Aberrê set. 1942, Amorzinho 1943).'
FROM genealogy.person_profiles a, genealogy.person_profiles ab
WHERE a.apelido = 'Amorzinho' AND ab.apelido = 'Aberrê'
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
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Totonho de Maré. Also one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Totonho de Maré. Também um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Amorzinho' AND g.name = 'Gengibirra'
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
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"leadership_role": "dono_proprietario", "additional_role": "roda_leader", "context": "Amorzinho was the roda leader and used his position as civil guard to protect the practitioners from police harassment. His death in 1943 triggered the dispersal of mestres and eventual full transfer to Pastinha."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; Portal Capoeira; Pastinha accounts',
  'One of four "donos e proprietários" AND the primary roda leader. His profession as civil guard provided crucial protection from police. Pastinha called him "the owner of that capoeira." His death in 1943 triggered CECA''s dispersal.',
  'Um dos quatro "donos e proprietários" E o líder principal de roda. Sua profissão como guarda civil fornecia proteção crucial contra a polícia. Pastinha o chamou de "o dono daquela capoeira." Sua morte em 1943 desencadeou a dispersão do CECA.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Amorzinho' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
