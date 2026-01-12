-- ============================================================
-- STATEMENTS FOR: Lapinha
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Lapinha is the SUBJECT.
-- ============================================================

-- Lapinha student_of Roque
-- Primary teacher-student relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/students-of-mestre-roque/',
  E'Lapinha "accompanied Mestre Roque at a later stage" of his teaching career. Roque taught at Pavão/Pavãozinho for 12 years (~1960-1972), then at various other locations. Lapinha joined at this later stage, likely in the 1970s-1980s.',
  E'Lapinha "acompanhou Mestre Roque em uma fase mais avançada" de sua carreira de ensino. Roque ensinou no Pavão/Pavãozinho por 12 anos (~1960-1972), depois em vários outros locais. Lapinha se juntou nesta fase posterior, provavelmente nos anos 1970-1980.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lapinha' AND o.apelido = 'Roque' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lapinha associated_with Sandrinha (fellow student under Roque)
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
  '{"association_context": "fellow student under Mestre Roque"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sandrinha-1959/',
  E'Both were students of Mestre Roque. Lapinha provided oral testimony about Sandrinha in 2019: "This Sandrinha... she played a lot. Nobody could challenge her, no. Nobody would dare to provoke her."',
  E'Ambos foram alunos de Mestre Roque. Lapinha forneceu depoimento oral sobre Sandrinha em 2019: "Essa Sandrinha... ela jogava muito. Ninguém podia desafiá-la, não. Ninguém se atrevia a provocá-la."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lapinha' AND o.apelido = 'Sandrinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- RELATIONSHIPS NOT CREATED (insufficient justification)
-- ============================================================
-- The following relationships were considered but NOT created:
--
-- Lapinha associated_with Acordeon - "photographed together" is insufficient
--   without documented collaboration, shared projects, or significant interaction
--
-- Lapinha associated_with Artur Emídio - "photographed together" is insufficient
--   Photos document presence at same event, not meaningful relationship
--
-- Lapinha associated_with Poeira/Derli/Cosme - "fellow student under Roque"
--   This relationship is trivially derivable from both having student_of Roque
--   and doesn't add meaningful relationship data
--
-- NOTE: The photographic archive (Acervo M. Lapinha) and fellow student context
-- are documented in the entity profile notes_en/notes_pt columns instead.
