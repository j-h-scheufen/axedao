-- ============================================================
-- STATEMENTS FOR: João Catarino
-- Generated: 2025-12-22
-- ============================================================
-- Contains all relationships where João Catarino is the SUBJECT.
-- Per ownership rule: statements go in file named after SUBJECT.
-- ============================================================

-- João Catarino student_of Besouro Mangangá
-- Learned capoeira from the legendary Besouro before his death in 1924.
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
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com; capoeira.online; capoeirawiki.org',
  'João Catarino was a student of Besouro Mangangá, learning from him in Santo Amaro da Purificação before Besouro''s death on July 8, 1924. Gato Preto confirmed: "meu tio, João Catarino, aluno de Besouro" (my uncle, João Catarino, a student of Besouro). This makes João Catarino one of the few documented students of Besouro alongside Cobrinha Verde and Siri de Mangue.',
  'João Catarino foi aluno de Besouro Mangangá, aprendendo com ele em Santo Amaro da Purificação antes da morte de Besouro em 8 de julho de 1924. Gato Preto confirmou: "meu tio, João Catarino, aluno de Besouro". Isso torna João Catarino um dos poucos alunos documentados de Besouro ao lado de Cobrinha Verde e Siri de Mangue.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Catarino' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- João Catarino family_of Eutíquio (brother)
-- João Catarino was the brother of Eutíquio Lúcio Góes.
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
  'João Catarino was the brother of Eutíquio Lúcio Góes. As Gato Preto''s "tio" (uncle) on his father''s side, João Catarino and Eutíquio shared the same father, the African Oleriano de Góes. Both were part of the Góes family capoeira lineage from Santo Amaro da Purificação.',
  'João Catarino era irmão de Eutíquio Lúcio Góes. Como "tio" de Gato Preto pelo lado paterno, João Catarino e Eutíquio tinham o mesmo pai, o africano Oleriano de Góes. Ambos faziam parte da linhagem de capoeira da família Góes de Santo Amaro da Purificação.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Catarino' AND o.apelido = 'Eutíquio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- João Catarino family_of Oleriano de Góes (son)
-- João Catarino was the son of Oleriano de Góes (African patriarch).
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
  'velhosmestres.com; inferred from family structure',
  'João Catarino was the son of the African Oleriano de Góes. As the brother of Eutíquio (who was confirmed as Oleriano''s son), João Catarino was also a son of Oleriano. This represents the first Brazilian-born generation in the Góes family capoeira lineage.',
  'João Catarino era filho do africano Oleriano de Góes. Como irmão de Eutíquio (que foi confirmado como filho de Oleriano), João Catarino também era filho de Oleriano. Isto representa a primeira geração nascida no Brasil na linhagem de capoeira da família Góes.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'João Catarino' AND o.apelido = 'Oleriano de Góes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- NOTE: The following relationships have João Catarino as OBJECT,
-- so they go in the SUBJECT's file per the ownership rule:
--
-- - Gato Preto student_of João Catarino → goes in gato-preto.sql
-- - Gato Preto family_of João Catarino (nephew) → goes in gato-preto.sql
-- - Mestre Léo student_of João Catarino → goes in leo.sql (pending)
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- No pending relationships for João Catarino.
-- All known objects (Besouro, Eutíquio, Oleriano) are in dataset.
