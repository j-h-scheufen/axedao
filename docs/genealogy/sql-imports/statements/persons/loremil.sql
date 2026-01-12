-- ============================================================
-- STATEMENTS FOR: Loremil Machado
-- Generated: 2025-01-10
-- ============================================================
-- Contains all relationships where Loremil is the SUBJECT.
-- ============================================================

-- Loremil student_of Mestre Nô (Norival Moreira de Oliveira)
-- Loremil was nephew and first-generation student of Mestre Nô
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'decade'::genealogy.date_precision,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'CapoeiraWiki, New York Ile de Palmares Capoeira',
  E'Loremil was a nephew and first-generation student of Mestre Nô, graduating among the first group of students from Nô''s academies in Salvador. His training would have been in the 1960s before he joined Viva Bahia (1974).',
  E'Loremil era sobrinho e aluno de primeira geração de Mestre Nô, graduando-se entre o primeiro grupo de alunos das academias de Nô em Salvador. Seu treinamento teria sido nos anos 1960, antes de se juntar ao Viva Bahia (1974).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Loremil' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Loremil family_of Mestre Nô (nephew relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "nephew"}'::jsonb,
  'verified'::genealogy.confidence,
  'CapoeiraWiki, New York Ile de Palmares Capoeira',
  E'Loremil was a nephew of Mestre Nô. The exact family connection (through which parent) is not documented.',
  E'Loremil era sobrinho de Mestre Nô. A conexão familiar exata (através de qual pai/mãe) não está documentada.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Loremil' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Loremil co_founded DanceBrazil (as "The Capoeiras of Bahia")
-- Founded 1977 with Jelon Vieira, renamed 1981
-- ============================================================
-- PENDING: DanceBrazil is not yet in the dataset (in groups-backlog)
-- When DanceBrazil is imported, add statement:
-- Loremil co_founded DanceBrazil (started_at: 1977)
-- ============================================================

-- Loremil founded Loremil Machado Afro-Brazilian Dance Company
-- ============================================================
-- PENDING: Loremil Machado Afro-Brazilian Dance Company not in dataset
-- Add to groups-backlog
-- When imported, add statement:
-- Loremil founded Loremil Machado Afro-Brazilian Dance Company
-- ============================================================

-- Loremil associated_with Jelon Vieira
-- Partners who together introduced capoeira to the United States (1975)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '1994-03-11'::date, 'exact'::genealogy.date_precision,
  '{"association_context": {"en": "Partners who together introduced capoeira to the United States (1975); co-founded The Capoeiras of Bahia (1977, later DanceBrazil); performed together in Bronx schools, Central Park, Cachaça nightclub; collaborated on documentary Capoeira of Brazil (1980)", "pt": "Parceiros que juntos introduziram a capoeira nos Estados Unidos (1975); co-fundaram The Capoeiras of Bahia (1977, depois DanceBrazil); apresentaram-se juntos em escolas do Bronx, Central Park, clube Cachaça; colaboraram no documentário Capoeira of Brazil (1980)"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: NEA Heritage Fellowship, CapoeiraWiki, Smithsonian Folklife Festival',
  E'Loremil and Jelon Vieira were the first capoeira mestres to live and teach in the United States, arriving April 1975. They co-founded The Capoeiras of Bahia (1977, later DanceBrazil). Their demonstrations in Bronx public schools are credited with influencing breakdancing.',
  E'Loremil e Jelon Vieira foram os primeiros mestres de capoeira a morar e ensinar nos Estados Unidos, chegando em abril de 1975. Co-fundaram The Capoeiras of Bahia (1977, depois DanceBrazil). Suas demonstrações em escolas públicas do Bronx são creditadas por influenciar o breakdancing.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Loremil' AND o.apelido = 'Jelon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Loremil co_founded DanceBrazil - needs DanceBrazil group import first
-- Loremil founded Loremil Machado Afro-Brazilian Dance Company - needs group import first
-- Loremil member_of Viva Bahia - needs Viva Bahia group import first
-- Loremil teaches_at Clark Center - not a capoeira group, person-to-institution
-- ============================================================
