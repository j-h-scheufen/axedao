-- ============================================================
-- STATEMENTS FOR: Vermelho 27
-- Generated: 2025-12-20
-- ============================================================
-- Contains all relationships where Vermelho 27 is the SUBJECT.
-- ============================================================

-- Vermelho 27 student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1953-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'CapoeiraWiki, Lalaue, UNICAR München',
  E'Met Bimba in 1952; began formal training in 1953 at CCFR. Graduated 1956. One of Bimba''s ten best students. Bimba called him "Maluco por Capoeira" (Crazy about Capoeira). Ended with Bimba''s death in 1974.',
  E'Conheceu Bimba em 1952; começou treinamento formal em 1953 no CCFR. Formado 1956. Um dos dez melhores alunos de Bimba. Bimba o chamou de "Maluco por Capoeira." Terminou com a morte de Bimba em 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Vermelho 27' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Vermelho 27 associated_with Ferro Velho (Mestre Durval) - needs import first
-- Context: Post-Bimba preservation effort; collaborated to keep academy running 1974+

-- Vermelho 27 associated_with Vermelho Boxel - needs import first
-- Context: Post-Bimba preservation effort; collaborated to keep academy running 1974+

-- Vermelho 27 associated_with Mestre Bahia - needs import first
-- Context: Post-Bimba preservation effort; collaborated to keep academy running 1974+

-- Vermelho 27 associated_with Mestre Bando - needs import first
-- Context: Post-Bimba preservation effort; collaborated to keep academy running 1974+

-- Vermelho 27 associated_with Mestre Boa Gente - needs import first
-- Context: Post-Bimba preservation effort; collaborated to keep academy running 1974+

-- ============================================================
-- INVERSE RELATIONSHIPS (where Vermelho 27 is OBJECT)
-- These statements belong in the SUBJECT's file, not here.
-- Documented for cross-reference:
-- ============================================================

-- Mestre Bamba student_of Vermelho 27 - belongs in bamba.sql
-- Mestre Cabeludo student_of Vermelho 27 - belongs in cabeludo.sql
-- Mestre Boa Gente trained_under Vermelho 27 - belongs in boa-gente.sql
