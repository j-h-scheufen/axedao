-- ============================================================
-- STATEMENTS FOR: Eutíquio
-- Generated: 2025-12-22
-- ============================================================
-- Contains all relationships where Eutíquio is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- Eutíquio student_of Oleriano de Góes (father, African)
-- Eutíquio learned capoeira from his father, the African Oleriano de Góes.
-- Gato Preto's own testimony confirms: "Aprendi capoeira com meu pai, que aprendeu
-- com meu avô" (I learned from my father [Eutíquio], who learned from my
-- grandfather [Oleriano]). This makes Oleriano = Eutíquio's father.
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
  NULL, NULL,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Gato Preto testimony (velhosmestres.com); USP Núcleo de Artes Afro-Brasileiras',
  'Eutíquio learned capoeira from his father, the African Oleriano de Góes, in Santo Amaro da Purificação. This represents direct African transmission of capoeira. Gato Preto confirmed: "Aprendi capoeira com meu pai, que aprendeu com meu avô".',
  'Eutíquio aprendeu capoeira com seu pai, o africano Oleriano de Góes, em Santo Amaro da Purificação. Isto representa a transmissão africana direta da capoeira. Gato Preto confirmou: "Aprendi capoeira com meu pai, que aprendeu com meu avô".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eutíquio' AND o.apelido = 'Oleriano de Góes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Eutíquio family_of Oleriano de Góes (son)
-- Eutíquio was the son of Oleriano de Góes.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb,
  'likely'::genealogy.confidence,
  'Gato Preto testimony (velhosmestres.com); USP Núcleo de Artes Afro-Brasileiras',
  'Eutíquio was the son of the African Oleriano de Góes. Gato Preto confirmed: "Aprendi capoeira com meu pai, que aprendeu com meu avô" (I learned from my father [Eutíquio], who learned from my grandfather [Oleriano]).',
  'Eutíquio era filho do africano Oleriano de Góes. Gato Preto confirmou: "Aprendi capoeira com meu pai, que aprendeu com meu avô" (Aprendi com meu pai [Eutíquio], que aprendeu com meu avô [Oleriano]).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eutíquio' AND o.apelido = 'Oleriano de Góes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: Gato Preto family_of Eutíquio (son) goes in gato-preto.sql
-- per the ownership rule (subject's file).
-- ============================================================

-- Eutíquio family_of João Catarino (brother)
-- João Catarino was Eutíquio's brother.
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; capoeirawiki.org',
  'Eutíquio and João Catarino were brothers, both sons of the African Oleriano de Góes. After Eutíquio stopped teaching his son Gato Preto around 1942, João Catarino continued the boy''s education. João Catarino was a student of Besouro Mangangá.',
  'Eutíquio e João Catarino eram irmãos, ambos filhos do africano Oleriano de Góes. Depois que Eutíquio parou de ensinar seu filho Gato Preto por volta de 1942, João Catarino continuou a educação do menino. João Catarino era aluno de Besouro Mangangá.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Eutíquio' AND o.apelido = 'João Catarino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- (No pending relationships - all objects now in dataset)
