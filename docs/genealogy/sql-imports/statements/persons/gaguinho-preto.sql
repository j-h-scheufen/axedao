-- ============================================================
-- STATEMENTS FOR: Gaguinho Preto
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Gaguinho Preto is the SUBJECT.
--
-- Teachers:
-- - Menino Gordo da Curva Grande (student_of, ~1938) - EXISTS in DB
-- - Roque (Curva Grande) (student_of, ~1938) - PENDING (not in DB, distinct from Roque Mendes)
-- - Vitor Agaú (student_of, ~1938) - EXISTS in DB
-- - Pastinha (trained_under, via CECA) - EXISTS in DB
-- - Zeca do Uruguai (trained_under, date unknown) - EXISTS in DB
--
-- Associates:
-- - Pierrô (associated_with, Cidade Baixa network) - PENDING
-- - Cutica (associated_with, Cidade Baixa network) - EXISTS in DB
-- - Nilton (associated_with, Cidade Baixa network) - PENDING
-- ============================================================

-- Gaguinho Preto student_of Menino Gordo da Curva Grande
-- Primary teacher in Curva Grande neighborhood from age 4 (~1938)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'One of three teachers in Curva Grande neighborhood; taught Gaguinho Preto from age 4',
  'Um de três professores no bairro da Curva Grande; ensinou Gaguinho Preto a partir dos 4 anos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gaguinho Preto'
  AND o.apelido = 'Menino Gordo'
  AND COALESCE(o.apelido_context, '') = 'Curva Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gaguinho Preto student_of Vitor Agaú
-- Primary teacher in Curva Grande neighborhood from age 4 (~1938)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1938-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'One of three teachers in Curva Grande neighborhood; taught Gaguinho Preto from age 4',
  'Um de três professores no bairro da Curva Grande; ensinou Gaguinho Preto a partir dos 4 anos'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gaguinho Preto'
  AND o.apelido = 'Vitor Agaú'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gaguinho Preto trained_under Pastinha
-- Passed through CECA (Centro Esportivo de Capoeira Angola)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'Passed through Pastinha''s CECA; trained_under rather than student_of due to likely informal attendance',
  'Passou pelo CECA de Pastinha; trained_under ao invés de student_of devido a provável frequência informal'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gaguinho Preto'
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gaguinho Preto trained_under Zeca do Uruguai
-- Trained with Zeca in the Lower City (Cidade Baixa)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'Trained with Zeca do Uruguai in the Lower City of Salvador',
  'Treinou com Zeca do Uruguai na Cidade Baixa de Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gaguinho Preto'
  AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gaguinho Preto associated_with Cutica
-- Contemporaries in Cidade Baixa capoeira network
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Cidade Baixa capoeira network"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-39',
  'Part of the Cidade Baixa capoeira network together with Zeca do Uruguai',
  'Parte da rede de capoeira da Cidade Baixa junto com Zeca do Uruguai'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gaguinho Preto'
  AND o.apelido = 'Cutica'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gaguinho Preto student_of Roque (Curva Grande) - needs import first
--   Note: DISTINCT from Mestre Roque Mendes dos Santos (b. 1938)
--   The Roque who taught Gaguinho Preto in 1938 must be an earlier figure
--
-- Gaguinho Preto associated_with Pierrô - needs import first
--   (Zeca do Uruguai's student; part of Cidade Baixa network)
--
-- Gaguinho Preto associated_with Nilton - needs import first
--   (Nilton Moraes Paes, brother of Cutica)
--
-- Gaguinho Preto associated_with Cobrinha do Morro (Pedro Caipora) - needs import first
--   (Described as "one of the most dangerous")
--
-- Gaguinho Preto associated_with Risadinha da Rua Chile - needs import first
--
-- Gaguinho Preto associated_with Edinho do Uruguai - needs import first
--
-- Gaguinho Preto associated_with Ninho (Ribeira) - needs import first
--   Note: Ninho (Ribeira) already exists in DB (teacher of Cutica and Nilton)
--
-- Gaguinho Preto associated_with Cacua - needs import first
--
-- Gaguinho Preto associated_with João Caveirinha - needs import first
--   (Skilled berimbau player)
--
-- Gaguinho Preto associated_with Edinho Bufo-Bufo - needs import first
--
-- Gaguinho Preto associated_with Augusto Januário - needs import first
--   (December 1989 photo together)
--
-- Gaguinho Preto associated_with Gigante - needs import first
--   (December 1989 photo; Gigante at back with berimbau)
