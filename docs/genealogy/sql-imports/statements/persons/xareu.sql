-- ============================================================
-- STATEMENTS FOR: Xaréu
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Xaréu is the SUBJECT.
-- ============================================================

-- ============================================================
-- PERSON-TO-PERSON RELATIONSHIPS
-- ============================================================

-- Xaréu student_of Bimba (trained at CCFR during Propagation Phase 1967-1973)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1967-01-01'::date, 'year'::genealogy.date_precision,
  '1973-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Esdras Santos (Damião), "Conversando sobre capoeira"; CapoeiraHub; Multiple academic sources',
  E'Trained at Centro de Cultura Física Regional (CCFR) during the "Propagation Phase" (1967-1973), the final era of Bimba''s academy. Received the apelido "Xaréu" from Mestre Bimba. Completed full formação in Capoeira Regional.',
  E'Treinou no Centro de Cultura Física Regional (CCFR) durante a "Fase de Propagação" (1967-1973), a era final da academia de Bimba. Recebeu o apelido "Xaréu" de Mestre Bimba. Completou formação plena em Capoeira Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Xaréu' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Xaréu baptized_by Bimba (received apelido "Xaréu" from Bimba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"baptism": {"apelido_given": "Xaréu"}}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources confirm baptism by Bimba',
  E'Received the apelido "Xaréu" (a fish species) from Mestre Bimba during his training at CCFR.',
  E'Recebeu o apelido "Xaréu" (uma espécie de peixe) de Mestre Bimba durante seu treinamento no CCFR.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Xaréu' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Xaréu associated_with Decânio (defended Osvaldo together; fellow students of Bimba)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": {"en": "Fellow students of Mestre Bimba; together defended student Osvaldo against blame for Bimba''s move to Goiânia", "pt": "Colegas alunos de Mestre Bimba; juntos defenderam o aluno Osvaldo contra a culpa pela mudança de Bimba para Goiânia"}}'::jsonb,
  'verified'::genealogy.confidence,
  'Jogo da Vida blog; A Triste Morte de Mestre Bimba',
  E'Both students of Mestre Bimba. Together issued a statement defending student Osvaldo: "não ser justo responsabilizar Osvaldo, nem qualquer outro aluno pela mudança para Goiânia" (it would not be fair to blame Osvaldo, or any other student, for the move to Goiânia).',
  E'Ambos alunos de Mestre Bimba. Juntos emitiram declaração defendendo o aluno Osvaldo: "não ser justo responsabilizar Osvaldo, nem qualquer outro aluno pela mudança para Goiânia".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Xaréu' AND o.apelido = 'Decânio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PERSON-TO-GROUP RELATIONSHIPS
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Xaréu co_founded Ginga Associação de Capoeira - PENDING: group not yet imported
--   (Note: Xaréu was co-founder and vice-president; Itapoan was co-founder and president)
--   Founded: November 13, 1972 in Salvador
--
-- Xaréu co_founded Federação Baiana de Capoeira - PENDING: group not yet imported
--   (Co-founded with Itapoan, likely 1983)
--
-- ============================================================
-- CONTEMPORARIES (not generating associated_with - just documented)
-- ============================================================
-- Fellow students of Bimba in Propagation Phase (1967-1973):
-- - Jair Moura (Jair Pinico)
-- - Vermelho
-- - Carneiro
-- - Camisa Roxa
-- - Medicina
-- - Acordeon
-- - Boinha
-- - Galo
-- - Prego
-- - Arara
-- - Volta Grande
-- - Macaco
-- - Canhão
-- These are contemporaries but no specific documented interactions beyond
-- training at the same academy. Not generating associated_with statements.
