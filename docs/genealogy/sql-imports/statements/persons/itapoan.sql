-- ============================================================
-- STATEMENTS FOR: Itapoan
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Itapoan is the SUBJECT.
-- ============================================================

-- Itapoan student_of Bimba (1964-1972)
-- Primary teacher relationship - trained continuously for 8 years at CCFR
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-09-22'::date, 'exact'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources: Lalaue, Portal Capoeira, Ginga website',
  E'Began training September 22, 1964 at Centro de Cultura Física Regional, Terreiro de Jesus, Salvador. Completed all courses: blue scarf (1965), red scarf (1966), yellow scarf (1967). Champion at Bimba''s graduate tournament (1970). Training ended when Bimba moved to Goiânia in 1972.',
  E'Começou treinamento em 22 de setembro de 1964 no Centro de Cultura Física Regional, Terreiro de Jesus, Salvador. Completou todos os cursos: lenço azul (1965), lenço vermelho (1966), lenço amarelo (1967). Campeão no torneio de formados de Bimba (1970). Treinamento terminou quando Bimba mudou para Goiânia em 1972.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Itapoan' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Itapoan associated_with Atenilo (trained together at Bimba's academy)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1964-01-01'::date, 'year'::genealogy.date_precision,
  '1972-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Training companions at Mestre Bimba academy"}'::jsonb, 'verified'::genealogy.confidence,
  'Multiple sources: Mestre Itapoan''s books, Lalaue',
  E'Trained together at Mestre Bimba''s Centro de Cultura Física Regional. Itapoan later wrote "Atenilo, o Relâmpago da Capoeira Regional" (1988) documenting Atenilo''s testimony about early capoeira history and the founding of Regional.',
  E'Treinaram juntos no Centro de Cultura Física Regional de Mestre Bimba. Itapoan posteriormente escreveu "Atenilo, o Relâmpago da Capoeira Regional" (1988) documentando o testemunho de Atenilo sobre a história inicial da capoeira e a fundação da Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Itapoan' AND o.apelido = 'Atenilo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Itapoan co_founded Ginga Associação de Capoeira (Nov 13, 1972) - needs group import
-- Itapoan leads Ginga Associação de Capoeira (1972-present) - needs group import
-- Itapoan founded ABPC (Associação Brasileira dos Professores de Capoeira, 1980) - needs group import
-- Itapoan co_founded Federação Bahiana de Capoeira (1983) - needs group import
-- Itapoan associated_with Hélio Campos/Xaréu (co-founder of Ginga) - Xaréu not in dataset
-- Itapoan associated_with Mestre Decânio (co-authorities on Bimba) - Decânio not in dataset
-- Itapoan teacher_of Mestre Kiki da Bahia - Kiki not in dataset
