-- ============================================================
-- STATEMENTS FOR: Nestor Capoeira
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Nestor Capoeira is the SUBJECT.
-- Relationships where Nestor Capoeira is the OBJECT should be in
-- the subject person's file.
-- ============================================================

-- Nestor Capoeira student_of Leopoldina (1965-1968)
-- Primary teacher who initiated Nestor into capoeira
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'year'::genealogy.date_precision,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com, capoeirawiki.org, velhosmestres.com',
  'Nestor was initiated into capoeira by Mestre Leopoldina in 1965. He continued training until joining Grupo Senzala in 1968. Nestor later co-produced the 2005 documentary "Mestre Leopoldina - A Fina Flor da Malandragem" about his first teacher.',
  'Nestor foi iniciado na capoeira por Mestre Leopoldina em 1965. Continuou treinando até entrar no Grupo Senzala em 1968. Nestor posteriormente co-produziu o documentário de 2005 "Mestre Leopoldina - A Fina Flor da Malandragem" sobre seu primeiro mestre.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Nestor Capoeira' AND o.apelido = 'Leopoldina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- These relationships will be added when the objects are imported.
-- ============================================================

-- Nestor Capoeira trained_under Preguiça (Walmir Oliveira)
-- At Grupo Senzala (1968-1990)
-- Preguiça not yet in dataset

-- Nestor Capoeira associated_with Gato (Fernando C. de Albuquerque)
-- Supervised Nestor's teaching as contramestre at UFRJ (1968)
-- Gato not yet in dataset
-- association_context: "Gato supervised Nestor's contramestre teaching at UFRJ"

-- Nestor Capoeira member_of Grupo Senzala (1968-1990)
-- Achieved corda vermelha (highest rank) in 1969
-- Grupo Senzala not yet in dataset

-- Nestor Capoeira founded Escola Nestor Capoeira (1990)
-- Founded after leaving Grupo Senzala
-- Escola Nestor Capoeira not yet in dataset

-- Nestor Capoeira cultural_pioneer_of Europe (1971)
-- First Brazilian mestre to teach capoeira regularly in Europe
-- Would need a different predicate or location entity structure
