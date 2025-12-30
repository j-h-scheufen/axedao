-- ============================================================
-- STATEMENTS FOR: Onça Preta
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Onça Preta is the subject.
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
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'O Cruzeiro magazine, January 10, 1948: "Aluno de Aberrê foi Onça Preta"',
  E'O Cruzeiro (1948) identifies Onça Preta as a student of Aberrê. However, Onça Preta himself stated in a 1972 interview he had "other references" beyond Aberrê, suggesting multiple teachers.',
  E'O Cruzeiro (1948) identifica Onça Preta como aluno de Aberrê. Porém, o próprio Onça Preta afirmou em entrevista de 1972 que teve "outras referências" além de Aberrê, sugerindo múltiplos professores.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Aberrê'
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
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34',
  E'Onça Preta (b. 1909) stated he trained under multiple mestres as a boy: "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... I had not one, but many mestres". Learning was through public rodas rather than formal apprenticeship.',
  E'Onça Preta (n. 1909) afirmou que treinou com múltiplos mestres quando menino: "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... Não tive um, mas muitos mestres". O aprendizado era através de rodas públicas em vez de aprendizado formal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Pastinha'
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
  '1936-05-16'::date, 'exact'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Peers at Matatu Preto training circle. Aberrê challenged Onça Preta to a match on May 16, 1936 in Salvador. On Aberrê''s death in 1972, Onça Preta mourned: ''We had lost a great master, an excellent friend.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-2; velhosmestres.com/br/destaques-34',
  E'Both trained at Matatu Preto on Sundays with other capoeiristas. In 1936, Aberrê challenged Onça Preta to a formal match. Despite competitive rivalry, they maintained friendship - Onça Preta mourned Aberrê''s death in 1972.',
  E'Ambos treinavam no Matatu Preto aos domingos com outros capoeiristas. Em 1936, Aberrê desafiou Onça Preta para uma luta formal. Apesar da rivalidade competitiva, mantiveram amizade - Onça Preta lamentou a morte de Aberrê em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Aberrê'
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
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s, alongside Aberrê, Geraldo Chapeleiro, Totonho de Maré, and others. Per O Cruzeiro (1948), was a student of Aberrê.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Geraldo Chapeleiro, Totonho de Maré e outros. Segundo O Cruzeiro (1948), era aluno de Aberrê.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Onça Preta' AND g.name = 'Roda do Matatu Preto'
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
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra (Gengibirra).',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra (Gengibirra).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Onça Preta' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Preta student_of Besourinho
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
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34 (1972 interview)',
  E'Onça Preta (b. 1909) stated he "jumped with" (pulei com) Besourinho as a boy in Salvador. Training ended when Besourinho was killed during Pedrito persecution.',
  E'Onça Preta (n. 1909) afirmou que "pulou com" Besourinho quando menino em Salvador. O treino terminou quando Besourinho foi morto durante a perseguição de Pedrito.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Besourinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Preta student_of Gasolina
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
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'approximate'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Onça Preta biography: "as a boy, he trained with Samuel, Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê, and many others who are now dead"',
  E'Onça Preta (b. 1909) listed Gasolina among his mestres. Gasolina was killed during Pedrito persecution (~1925).',
  E'Onça Preta (n. 1909) listou Gasolina entre seus mestres. Gasolina foi morto durante a perseguição de Pedrito (~1925).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Gasolina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Preta student_of Vitor Agaú
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
  '1915-01-01'::date, 'decade'::genealogy.date_precision,
  '1925-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta testimony, velhosmestres.com/br/destaques-34; O Dia newspaper 1972',
  E'Onça Preta (b. 1909) stated: "Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... I had not one, but many mestres". Training was through public rodas rather than formal apprenticeship.',
  E'Onça Preta (n. 1909) afirmou: "Garoto ainda, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê... Não tive um, mas muitos mestres". O treino era através de rodas públicas em vez de aprendizado formal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Onça Preta' AND o.apelido = 'Vitor Agaú'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
