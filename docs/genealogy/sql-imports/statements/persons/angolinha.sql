-- ============================================================
-- STATEMENTS FOR: Angolinha
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Angolinha is the SUBJECT.
-- ============================================================

-- Angolinha trained_under Moraes (participated in GCAP founding era, 1970s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1970-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://aprendercomcapoeira.wordpress.com/fotos/oficina-de-capoeira-com-mestre-angolinha-rj/',
  'Met Moraes in the 1970s and participated in the founding era of GCAP. Moraes was in Rio 1970-1982 establishing the first Capoeira Angola school outside Bahia.',
  'Conheceu Moraes nos anos 1970 e participou da era fundacional do GCAP. Moraes estava no Rio 1970-1982 estabelecendo a primeira escola de Capoeira Angola fora da Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angolinha' AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Angolinha associated_with Cobra Mansa (contemporaries at Roda de Caxias late 1970s, both trained under Moraes)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1977-01-01'::date, 'year'::genealogy.date_precision,
  '1981-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Contemporaries at Roda de Caxias and fellow students of Moraes in Rio de Janeiro late 1970s"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://lurdinha.org/site/roda-livre-de-caxias-40-anos-de-capoeira-cultura-e-historia/',
  'Both trained under Moraes in Rio and participated in the Roda de Caxias community in the late 1970s. Cobra Mansa co-founded the roda in 1973; Angolinha joined late 1970s. Cobra Mansa left for Salvador in 1981.',
  'Ambos treinaram com Moraes no Rio e participaram da comunidade Roda de Caxias no final dos anos 1970. Cobra Mansa co-fundou a roda em 1973; Angolinha entrou no final dos anos 1970. Cobra Mansa foi para Salvador em 1981.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angolinha' AND o.apelido = 'Cobra Mansa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- NOTE: The following relationships need objects imported first:
--
-- TEACHERS (Angolinha student_of/trained_under ...):
-- - Father Severino - childhood introduction (family transmission, no apelido, likely not in dataset)
-- - Mestre Índio (deceased) - continued training in Rio area; likely Euclides Paes (already in dataset)
--
-- STUDENTS (... student_of Angolinha):
-- - Mestre Manoel (Ypiranga de Pastinha, Maré) - needs import; later students include CM Dirceu
-- - Mestre Bába (Rio de Janeiro) - needs import
--
-- INFLUENCE RELATIONSHIPS (add to OTHER person's statements file):
-- - Marrom influenced_by Angolinha - ADD TO marrom.sql (Marrom is subject)
--   Source: https://capoeirahistory.com/mestre-marrom/
--   Notes: Marrom cited Angolinha as his key reference in transition from Regional to Angola in 1990s
--
-- PADRINHO GROUP RELATIONSHIPS (Angolinha associated_with group as padrinho):
-- - Ngoma Capoeira Angola - Angolinha is padrinho of Marrom's group; group in backlog
--   Properties: {"association_type": "padrinho"}
-- - Mestre Siri's Finland group - Angolinha is padrinho; group needs import
--   Properties: {"association_type": "padrinho"}
--
-- RODA ASSOCIATIONS:
-- - Roda Livre de Caxias (group) - Angolinha associated_with group; group in backlog
-- - Mestre Russo (Jonas Rabelo) - co-guardian of Roda de Caxias; needs import
-- - Mestre Peixe (Itamar da Silva Barbosa, d. 2025) - co-guardian; needs import
--
-- CONTEMPORARIES AT RODA DE CAXIAS (late 1970s+):
-- - Mestre Pedrinho Boneco Ferro (Pedro Soares Mela) - needs import
-- - Mestre Jurandir (GCAP Rio) - needs import
-- - Mestre Neco (GCAP Rio) - needs import
-- - Mestre Braga (GCAP Rio) - needs import
--
-- GROUP AFFILIATIONS:
-- - GCAP (Grupo de Capoeira Angola Pelourinho) - participated in founding era; group in backlog
-- - Grupo de Capoeira Angolinha - his own group; may need import
-- ============================================================
