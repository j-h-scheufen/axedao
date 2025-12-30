-- ============================================================
-- STATEMENTS FOR: Querido de Deus
-- Migrated: 2025-12-11
-- ============================================================
-- This file contains all relationships where Querido de Deus is the subject.
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
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1937-01-14'::date, 'exact'::genealogy.date_precision,
  '1938-09-18'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Famous contemporaries in 1930s Salvador. Played together at the II Afro-Brazilian Congress (January 14, 1937) witnessed by Edison Carneiro and Jorge Amado. Also played together in Ruth Landes'' documented roda at Itapagipe (September 18, 1938). Onça Preta trained under Samuel alongside other mestres."}'::jsonb,
  'verified'::genealogy.confidence,
  'Ruth Landes "The City of Women" (1947); Smithsonian Institution photographs; velhosmestres.com',
  'Samuel and Onça Preta played together at major documented events: the 1937 Afro-Brazilian Congress and the 1938 Itapagipe roda photographed by Ruth Landes. Onça Preta listed Samuel as one of his teachers.',
  'Samuel e Onça Preta jogaram juntos em eventos documentados importantes: o Congresso Afro-Brasileiro de 1937 e a roda de Itapagipe de 1938 fotografada por Ruth Landes. Onça Preta listou Samuel como um de seus professores.'
FROM genealogy.person_profiles q, genealogy.person_profiles o
WHERE q.apelido = 'Querido de Deus' AND o.apelido = 'Onça Preta'
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
  'person'::genealogy.entity_type, o.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, q.id,
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta interview 1972 (O Dia newspaper); velhosmestres.com',
  'Onça Preta (b. 1909) stated in interviews that he trained under multiple mestres as a boy in Salvador, including "Samuel" (Samuel Querido de Deus). He recalled: "I had not one, but many mestres... Still a boy, I jumped with Samuel, with Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê..."',
  'Onça Preta (n. 1909) declarou em entrevistas que treinou com múltiplos mestres quando menino em Salvador, incluindo "Samuel" (Samuel Querido de Deus). Ele recordou: "Não tive um, mas muitos mestres... Ainda menino, pulei com Samuel, com Pastinha, Besourinho, Vitor Agaú, Gasolina, Aberrê..."'
FROM genealogy.person_profiles o, genealogy.person_profiles q
WHERE o.apelido = 'Onça Preta' AND q.apelido = 'Querido de Deus'
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
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, b.id,
  '1936-03-12'::date, 'exact'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Public challenge between the two masters in 1936 over the title of maximum capoeira master of Bahia. Reported in O Imparcial (March 12) and Diário da Bahia (March 13). Bimba''s measured response suggested arranging a fight ''so people are not deceived.'' No record of actual fight occurring. Represented opposing poles of Bahian capoeira: Samuel''s traditional Angola vs Bimba''s modernizing Regional."}'::jsonb,
  'verified'::genealogy.confidence,
  'O Imparcial (March 12, 1936); Diário da Bahia (March 13, 1936); velhosmestres.com',
  'Public challenge over the title of "maximum capoeira master" of Bahia. Bimba responded that Samuel should arrange a fight "so people are not deceived". No record of the fight occurring.',
  'Desafio público pelo título de "mestre máximo da capoeira" da Bahia. Bimba respondeu que Samuel deveria arranjar uma luta "para que o povo não seja enganado". Sem registro de luta acontecendo.'
FROM genealogy.person_profiles q, genealogy.person_profiles b
WHERE q.apelido = 'Querido de Deus' AND b.apelido = 'Bimba'
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
  'person'::genealogy.entity_type, q.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  '1947-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "Both were first-generation mestres of modern capoeira Angola in Salvador. Onça Preta trained under both of them. While Pastinha would later codify and institutionalize Capoeira Angola at CECA, Samuel was recognized as the greatest practitioner of the 1930s without founding an academy."}'::jsonb,
  'likely'::genealogy.confidence,
  'Onça Preta interviews; velhosmestres.com; capoeirahistory.com',
  'Both recognized as first-generation mestres of Capoeira Angola in Salvador. Onça Preta trained under both. Samuel was the dominant figure of the 1930s while Pastinha would later codify the style.',
  'Ambos reconhecidos como mestres da primeira geração da Capoeira Angola em Salvador. Onça Preta treinou com ambos. Samuel era a figura dominante dos anos 1930 enquanto Pastinha mais tarde codificaria o estilo.'
FROM genealogy.person_profiles q, genealogy.person_profiles p
WHERE q.apelido = 'Querido de Deus' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;
