-- ============================================================
-- STATEMENTS FOR: Medicina
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Medicina is the SUBJECT.
-- ============================================================

-- Medicina student_of Suassuna
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna, https://grupo-capoeira-raca.webnode.fr/sobre-nos/',
  'Primary teacher in Itabuna. Medicina was approximately 15 years old when he became Suassuna''s student. When Suassuna left for São Paulo (~1965-1967), he left the academy under Medicina''s command, calling him his "melhor aluno" (best student).',
  'Professor principal em Itabuna. Medicina tinha aproximadamente 15 anos quando se tornou aluno de Suassuna. Quando Suassuna partiu para São Paulo (~1965-1967), deixou a academia sob o comando de Medicina, chamando-o de seu "melhor aluno".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Itapoan (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Vermelho 27 (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina associated_with Brás Amansa Brabo (contemporaries in 1982 O Globo article)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1982-02-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Listed together as prominent Capoeira Regional mestres in Salvador in 1982 O Globo article"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/cobrinha-1982-3',
  'Both listed in 1982 O Globo article as prominent Regional mestres in Salvador.',
  'Ambos listados no artigo do O Globo de 1982 como mestres proeminentes de Regional em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brás Amansa Brabo' AND o.apelido = 'Medicina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Maneca Brandão (at Major Dória's academy, early 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://cdosergipe.wixsite.com/cdosergipe/mestre-suassuna',
  'Trained at Major Dória''s academy in Itabuna where Maneca Brandão was the primary instructor. Using trained_under since Suassuna was Medicina''s primary teacher, but Maneca Brandão taught at the same academy.',
  'Treinou na academia do Major Dória em Itabuna onde Maneca Brandão era o instrutor principal. Usando trained_under já que Suassuna era o professor principal de Medicina, mas Maneca Brandão ensinava na mesma academia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Maneca Brandão'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Valdebrando (first exposure to capoeira)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://pclogic.wixsite.com/capoeiraraza/mestre-medicina',
  'First exposure to capoeira before entering Major Dória''s academy. Valdebrando was likely a street capoeirista in Itabuna. Used trained_under (not student_of) as this was initial exposure, not ongoing formal training.',
  'Primeira exposição à capoeira antes de entrar na academia do Major Dória. Valdebrando era provavelmente um capoeirista de rua em Itabuna. Usado trained_under (não student_of) pois foi exposição inicial, não treinamento formal contínuo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Valdebrando'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Medicina trained_under Antônio Rodrigues (introduced to street capoeira circles ~1965)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://grupo-capoeira-raca.webnode.fr/sobre-nos/',
  'A friend introduced Medicina to Antônio Rodrigues, who brought him into the street capoeira circles of Itabuna around age fifteen (~1965). Antônio Rodrigues founded Academia de Capoeira Nossa Senhora de Fátima, the first indoor academy in Itabuna. Used trained_under (not student_of) as this was introduction to the capoeira scene; Suassuna became his primary teacher.',
  'Um amigo apresentou Medicina a Antônio Rodrigues, que o trouxe para as rodas de capoeira de rua de Itabuna por volta dos quinze anos (~1965). Antônio Rodrigues fundou a Academia de Capoeira Nossa Senhora de Fátima, a primeira academia fechada em Itabuna. Usado trained_under (não student_of) pois foi uma introdução à cena da capoeira; Suassuna se tornou seu professor principal.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Medicina' AND o.apelido = 'Antônio Rodrigues'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Medicina trained_under Major Dória (Carlos Dória) - needs import first
-- Trained at Academia Cultura Física e Capoeira Major Dória in Itabuna

-- Dedé student_of Medicina - Dedé not yet in dataset
-- Mestre Dedé founded Kilombolas after Medicina departed

-- Macarrão (Idalina) student_of Medicina - needs import first
-- Student of Medicina

-- Dilaho student_of Medicina - needs import first
-- Student of Medicina in Itabuna

-- Pacheco (Malandragem) associated_with Medicina - needs import first
-- Co-founded Kilombolas in 1973 at Faculdade de Medicina

-- Lobão associated_with Medicina - Lobão in backlog
-- Fellow early student of Suassuna in Itabuna; graduated CDO 1970

-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================

-- Medicina founded ACRESI - ACRESI not yet in dataset
-- ~1965, renamed from ACRI after Suassuna departed

-- Medicina co_founded Kilombolas - Kilombolas not yet in dataset
-- 1973, Salvador, with Pacheco

-- Medicina founded Meninos da Ilha - not yet in dataset
-- Late 1970s, Ilha Mar Grande

-- Medicina founded Grupo Raça - not yet in dataset
-- ~1980s, Cachoeira/Muritiba, current group
