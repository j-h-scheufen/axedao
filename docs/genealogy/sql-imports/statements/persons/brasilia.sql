-- ============================================================
-- STATEMENTS FOR: Brasília
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Brasília is the SUBJECT.
-- ============================================================

-- Brasília student_of Canjiquinha
-- Primary teacher from 1961; trained for 6 years before moving to São Paulo
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, portalcapoeira.com',
  E'Brasília began training under Canjiquinha at age 19 in 1961 after being captivated by a festival performance. Trained for 6 years performing throughout Bahia before moving to São Paulo in 1965. Canjiquinha was the primary and formative influence on his capoeira.',
  E'Brasília começou a treinar com Canjiquinha aos 19 anos em 1961, após ficar cativado por uma apresentação em festival. Treinou por 6 anos se apresentando por toda a Bahia antes de se mudar para São Paulo em 1965. Canjiquinha foi a influência principal e formativa em sua capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Brasília' AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Brasília co_founded Cordão de Ouro - GROUP NOT YET IN DATASET
-- Founded September 1, 1967 in Vila Mariana, São Paulo with Mestre Suassuna
-- Needs: Cordão de Ouro group to be imported first

-- Brasília departed_from Cordão de Ouro - GROUP NOT YET IN DATASET
-- Departed ~1968-1969 to found his own group
-- Departure type: neutral/blessed (remained friends with Suassuna)
-- Needs: Cordão de Ouro group to be imported first

-- Brasília founded São Bento Grande (Ginga Brasília) - GROUP NOT YET IN DATASET
-- Founded 1969; later renamed to Escola de Capoeira Ginga Brasília
-- Needs: São Bento Grande / Ginga Brasília group to be imported first

-- Brasília leads São Bento Grande (Ginga Brasília) - GROUP NOT YET IN DATASET
-- Current leader of the group he founded
-- Needs: São Bento Grande / Ginga Brasília group to be imported first

-- ============================================================
-- ASSOCIATIONS WITH OTHER MESTRES (documented connections)
-- These are not student_of relationships but significant associations
-- ============================================================

-- Brasília associated_with Suassuna - PERSON NOT YET IN DATASET
-- Co-founder of Cordão de Ouro; "remained friends, partnership and friendship evident today"
-- Needs: Suassuna to be imported first

-- Brasília trained_under Bimba - PERSON EXISTS but this is association, not training
-- "Lived/trained with" per sources; received certificate from Bimba in 1970s
-- This was exposure/association, not formal student relationship

-- Brasília associated_with Waldemar - PERSON EXISTS
-- "Lived/trained with" per sources; association documented
-- Could generate if we want to track this association

-- Brasília associated_with João Pequeno - PERSON EXISTS
-- "Lived/trained with" per sources; association documented

-- Brasília associated_with João Grande - PERSON EXISTS
-- "Lived/trained with" per sources; association documented

-- Brasília associated_with Zé de Freitas - PERSON NOT YET IN DATASET
-- Met Suassuna at Zé de Freitas's academy in São Paulo
-- Needs: Zé de Freitas to be imported first

-- ============================================================
-- GROUP MEMBERSHIP: Grupo dos Nove
-- ============================================================
-- Brasília member_of Grupo dos Nove - GROUP NOT DEFINED
-- Was one of the "Group of Nine" Bahian capoeiristas who pioneered capoeira in São Paulo 1960s
-- Received certificate from Mestre Bimba recognizing them as precursors
-- Note: "Grupo dos Nove" may be an informal designation rather than a formal group

-- ============================================================
-- ORGANIZATIONAL ROLES
-- ============================================================
-- Brasília regional_coordinator_of Federação de Capoeira do Estado de São Paulo
-- Vice-President of the Federation
-- Note: Federation is not a capoeira group in our schema, may not import as group

-- Brasília member_of Conselho Superior de Mestres de São Paulo
-- Member of Honor Board
-- Note: Council is not a capoeira group in our schema, may not import as group

-- ============================================================
-- TITLE GRANTS (potential future statements)
-- ============================================================
-- Brasília received recognition from Bimba - needs clarification on what type
-- The "certificate as precursors" is recognition rather than title grant
-- This was given to Grupo dos Nove collectively, not individual title

-- ============================================================
-- END OF STATEMENTS FOR BRASÍLIA
-- ============================================================
