-- ============================================================
-- STATEMENTS FOR: Camafeu de Oxóssi
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Camafeu de Oxóssi is the SUBJECT.
--
-- NOTE: Camafeu de Oxóssi was not formally a student of any mestre.
-- Sources indicate he learned capoeira and berimbau from the "velhos
-- mestres" in the streets of Salvador. He is described as self-taught
-- through lived experience.
--
-- His primary documented capoeira connections are as a contemporary
-- and associate who played alongside other mestres.
-- ============================================================

-- Camafeu de Oxóssi associated_with Pastinha (CECA companion, Dakar 1966 delegation)
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
  '1994-03-26'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Played berimbau with Pastinha at CECA; member of 1966 Dakar delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-15',
  E'Camafeu played berimbau and pandeiro with Pastinha at CECA in Pelourinho. At the 1966 Dakar festival, while Pastinha was too frail to perform, Camafeu played berimbau while other capoeiristas demonstrated.',
  E'Camafeu tocava berimbau e pandeiro com Pastinha no CECA no Pelourinho. No festival de Dacar em 1966, enquanto Pastinha estava fraco demais para se apresentar, Camafeu tocou berimbau enquanto outros capoeiristas demonstravam.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camafeu de Oxóssi' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camafeu de Oxóssi associated_with João Grande (Dakar 1966 delegation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of 1966 Dakar delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Both traveled as part of the Brazilian delegation to the First World Festival of Black Arts in Dakar, Senegal, April 1966.',
  E'Ambos viajaram como parte da delegação brasileira ao Primeiro Festival Mundial de Artes Negras em Dacar, Senegal, abril de 1966.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camafeu de Oxóssi' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camafeu de Oxóssi associated_with Gato Preto (Dakar 1966 delegation, berimbau rivalry)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of 1966 Dakar delegation; rival berimbau masters"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Both traveled to Dakar 1966. Both were renowned berimbau players - Waldeloir Rego named Gato as the greatest, while Dorival Caymmi praised Camafeu as unsurpassed.',
  E'Ambos viajaram a Dacar 1966. Ambos eram renomados tocadores de berimbau - Waldeloir Rego nomeou Gato como o maior, enquanto Dorival Caymmi elogiou Camafeu como insuperável.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camafeu de Oxóssi' AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camafeu de Oxóssi associated_with Gildo Alfinete (Dakar 1966 delegation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of 1966 Dakar delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Both traveled as part of the Brazilian delegation to the First World Festival of Black Arts in Dakar, Senegal, April 1966.',
  E'Ambos viajaram como parte da delegação brasileira ao Primeiro Festival Mundial de Artes Negras em Dacar, Senegal, abril de 1966.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camafeu de Oxóssi' AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Camafeu de Oxóssi associated_with Roberto Satanás (Dakar 1966 delegation)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-04-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Fellow members of 1966 Dakar delegation"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/pastinha-1966',
  E'Both traveled as part of the Brazilian delegation to the First World Festival of Black Arts in Dakar, Senegal, April 1966. At the festival, Camafeu played berimbau while Roberto Satanás performed.',
  E'Ambos viajaram como parte da delegação brasileira ao Primeiro Festival Mundial de Artes Negras em Dacar, Senegal, abril de 1966. No festival, Camafeu tocou berimbau enquanto Roberto Satanás se apresentava.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Camafeu de Oxóssi' AND o.apelido = 'Roberto Satanás'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- None identified - primary associations are with Dakar 1966
-- delegation members who exist in the dataset (Pastinha, João
-- Grande, Gato Preto, Gildo Alfinete, Roberto Satanás).
--
-- Note: One source mentions Camafeu "formou capoeiristas famosos
-- como Manoel Olímpio, popular Mestre Índio" (trained famous
-- capoeiristas like Mestre Índio). However, other sources indicate
-- Mestre Índio was trained by Mestre Pelé da Bomba. This claim
-- needs further investigation before creating a teacher-student
-- relationship.
-- ============================================================
