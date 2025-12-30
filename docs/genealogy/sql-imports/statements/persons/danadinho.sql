-- ============================================================
-- STATEMENTS FOR: Danadinho (Cláudio José Queiroz)
-- Generated: 2025-12-26
-- Updated: 2025-12-26 (added Arraia relationship after import)
-- ============================================================
-- Contains all relationships where Danadinho is the SUBJECT.
-- ============================================================

-- Danadinho trained_under Arraia (Aldenor Benjamim, 1946-2005)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-01-01'::date, 'year'::genealogy.date_precision,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '{"context": "Colégio Elefante Branco, Brasília"}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com/learn-capoeira/mestre-arraia, iesambi.org, danadinho.md',
  'Trained in Brasília under Mestre Arraia at Colégio Elefante Branco from early 1960s; Arraia had Pastinha/Bimba lineage from Salvador. Danadinho wrote tribute to Arraia on iesambi.org after his death (2005).',
  'Treinou em Brasília com Mestre Arraia no Colégio Elefante Branco desde o início dos anos 1960; Arraia tinha linhagem Pastinha/Bimba de Salvador. Danadinho escreveu tributo a Arraia no iesambi.org após sua morte (2005).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Danadinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Arraia'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- SENZALA FOUNDING MEMBERS (now in dataset)
-- ============================================================

-- Danadinho associated_with Paulo Flores (Senzala co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo Senzala co-founding members; fellow corda vermelha"}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, grupo-senzala case study',
  E'Co-founding members of Grupo Senzala. Both received corda vermelha in the 1960s. Danadinho joined the Rio group in 1965 after training under Arraia in Brasília.',
  E'Membros co-fundadores do Grupo Senzala. Ambos receberam corda vermelha nos anos 1960. Danadinho juntou-se ao grupo do Rio em 1965 após treinar com Arraia em Brasília.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Danadinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Paulo Flores'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Danadinho associated_with Gato (Senzala co-founder)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Grupo Senzala co-founding members; fellow corda vermelha"}'::jsonb, 'verified'::genealogy.confidence,
  'lalaue.com, grupo-senzala case study',
  E'Co-founding members of Grupo Senzala. Both received corda vermelha in the 1960s.',
  E'Membros co-fundadores do Grupo Senzala. Ambos receberam corda vermelha nos anos 1960.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Danadinho' AND s.apelido_context IS NULL
  AND o.apelido = 'Gato' AND o.apelido_context = 'Senzala'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Danadinho co_founded Grupo Senzala
--   → Grupo Senzala is not in dataset (case study exists at docs/genealogy/case-studies/grupo-senzala.md)
--   → Need to import Grupo Senzala first
--   → Context: Joined 1965 in Rio de Janeiro with Peixinho and Itamar; formally named 1966
--
-- Danadinho associated_with Peixinho (Senzala) / Marcelo Azevedo Guimarães (1947-2011)
--   → Peixinho (Senzala) in backlog (persons-backlog.md line 284)
--   → Context: Peixinho started training with Danadinho in 1964; co-founding members
--
-- Danadinho associated_with Itamar (Senzala)
--   → Itamar in backlog
--   → Context: Met at Judo academy in Brasília 1964; co-founding members
--
-- Danadinho associated_with Tabosa (Hélio Tabosa)
--   → Tabosa in backlog (persons-backlog.md)
--   → Context: Brasília training companion; helped win Berimbau de Ouro 1967
--
-- Danadinho associated_with Fritz (Alfredo)
--   → Fritz in backlog
--   → Context: Brasília training companion; helped win Berimbau de Ouro 1967
-- ============================================================
