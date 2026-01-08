-- ============================================================
-- STATEMENTS FOR: Olavo
-- Generated: 2026-01-03
-- ============================================================
-- Contains all relationships where Olavo is the SUBJECT.
-- ============================================================

-- Olavo student_of Waldemar (primary teacher for berimbau and Angola in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"training_type": "capoeira_angola_and_berimbau_making"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65; artesanatodabahia.com.br/artesaos/mestre-olavo-da-bahia/',
  'Olavo moved to Salvador in 1960 at age 18 and began studying capoeira and berimbau-making with Mestre Waldemar. Learned steel wire (arame) and gourd painting (cabaças) techniques from Waldemar. Directed rodas at Agnelo''s bar (1969-1970) under Waldemar''s oversight.',
  'Olavo mudou-se para Salvador em 1960 aos 18 anos e começou a estudar capoeira e fabricação de berimbau com Mestre Waldemar. Aprendeu técnicas de arame de aço e pintura de cabaças com Waldemar. Dirigiu rodas no bar do Agnelo (1969-1970) sob supervisão de Waldemar.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo trained_under Acordeon (Regional training from 1967)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"training_type": "capoeira_regional"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65',
  'In 1967, Olavo met Mestre Acordeon and started learning Regional capoeira with him, expanding his knowledge beyond the Angola tradition.',
  'Em 1967, Olavo conheceu Mestre Acordeon e começou a aprender Capoeira Regional com ele, expandindo seu conhecimento além da tradição Angola.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with João Grande (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Olavo (berimbau) and João Grande (berimbau) appeared in historic photo with Mestres João Pequeno, Gigante, Waldemar, Paulo dos Anjos, and Itapoan."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at Itapoan''s house celebrating the birthdays of Mestres Itapoan and Paulo dos Anjos. Both Olavo and João Grande played berimbau.',
  'Fotografia histórica em 20 de agosto de 1989, na casa de Itapoan celebrando os aniversários dos Mestres Itapoan e Paulo dos Anjos. Tanto Olavo quanto João Grande tocaram berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with João Pequeno (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Olavo (berimbau) and João Pequeno (pandeiro) appeared in historic photo."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989. Olavo played berimbau while João Pequeno played pandeiro.',
  'Fotografia histórica em 20 de agosto de 1989. Olavo tocou berimbau enquanto João Pequeno tocou pandeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Gigante (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989. Both Olavo and Gigante played berimbau in historic photo."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989. Both Olavo and Gigante played berimbau.',
  'Fotografia histórica em 20 de agosto de 1989. Tanto Olavo quanto Gigante tocaram berimbau.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Gigante'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Paulo dos Anjos (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989, celebrating Paulo dos Anjos'' birthday."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at the birthday celebration for Mestres Itapoan and Paulo dos Anjos.',
  'Fotografia histórica em 20 de agosto de 1989, na celebração de aniversário dos Mestres Itapoan e Paulo dos Anjos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Paulo dos Anjos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Itapoan (1989 photo at Itapoan's house)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1989-08-20'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Photographed together at Mestre Itapoan''s house on August 20, 1989, celebrating Itapoan''s birthday. Olavo played berimbau while Itapoan was playing capoeira."}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/waldemar-1989 (archive of M Bola Sete)',
  'Historic photograph on August 20, 1989, at Itapoan''s house during his birthday celebration.',
  'Fotografia histórica em 20 de agosto de 1989, na casa de Itapoan durante a celebração de seu aniversário.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo associated_with Lua Rasta (co-recipients of Mestre Artesão title)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2021-05-28'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Both Olavo and Lua Rasta became the first Mestres Artesãos (Master Artisans) of capoeira recognized in Brazil on May 28, 2021, at the Centro de Comercialização Artesanato da Bahia in Salvador."}'::jsonb,
  'verified'::genealogy.confidence,
  'jornaldosudoeste.com/governo-da-bahia-condecora-capoeiristas-como-mestres-artesaos/',
  'Both became the first capoeira Mestres Artesãos in Brazil on May 28, 2021, through initiative of SETRE.',
  'Ambos tornaram-se os primeiros Mestres Artesãos de capoeira no Brasil em 28 de maio de 2021, através de iniciativa da SETRE.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Lua Rasta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Olavo student_of Alfredo (Muritiba) - initial capoeira training in Muritiba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1960-01-01'::date, 'year'::genealogy.date_precision,
  '{"training_type": "capoeira_angola", "location": "Muritiba, Recôncavo Baiano"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-65; artesanatodabahia.com.br/artesaos/mestre-olavo-da-bahia/',
  E'Olavo grew up in Muritiba where he learned capoeira from Mestre Alfredo da Capoeira Angola. This was his foundational training before moving to Salvador in 1960 at age 18.',
  E'Olavo cresceu em Muritiba onde aprendeu capoeira com Mestre Alfredo da Capoeira Angola. Esta foi sua formação inicial antes de se mudar para Salvador em 1960 aos 18 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Olavo' AND o.apelido = 'Alfredo' AND o.apelido_context = 'Muritiba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Olavo leads Grupo BerimBahia - group needs import
