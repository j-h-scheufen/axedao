-- ============================================================
-- STATEMENTS FOR: Marco Buscapé
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Marco Buscapé is the SUBJECT.
--
-- NOTE: Relationships where Marco Buscapé is the OBJECT belong in
-- the object's file (e.g., if someone "student_of Marco Buscapé",
-- that would go in the student's file).
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Marco Buscapé student_of Zé Bedeu (primary teacher - father)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Zé Bedeu was Marco Buscapé''s father and primary capoeira teacher. The source states "Zé Bedeu (pai e mestre de Marco Buscapé)" - literally "Zé Bedeu (father and master of Marco Buscapé)". This was a traditional family transmission of capoeira, likely in the Nazaré neighborhood of Salvador during the 1940s-1950s.',
  E'Zé Bedeu era pai e principal professor de capoeira de Marco Buscapé. A fonte afirma "Zé Bedeu (pai e mestre de Marco Buscapé)". Esta foi uma transmissão tradicional familiar da capoeira, provavelmente no bairro de Nazaré em Salvador durante os anos 1940-1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Buscapé' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Marco Buscapé family_of Zé Bedeu (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "son"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Marco Buscapé was the son of Zé Bedeu. The source explicitly states "Zé Bedeu (pai e mestre de Marco Buscapé)" - "Zé Bedeu (father and master of Marco Buscapé)".',
  E'Marco Buscapé era filho de Zé Bedeu. A fonte afirma explicitamente "Zé Bedeu (pai e mestre de Marco Buscapé)".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Buscapé' AND o.apelido = 'Zé Bedeu'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Buscapé family_of Roque (cousin)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "cousin"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Marco Buscapé and Mestre Roque were cousins. Roque''s father Chico Preto (Liberato Francisco Xavier) was the brother of Zé Bedeu (Marco''s father). Both families practiced capoeira in Salvador.',
  E'Marco Buscapé e Mestre Roque eram primos. O pai de Roque, Chico Preto (Liberato Francisco Xavier), era irmão de Zé Bedeu (pai de Marco). Ambas as famílias praticavam capoeira em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Buscapé' AND o.apelido = 'Roque'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Marco Buscapé family_of Chico Preto (uncle - nephew relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "nephew"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  E'Chico Preto (Liberato Francisco Xavier) was Marco Buscapé''s uncle - the brother of his father Zé Bedeu. Both brothers were capoeiristas in Salvador.',
  E'Chico Preto (Liberato Francisco Xavier) era tio de Marco Buscapé - irmão de seu pai Zé Bedeu. Ambos os irmãos eram capoeiristas em Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Marco Buscapé' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NO PENDING RELATIONSHIPS
-- ============================================================
-- All known relationships have been generated above.
-- Marco Buscapé's documented relationships are limited to:
-- - Father/teacher: Zé Bedeu (exists in dataset)
-- - Cousin: Roque (exists in dataset)
-- - Uncle: Chico Preto (exists in dataset)
-- ============================================================
