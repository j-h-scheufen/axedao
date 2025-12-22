-- ============================================================
-- STATEMENTS FOR: Bigode de Seda
-- Generated: 2025-12-15
-- Updated: 2025-12-20 (added Pastinha 1967 connection, updated apelido)
-- ============================================================
-- Contains all relationships where Bigode de Seda is the SUBJECT.
-- ============================================================

-- Bigode de Seda co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts (O ABC da Capoeira Angola, 1993); Velhos Mestres; Pastinha interview 1967',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra, Gengibirra.',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, Gengibirra.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Bigode de Seda' AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Bigode de Seda associated_with Pastinha (contemporary recognition)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "fellow_capoeirista"}'::jsonb,
  'verified'::genealogy.confidence,
  'Pastinha interview Revista Realidade 1967; velhosmestres.com/en/pastinha-1967',
  'Bigode de Seda was present at Gengibirra when Pastinha was introduced to the roda in 1941. Pastinha later remembered him among the legendary capoeiristas of the past in his 1967 interview.',
  'Bigode de Seda estava presente no Gengibirra quando Pastinha foi apresentado à roda em 1941. Pastinha mais tarde o lembrou entre os lendários capoeiristas do passado em sua entrevista de 1967.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bigode de Seda' AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (no additional relationships documented)
-- ============================================================
-- No teacher-student relationships documented for Bigode de Seda.
-- No students documented.
-- ============================================================
