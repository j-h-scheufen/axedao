-- ============================================================
-- STATEMENTS FOR: Vilmar
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Vilmar is the SUBJECT.
-- ============================================================

-- Vilmar student_of Djalma Bandeira
-- Primary teacher-student relationship. Vilmar learned capoeira from
-- Djalma Bandeira at the IAPC Residential Complex in Olaria, Rio de Janeiro.
-- Multiple sources confirm this relationship, including André Lacé Lopes
-- and capoeirahistory.com.
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
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-djalma-bandeira-1934-1988/',
  E'Vilmar was a student of Mestre Djalma Bandeira at IAPC Olaria. Training ended with Djalma''s death in 1988.',
  E'Vilmar foi aluno de Mestre Djalma Bandeira no IAPC Olaria. O treinamento terminou com a morte de Djalma em 1988.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vilmar' AND s.apelido_context IS NULL
  AND o.apelido = 'Djalma Bandeira' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Vilmar associated_with Leopoldina
-- Vilmar and Leopoldina performed together in the 1961 Mangueira carnival
-- parade. Leopoldina organized the capoeira section and recruited Vilmar.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "1961 Mangueira Carnival parade"}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/capoeira-parading-for-the-samba-schools/',
  E'Leopoldina recruited Vilmar and others from Djalma''s group to parade in the historic 1961 Mangueira samba school parade - the first to feature capoeira.',
  E'Leopoldina recrutou Vilmar e outros do grupo de Djalma para desfilar no histórico desfile da escola de samba Mangueira de 1961 - o primeiro a apresentar capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vilmar' AND s.apelido_context IS NULL
  AND o.apelido = 'Leopoldina' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- None identified. All relationship objects exist in the dataset.
-- ============================================================
