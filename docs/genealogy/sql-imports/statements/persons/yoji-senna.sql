-- ============================================================
-- STATEMENTS FOR: Yoji Senna
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Yoji Senna is the SUBJECT.
-- ============================================================

-- Yoji Senna student_of Carlos Senna (primary teacher, father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.abcapoeira.com/about/mestre-yoji-senna/',
  'Began training under father at Colégio Militar de Salvador in 1975 (age 12). Father-son lineage continuing Bimba→Carlos Senna→Yoji Senna.',
  'Iniciou treinamento sob seu pai no Colégio Militar de Salvador em 1975 (12 anos). Linhagem pai-filho continuando Bimba→Carlos Senna→Yoji Senna.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Yoji Senna' AND o.apelido = 'Carlos Senna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Yoji Senna family_of Carlos Senna (biological father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-04-06'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.abcapoeira.com/about/mestre-yoji-senna/',
  'Biological son of Mestre Carlos Senna.',
  'Filho biológico de Mestre Carlos Senna.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Yoji Senna' AND o.apelido = 'Carlos Senna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (group not yet in dataset)
-- ============================================================
-- Yoji Senna founded ABCA (Afro-Brazilian Capoeira Association) - group needs import first
-- Yoji Senna member_of Senavox - group needs import first
-- Yoji Senna founded Departamento de Cultura Afro-Americana (UBA) - not a capoeira group per se
