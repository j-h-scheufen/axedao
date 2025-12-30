-- ============================================================
-- STATEMENTS FOR: Arraia (Aldenor Benjamim)
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Arraia is the SUBJECT.
-- ============================================================

-- Arraia trained_under Bimba (alumnus of Associação de Capoeira Mestre Bimba, Salvador 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1969-01-01'::date, 'decade'::genealogy.date_precision,
  '{"context": "alumnus of Associação de Capoeira Mestre Bimba"}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com/learn-capoeira/mestre-arraia, iesambi.org',
  'Associated with Associação de Capoeira Mestre Bimba in Salvador during 1960s; trained alongside Acordeon, Sena, Gildo Alfinete, and Roberto Satanás',
  'Associado à Associação de Capoeira Mestre Bimba em Salvador nos anos 1960; treinou ao lado de Acordeon, Sena, Gildo Alfinete e Roberto Satanás'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia influenced_by Pastinha (exposure to Angola tradition in Salvador)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"context": "exposure to Angola tradition in Salvador"}'::jsonb, 'likely'::genealogy.confidence,
  'lalaue.com/learn-capoeira/mestre-arraia',
  'Loved to tell stories about Pastinha and Bimba; exposed to Angola tradition through rodas in Salvador; described as having Pastinha/Bimba lineage',
  'Adorava contar histórias sobre Pastinha e Bimba; exposto à tradição Angola através de rodas em Salvador; descrito como tendo linhagem Pastinha/Bimba'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia associated_with Acordeon (training companion at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training companion at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'iesambi.org/capoeira_arquivos/ascadf/mestrearraia.htm',
  'Training companion at Mestre Bimba''s academy in Salvador during 1960s',
  'Companheiro de treino na academia de Mestre Bimba em Salvador nos anos 1960'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia associated_with Carlos Senna (training companion at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training companion at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'iesambi.org/capoeira_arquivos/ascadf/mestrearraia.htm',
  'Training companion (Mestre Sena) at Mestre Bimba''s academy in Salvador during 1960s',
  'Companheiro de treino (Mestre Sena) na academia de Mestre Bimba em Salvador nos anos 1960'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Carlos Senna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia associated_with Gildo Alfinete (training companion at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training companion at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'iesambi.org/capoeira_arquivos/ascadf/mestrearraia.htm',
  'Training companion at Mestre Bimba''s academy in Salvador during 1960s',
  'Companheiro de treino na academia de Mestre Bimba em Salvador nos anos 1960'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Gildo Alfinete'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia associated_with Roberto Satanás (training companion at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training companion at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'iesambi.org/capoeira_arquivos/ascadf/mestrearraia.htm',
  'Training companion (Robertinho S.) at Mestre Bimba''s academy in Salvador during 1960s',
  'Companheiro de treino (Robertinho S.) na academia de Mestre Bimba em Salvador nos anos 1960'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Arraia' AND s.apelido_context IS NULL
  AND o.apelido = 'Roberto Satanás'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Arraia cultural_pioneer_of Brasília (first to bring capoeira to public schools)
-- Note: This would be a person-to-location statement; using notes instead since location isn't an entity type

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Arraia taught Danadinho (Cláudio José Queiroz)
--   → Danadinho EXISTS in dataset (danadinho.sql)
--   → BUT: Relationship should be in DANADINHO's file (he is the student/subject)
--   → See: docs/genealogy/sql-imports/statements/persons/danadinho.sql
--
-- Arraia taught Tabosa (Hélio Tabosa)
--   → Tabosa in backlog (persons-backlog.md)
--   → Relationship goes in tabosa.sql when imported (Tabosa is subject)
--
-- Arraia taught Fritz (Alfredo)
--   → Fritz in backlog (persons-backlog.md)
--   → Relationship goes in fritz.sql when imported (Fritz is subject)
--
-- Arraia taught Barto
--   → Barto in backlog (persons-backlog.md)
--   → Relationship goes in barto.sql when imported (Barto is subject)
--
-- Arraia associated_with Adilson (met later after returning to Brasília)
--   → Mestre Adilson in backlog (persons-backlog.md)
--   → Context: "Arraia visited Adilson's roda at Elefante Branco, accompanied by Mestre Tabosa"
--   → Relationship could go in either file (mutual association)
-- ============================================================
