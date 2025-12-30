-- ============================================================
-- STATEMENTS FOR: Pierrô
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Pierrô is the SUBJECT.
-- Relationships where Pierrô is the OBJECT go in the subject's file.
-- ============================================================

-- Pierrô student_of Zeca do Uruguai
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
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Pierrô learned capoeira under Zeca do Uruguai in the Uruguai neighborhood. Classes took place in a space next to Zeca''s house where students trained for street rodas.',
  'Pierrô aprendeu capoeira com Zeca do Uruguai no bairro do Uruguai. As aulas aconteciam em um espaço ao lado da casa de Zeca onde os alunos treinavam para as rodas de rua.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pierrô' AND o.apelido = 'Zeca do Uruguai'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pierrô associated_with Nô (elder master relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1952-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "elder master who taught him alongside Zeca do Uruguai"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'When young Norival (Mestre Nô) arrived in Massaranduba in 1952, Nilton and Cutica took him to meet the elder masters Pierrô and Zeca. Pierrô, Zeca, and Nilton organized and commanded many capoeira angola rodas in the streets where Nô trained.',
  'Quando o jovem Norival (Mestre Nô) chegou em Massaranduba em 1952, Nilton e Cutica o levaram para conhecer os mestres mais velhos Pierrô e Zeca. Pierrô, Zeca e Nilton organizavam e comandavam muitas rodas de capoeira angola nas ruas onde Nô treinou.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pierrô' AND o.apelido = 'Nô'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pierrô associated_with Nilton (organized rodas together)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "co-organizer of street rodas in Lower City"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/en/featured-39',
  'Pierrô, Zeca do Uruguai, and Nilton organized and commanded many capoeira angola rodas in the streets of Salvador''s Lower City',
  'Pierrô, Zeca do Uruguai e Nilton organizavam e comandavam muitas rodas de capoeira angola nas ruas da Cidade Baixa de Salvador'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pierrô' AND o.apelido = 'Nilton'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Note: Nilton student_of Pierrô goes in nilton.sql (Nilton is the subject) - DONE
-- Note: Cutica student_of Pierrô goes in cutica.sql (Cutica is the subject) - DONE
-- Note: Vermelho Boxer trained_under Pierrô goes in vermelho-boxer.sql (Vermelho Boxer is the subject)
