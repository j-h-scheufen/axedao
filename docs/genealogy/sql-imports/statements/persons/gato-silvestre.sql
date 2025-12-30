-- ============================================================
-- STATEMENTS FOR: Gato (Silvestre) / Julival do Espírito Santo
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Gato (Silvestre) is the SUBJECT.
-- Uses apelido_context 'Silvestre' to identify this specific Gato.
-- ============================================================

-- Gato trained_under Onça Tigre (uncle, first introduction to capoeira in Goiás)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"context": "family introduction, uncle"}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com, matumbecapoeira.es',
  'First contact with capoeira in Goiás through his uncle Onça Tigre',
  'Primeiro contato com capoeira em Goiás através de seu tio Onça Tigre'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Silvestre'
  AND o.apelido = 'Onça Tigre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato student_of Silvestre (primary teacher, São Paulo)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com, matumbecapoeira.es, silvestre.md',
  'Primary teacher at Associação de Capoeira Vera Cruz, São Paulo',
  'Professor principal na Associação de Capoeira Vera Cruz, São Paulo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Silvestre'
  AND o.apelido = 'Silvestre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato received_title_from Silvestre (mestre title, late 1970s, I Encontro de Capoeira da Amazônia)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1979-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "I Encontro de Capoeira da Amazônia", "location": "Manaus, Amazonas"}}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com, silvestre.md',
  'Received mestre diploma at I Encontro de Capoeira da Amazônia in Manaus, late 1970s',
  'Recebeu diploma de mestre no I Encontro de Capoeira da Amazônia em Manaus, final dos anos 1970'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Silvestre'
  AND o.apelido = 'Silvestre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato family_of Onça Tigre (nephew)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "nephew"}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com, onca-tigre.md',
  'Nephew of Mestre Onça Tigre',
  'Sobrinho de Mestre Onça Tigre'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Silvestre'
  AND o.apelido = 'Onça Tigre'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gato trained_under Danadinho (Brasília, before moving to São Paulo)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"context": "Brasília training, Senzala connection"}'::jsonb, 'verified'::genealogy.confidence,
  'matumbecapoeira.com, gato-silvestre.md',
  'Trained in Brasília with Cláudio Danadinho (Senzala co-founder) before moving to São Paulo; Danadinho was a student of Mestre Arraia (Pastinha lineage)',
  'Treinou em Brasília com Cláudio Danadinho (co-fundador Senzala) antes de ir para São Paulo; Danadinho foi aluno de Mestre Arraia (linhagem Pastinha)'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gato' AND s.apelido_context = 'Silvestre'
  AND o.apelido = 'Danadinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NO MORE PENDING RELATIONSHIPS
-- ============================================================
