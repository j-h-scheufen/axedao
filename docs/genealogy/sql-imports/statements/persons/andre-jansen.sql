-- ============================================================
-- STATEMENTS FOR: André Jansen
-- Generated: 2025-12-16
-- ============================================================
-- Contains all relationships where André Jansen is the SUBJECT.
-- ============================================================

-- André Jansen student_of Sinhozinho
-- Primary teacher relationship - trained at Sinhozinho's academies in Ipanema
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirahistory.com/mestre/master-sinhozinho-1891-1962/',
  E'André Jansen was described as "the highlight of [Sinhozinho''s] first generation" of students. He trained at Sinhozinho''s academies in Ipanema during the 1930s-1940s. Sinhozinho praised him as his best student of that era, before Rudolf Hermanny emerged in the later generation.',
  E'André Jansen foi descrito como "o destaque da primeira geração" de alunos de Sinhozinho. Treinou nas academias de Sinhozinho em Ipanema durante as décadas de 1930-1940. Sinhozinho o elogiou como seu melhor aluno daquela época, antes de Rudolf Hermanny emergir na geração posterior.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'André Jansen' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NON-CAPOEIRA OPPONENTS (not imported to database)
-- ============================================================
-- André Jansen faced Ricardo Nibbon (George Gracie student, jiu-jitsu/catch-as-catch-can)
-- at Parque Boa Vista, Salvador, October 30, 1935.
-- Ricardo Nibbon was NOT a capoeirista - he was a jiu-jitsu practitioner.
-- This fight is documented in the bio and notes but no statement is created.
-- ============================================================
