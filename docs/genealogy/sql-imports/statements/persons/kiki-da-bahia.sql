-- ============================================================
-- STATEMENTS FOR: Kiki da Bahia
-- Generated: 2026-01-11
-- ============================================================
-- Contains all relationships where Kiki da Bahia is the SUBJECT.
-- ============================================================

-- Kiki da Bahia student_of Nenei (father, family training from age 8)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1973-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'http://gingacapoeira.com/who-we-are',
  'Kiki began studying capoeira with his father Mestre Nenei and uncle at age 8. Nenei was his first teacher in the family Bimba lineage.',
  'Kiki começou a estudar capoeira com seu pai Mestre Nenei e tio aos 8 anos. Nenei foi seu primeiro professor na linhagem familiar de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Kiki da Bahia' AND o.apelido = 'Nenei'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Kiki da Bahia student_of Itapoan (formal training as teenager, protégé)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1980-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"relationship_type": "protégé"}'::jsonb, 'verified'::genealogy.confidence,
  'http://gingacapoeira.com/who-we-are',
  'Kiki formally trained with Mestre Itapoan as a teenager and became his protégé. Itapoan passed him the legacy of representing Capoeira Regional in the USA.',
  'Kiki treinou formalmente com Mestre Itapoan na adolescência e tornou-se seu protegido. Itapoan lhe passou o legado de representar a Capoeira Regional nos EUA.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Kiki da Bahia' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Kiki da Bahia family_of Nenei (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'http://gingacapoeira.com/who-we-are',
  'Kiki da Bahia is the son of Mestre Nenei.',
  'Kiki da Bahia é filho de Mestre Nenei.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Kiki da Bahia' AND o.apelido = 'Nenei'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Kiki da Bahia founded Ginga Associação de Capoeira USA (1996)
--   Group not yet in dataset. Add when group profiles are imported.
--   Pending: Kiki da Bahia founded Ginga Associação de Capoeira USA
--   Started: 1996, exact
--   Source: http://gingacapoeira.com/who-we-are
--
-- Kiki da Bahia trained_under Unknown Uncle
--   Uncle not identified. No SQL possible without identity.
--   Notes: "Mestre Kiki da Bahia began studying with his father and uncle at the age of 8"
--   Source: http://gingacapoeira.com/who-we-are
