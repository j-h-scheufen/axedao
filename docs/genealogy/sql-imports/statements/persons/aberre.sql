-- ============================================================
-- STATEMENTS FOR: Aberrê
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Aberrê is the subject.
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
  'Mestre Noronha manuscripts; listed as "Raimundo ABR" in founding mestres',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra (Gengibirra). Listed as "Raimundo ABR". Later introduced Pastinha to the roda on Feb 23, 1941.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra (Gengibirra). Listado como "Raimundo ABR". Posteriormente apresentou Pastinha à roda em 23 de fevereiro de 1941.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Aberrê' AND g.name = 'Gengibirra'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"membership_context": "Central figure at the Sunday training sessions at Matatu Preto in the 1930s. Led the sessions and taught young Canjiquinha here."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Led the Matatu Preto Sunday training sessions in Salvador during the 1930s. Taught Canjiquinha here starting in 1935.',
  'Liderou as sessões de treino de domingo no Matatu Preto em Salvador durante os anos 1930. Ensinou Canjiquinha aqui a partir de 1935.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Aberrê' AND g.name = 'Roda do Matatu Preto'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Led the Sunday training sessions at Matatu Preto; challenged Onça Preta in 1936',
  'Liderou as sessões de treino de domingo no Matatu Preto; desafiou Onça Preta em 1936'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Onça Preta'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Geraldo Chapeleiro'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; both also co-founded Gengibirra; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto; both involved in founding Gengibirra',
  'Contemporâneos no Matatu Preto; ambos envolvidos na fundação da Gengibirra'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Totonho de Maré'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Creoni'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Chico Três Pedaços'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Paulo Barroquinha'
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
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Both were part of the Matatu Preto Sunday training group in Salvador during the 1930s; documented in Canjiquinha''s 1989 testimony"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony 1989; velhosmestres.com/br/destaques-2',
  'Contemporaries at Matatu Preto in the 1930s',
  'Contemporâneos no Matatu Preto nos anos 1930'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Barboza'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê student_of Antônio de Noronha
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
  '1910-01-01'::date, 'year'::genealogy.date_precision,
  '1912-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/en/featured-2; esquiva.wordpress.com; testimony of Mestre Caiçara and Mestre Silvestre',
  'Aberrê learned capoeira from Mestre Antônio de Noronha around 1910-1912 in Salvador. Some sources also mention Pastinha as a teacher during this period. Testimony from Mestre Caiçara and Mestre Silvestre confirms the lineage: "Mestre Aberrê is the second mestre in my lineage, above him comes Mestre Antônio de Noronha."',
  'Aberrê aprendeu capoeira com Mestre Antônio de Noronha por volta de 1910-1912 em Salvador. Algumas fontes também mencionam Pastinha como professor durante este período. Testemunho de Mestre Caiçara e Mestre Silvestre confirma a linhagem: "Mestre Aberrê é o segundo mestre da minha linhagem, acima dele vem Mestre Antônio de Noronha."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Antônio de Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê trained_under Pastinha
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
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'year'::genealogy.date_precision,
  '1912-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'disputed'::genealogy.confidence,
  'velhosmestres.com; esquiva.wordpress.com; Multiple sources conflict on direction of relationship',
  'Disputed: Some sources say Aberrê was Pastinha''s first student (1910-1912); others say Aberrê''s teacher. Aberrê later invited Pastinha to Gengibirra in 1941.',
  'Disputado: Algumas fontes dizem que Aberrê foi o primeiro aluno de Pastinha (1910-1912); outras dizem que foi professor de Aberrê. Aberrê depois convidou Pastinha para Gengibirra em 1941.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
