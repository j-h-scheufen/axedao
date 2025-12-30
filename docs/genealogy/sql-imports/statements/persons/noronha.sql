-- ============================================================
-- STATEMENTS FOR: Noronha (Daniel Coutinho)
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Noronha (Daniel Coutinho) is the subject.
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
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1917-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"training_location": "Beco de Xaréu, Salvador"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com/en/featured-9',
  'Noronha began training at age 8 (1917) with Mestre Cândido Pequeno in Beco de Xaréu. Learned the "difficult art of capoeira, the art of the solta and the rabo-de-arraia" with complete dedication.',
  'Noronha começou a treinar aos 8 anos (1917) com Mestre Cândido Pequeno no Beco de Xaréu. Aprendeu a "difícil arte da capoeira, a arte da solta e do rabo-de-arraia" com completa dedicação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Noronha' AND o.apelido = 'Cândido Pequeno'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1977-11-17'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "One of the mestres who handed the Centro Nacional de Capoeira de Origem Angola (Gengibirra) to Pastinha in 1941. Noronha documented this transition in his manuscripts: ''Because of the death of Amorzinho, the guard, we handed over the Centre to Mestre Pastinha.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha was one of the Gengibirra founders who handed leadership to Pastinha in 1941 after Amorzinho''s death. Both trained at CECA and were contemporaries in the Bahian capoeira angola community.',
  'Noronha foi um dos fundadores do Gengibirra que passou a liderança para Pastinha em 1941 após a morte de Amorzinho. Ambos treinaram no CECA e foram contemporâneos na comunidade de capoeira angola baiana.'
FROM genealogy.person_profiles n, genealogy.person_profiles p
WHERE n.apelido = 'Noronha' AND p.apelido = 'Pastinha'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Amorzinho."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Noronha and Totonho de Maré were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Noronha e Totonho de Maré foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles n, genealogy.person_profiles t
WHERE n.apelido = 'Noronha' AND t.apelido = 'Totonho de Maré'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s. Aberrê (listed as ''Raimundo ABR'') later introduced Pastinha to the roda in 1941."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Aberrê were both founding mestres of Gengibirra in the 1920s. Aberrê later brought Pastinha to witness the roda in February 1941.',
  'Noronha e Aberrê foram ambos mestres fundadores do Gengibirra na década de 1920. Aberrê depois trouxe Pastinha para assistir à roda em fevereiro de 1941.'
FROM genealogy.person_profiles n, genealogy.person_profiles a
WHERE n.apelido = 'Noronha' AND a.apelido = 'Aberrê'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Geraldo Chapeleiro were both founding mestres of Gengibirra in the 1920s.',
  'Noronha e Geraldo Chapeleiro foram ambos mestres fundadores do Gengibirra na década de 1920.'
FROM genealogy.person_profiles n, genealogy.person_profiles g
WHERE n.apelido = 'Noronha' AND g.apelido = 'Geraldo Chapeleiro'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were among the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com',
  'Noronha and Onça Preta were both founding mestres of Gengibirra in the 1920s.',
  'Noronha e Onça Preta foram ambos mestres fundadores do Gengibirra na década de 1920.'
FROM genealogy.person_profiles n, genealogy.person_profiles o
WHERE n.apelido = 'Noronha' AND o.apelido = 'Onça Preta'
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
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Livino, Totonho de Maré, and Amorzinho. Also one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Livino, Totonho de Maré e Amorzinho. Também um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noronha' AND g.name = 'Gengibirra'
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
  '{"leadership_role": "dono_proprietario", "context": "One of four organizational leaders recognized in his own manuscripts; leadership ended when center was handed to Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" providing organizational leadership. Term indicates custodianship/leadership, not property ownership (Ladeira de Pedra was a public street).',
  'Um dos quatro "donos e proprietários" fornecendo liderança organizacional. O termo indica custódia/liderança, não propriedade (Ladeira de Pedra era uma rua pública).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noronha' AND g.name = 'Gengibirra'
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
  'person'::genealogy.entity_type, n.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, a.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Totonho de Maré. Amorzinho provided protection as civil guard and led rodas."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Noronha and Amorzinho were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia. Amorzinho died in 1943.',
  'Noronha e Amorzinho foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia. Amorzinho morreu em 1943.'
FROM genealogy.person_profiles n, genealogy.person_profiles a
WHERE n.apelido = 'Noronha' AND a.apelido = 'Amorzinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
