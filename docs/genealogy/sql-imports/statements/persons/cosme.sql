-- ============================================================
-- STATEMENTS FOR: Cosme
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Cosme is the SUBJECT.
-- ============================================================

-- Cosme student_of Roque
-- Primary teacher-student relationship; trained at Roque's final academy
-- in Vilar do Teles, São João de Meriti
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/students-of-mestre-roque/',
  E'Trained with Mestre Roque at his final academy in Vilar do Teles, São João de Meriti, Baixada Fluminense. Featured in "Alunos de M. Roque" documentary alongside M. Paulo Siqueira and M. Lapinha.',
  E'Treinou com Mestre Roque em sua última academia em Vilar do Teles, São João de Meriti, Baixada Fluminense. Apresentado no documentário "Alunos de M. Roque" ao lado de M. Paulo Siqueira e M. Lapinha.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cosme' AND s.apelido_context = 'Rio de Janeiro, Roque lineage'
  AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATED_WITH RELATIONSHIPS (fellow students)
-- ============================================================

-- Cosme associated_with Lapinha
-- Fellow students of Mestre Roque; appeared together in documentary
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "fellow students of Mestre Roque; co-appeared in documentary"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/students-of-mestre-roque/',
  E'Fellow students under Mestre Roque. Both appeared in "Alunos de M. Roque" documentary produced by CapoeiraHistory.',
  E'Colegas de treino sob Mestre Roque. Ambos apareceram no documentário "Alunos de M. Roque" produzido pelo CapoeiraHistory.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cosme' AND s.apelido_context = 'Rio de Janeiro, Roque lineage'
  AND o.apelido = 'Lapinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Note: The following fellow students of Roque are already in the dataset:
-- - Sandrinha (imported) - fellow student
-- - Poeira (imported) - fellow student
-- - Derli (imported) - fellow student
-- - Adilson Camisa Preta (imported) - senior fellow student
-- - Paulo Siqueira (in backlog) - co-appeared in documentary
--
-- associated_with statements for these can be added when updating
-- their respective statements files to include Cosme.
