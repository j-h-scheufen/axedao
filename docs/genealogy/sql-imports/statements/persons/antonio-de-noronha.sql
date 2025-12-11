-- ============================================================
-- STATEMENTS FOR: Antônio de Noronha
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Antônio de Noronha is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'year'::genealogy.date_precision,
  '1912-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com/en/featured-2; esquiva.wordpress.com; testimony of Mestre Caiçara and Mestre Silvestre',
  'Aberrê learned capoeira from Mestre Antônio de Noronha around 1910-1912 in Salvador. Some sources also mention Pastinha as a teacher during this period. Testimony from Mestre Caiçara and Mestre Silvestre confirms the lineage: "Mestre Aberrê is the second mestre in my lineage, above him comes Mestre Antônio de Noronha."',
  'Aberrê aprendeu capoeira com Mestre Antônio de Noronha por volta de 1910-1912 em Salvador. Algumas fontes também mencionam Pastinha como professor durante este período. Testemunho de Mestre Caiçara e Mestre Silvestre confirma a linhagem: "Mestre Aberrê é o segundo mestre da minha linhagem, acima dele vem Mestre Antônio de Noronha."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Aberrê'
  AND o.apelido = 'Antônio de Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
