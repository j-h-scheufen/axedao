-- ============================================================
-- STATEMENTS FOR: Canela (Floriano Franklin Canela)
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Canela is the SUBJECT.
-- ============================================================

-- Canela student_of Zé Maria
-- Note: Zé Maria is NOT yet in the dataset - this statement will fail silently
-- until Zé Maria is imported
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1979-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.martialnet.it/en/south-american-martial-arts/capoeira/capoeira-timeline/',
  E'Trained in the Tijuca association founded by Mestre Zé Maria (José Maria da Silva); founded Mangangà (1972) with Zé Maria''s consent; departed for Europe with Zé Maria (1979)',
  E'Treinado na associação de Tijuca fundada por Mestre Zé Maria (José Maria da Silva); fundou o Mangangà (1972) com o consentimento de Zé Maria; partiu para a Europa com Zé Maria (1979)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Canela' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Canela founded Grupo Mangangà (Rio de Janeiro, 1972)
-- Note: Grupo Mangangà is NOT yet in the dataset
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"location": "Rio de Janeiro, Brazil"}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.martialnet.it/en/south-american-martial-arts/capoeira/capoeira-timeline/',
  E'Founded in Rio de Janeiro with Mestre Zé Maria''s consent; name comes from Tupí-Guaraní word for a small but spirited animal; later refounded in Viterbo, Italy (1982)',
  E'Fundado no Rio de Janeiro com o consentimento de Mestre Zé Maria; nome vem da palavra Tupí-Guaraní para um animal pequeno mas valente; depois refundado em Viterbo, Itália (1982)'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Canela' AND o.name = 'Mangangà'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Canela student_of Zé Maria - NEEDS IMPORT: Mestre Zé Maria (José Maria da Silva, 1948-2016)
--   Founder of Grupo de Capoeira do Império da Tijuca (1967); pioneer of Tijuca neighborhood
--   Canela trained under him and founded Mangangà (1972) with his consent
--   They departed together for Europe (1979)

-- Canela founded Grupo Mangangà - NEEDS GROUP IMPORT: Grupo Mangangà
--   Founded Rio de Janeiro (1972), refounded Viterbo, Italy (1982)
--   First Italian capoeira school; "Berimbau de Ouro" European champions (1999)
