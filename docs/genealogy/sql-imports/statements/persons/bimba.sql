-- ============================================================
-- STATEMENTS FOR: Bimba
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Bimba is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1911-01-01'::date, 'year'::genealogy.date_precision,
  '1915-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources; Bimba''s own 1936 interview in A Tarde newspaper',
  'Bimba began learning capoeira from Bentinho at age 12, at Clube União em Apuros on Estrada das Boiadas. Training lasted approximately four years.',
  'Bimba começou a aprender capoeira com Bentinho aos 12 anos, no Clube União em Apuros na Estrada das Boiadas. O treinamento durou aproximadamente quatro anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Bentinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Cobrinha Verde''s own account in "Capoeira e Mandingas"; velhosmestres.com',
  'Cobrinha Verde stated: "I would leave Fazenda Garcia to give instruction to Bimba and help him give instructions to his students, at Bogum, Engenho Velho da Federação."',
  'Cobrinha Verde declarou: "Eu saía da Fazenda Garcia prá dar instrução a Bimba e ajudar ele a dar instruções aos seus alunos, no Bogum, Engenho Velho da Federação."'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Cobrinha Verde'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1929-01-01'::date, 'year'::genealogy.date_precision,
  '1974-02-05'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Itapoan''s book "Atenilo, o Relampago da Capoeira Regional" (1988)',
  'Atenilo was Bimba''s oldest student, starting in 1929 before the academy was officially founded. Witnessed the creation of Capoeira Regional at Bogum.',
  'Atenilo foi o aluno mais velho de Bimba, começando em 1929 antes da academia ser oficialmente fundada. Testemunhou a criação da Capoeira Regional no Bogum.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Atenilo' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1911-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Contemporaries in Bahian capoeira scene; Besouro died in 1924 before Bimba founded his academy. Connected through shared networks including Cobrinha Verde."}'::jsonb,
  'likely'::genealogy.confidence,
  'Historical context; both were active in Bahian capoeira scene in 1910s-1920s',
  'Besouro and Bimba were contemporaries in the Bahian capoeira scene. Besouro died in 1924, before Bimba founded his academy in 1932.',
  'Besouro e Bimba foram contemporâneos na cena de capoeira baiana. Besouro morreu em 1924, antes de Bimba fundar sua academia em 1932.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Bimba' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
