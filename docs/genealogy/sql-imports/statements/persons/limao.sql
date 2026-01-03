-- ============================================================
-- STATEMENTS FOR: Limão
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Limão is the SUBJECT.
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Limão student_of Caiçara (primary teacher, Capoeira Angola)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, esquiva.wordpress.com',
  'Primary teacher in Capoeira Angola; learned in Santo Amaro da Purificação, Bahia as child, continued in Salvador',
  'Mestre principal em Capoeira Angola; aprendeu em Santo Amaro da Purificação, Bahia quando criança, continuou em Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão baptized_by Canjiquinha (received apelido "Limão" from Canjiquinha)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"apelido_given": "Limão"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br',
  'Received apelido "Limão" from Mestre Canjiquinha because he sold lemons (limões) at the market',
  'Recebeu apelido "Limão" de Mestre Canjiquinha porque vendia limões na feira'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Canjiquinha' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão received_title_from Caiçara (contra-mestre, 1969)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "location": "São Paulo"}}'::jsonb, 'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, esquiva.wordpress.com',
  'Received contra-mestre title from Caiçara after LP recording and excellent Capoeira Angola presentations in São Paulo (1969); alongside Mestre Silvestre',
  'Recebeu título de contra-mestre de Caiçara após gravação do LP e excelentes apresentações de Capoeira Angola em São Paulo (1969); junto com Mestre Silvestre'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PEER ASSOCIATIONS ("Grupo dos Nove")
-- ============================================================

-- Limão associated_with Silvestre (both received contra-mestre from Caiçara 1969; Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both received contra-mestre from Caiçara in 1969; both members of Grupo dos Nove"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Fellow contra-mestre under Caiçara (1969); both recognized by Bimba as Grupo dos Nove pioneers (1971)',
  'Colega contra-mestre sob Caiçara (1969); ambos reconhecidos por Bimba como pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Silvestre' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Onça (SP) (Grupo dos Nove)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove - pioneers of capoeira in São Paulo recognized by Bimba (1971)"}'::jsonb,
  'verified'::genealogy.confidence,
  'onca-sp.md, cdosergipe.wixsite.com',
  'Both recognized by Mestre Bimba as "Percursores da Capoeira em São Paulo" in 1971',
  'Ambos reconhecidos por Mestre Bimba como "Percursores da Capoeira em São Paulo" em 1971'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Onça' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Suassuna (Grupo dos Nove; frequented rodas together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove; frequented rodas together at Praça da República"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Frequented Praça da República rodas together from 1969; both Grupo dos Nove pioneers (1971)',
  'Frequentaram rodas na Praça da República juntos desde 1969; ambos pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Suassuna' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Limão associated_with Brasília (Grupo dos Nove; frequented rodas together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1969-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo dos Nove; frequented rodas together at Praça da República"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiragita.webnode.com.br, onca-sp.md',
  'Frequented Praça da República rodas together from 1969; both Grupo dos Nove pioneers (1971)',
  'Frequentaram rodas na Praça da República juntos desde 1969; ambos pioneiros do Grupo dos Nove (1971)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Limão' AND s.apelido_context IS NULL
  AND o.apelido = 'Brasília' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Limão co_founded Academia de Capoeira São Bento Pequeno - GROUP NOT IN DATASET
--   Co-founded Aug 1, 1969 with Mestres Pinatti and Paulão
--   Add to groups-backlog (already there)

-- Limão founded Academia Quilombo dos Palmares (SP) - GROUP NOT IN DATASET
--   Founded Jun 1, 1970 on Av. Morumbi, São Paulo
--   Add to groups-backlog (already there as "Quilombo dos Palmares (SP)")

-- Limão founded Grupo Praia do Sol - GROUP NOT IN DATASET
--   Founded 1970s-80s; lineage through Mestre Marcio → Mestre Paraná → Caravelas Negras
--   Add to groups-backlog

-- Limão associated_with Pinatti (Grupo dos Nove; co-founded São Bento Pequeno) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Joel (SP) (Grupo dos Nove; frequented rodas together) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Gilvan (Grupo dos Nove) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Zé de Freitas (Grupo dos Nove) - PERSON NOT IN DATASET
--   Add to persons-backlog (already there)

-- Limão associated_with Paulão (co-founded São Bento Pequeno) - PERSON NOT IN DATASET
--   Need to distinguish from Paulão (Muzenza)
--   Add to persons-backlog

-- Limão associated_with Natanael (taught together in Santo Amaro district, São Paulo) - PERSON NOT IN DATASET
--   Add to persons-backlog

-- ============================================================
-- STUDENT RELATIONSHIPS (STUDENTS NOT IN DATASET)
-- ============================================================
-- Note: These would be statements FROM the students TO Limão, so they go in
-- the students' statements files, not this file. Listed here for reference.

-- Limãozinho student_of Limão - PERSON NOT IN DATASET
--   José Carlos dos Santos, nephew, born Sept 15, 1957
--   Started 1965 (at age 8), received contra-mestre 1972
--   Add to persons-backlog

-- Silvio Acarajé student_of Limão - PERSON NOT IN DATASET
--   One of few taught Angola (not Regional)
--   Add to persons-backlog

-- Mestre Marcio student_of Limão (Praia do Sol lineage) - PERSON NOT IN DATASET
--   Add to persons-backlog
