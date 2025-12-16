-- ============================================================
-- STATEMENTS FOR: Rudolf Hermanny
-- Generated: 2025-12-16
-- ============================================================
-- This file contains all relationships where Rudolf Hermanny is the subject.
-- Each statement uses ON CONFLICT DO NOTHING for idempotency.
-- ============================================================

-- Rudolf Hermanny student_of Sinhozinho
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
  NULL, 'unknown'::genealogy.date_precision,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; A Noite newspaper April 1, 1949; rohermanny.tripod.com',
  'Rudolf Hermanny trained under Mestre Sinhozinho at his academies in Ipanema during the mid-1940s through 1962. He was Sinhozinho''s most famous fighting student, representing the school in challenges against Mestre Bimba''s Regional (1949), the Gracie family (1953), and Artur Emídio (1953). His 1949 victory over Bimba''s student Perez reportedly impressed Bimba enough to incorporate some movements into Regional.',
  'Rudolf Hermanny treinou sob Mestre Sinhozinho em suas academias em Ipanema desde meados da década de 1940 até 1962. Ele foi o aluno lutador mais famoso de Sinhozinho, representando a escola em desafios contra a Regional de Mestre Bimba (1949), a família Gracie (1953) e Artur Emídio (1953). Sua vitória em 1949 sobre o aluno de Bimba, Perez, supostamente impressionou Bimba o suficiente para incorporar alguns movimentos na Regional.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Sinhozinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Rudolf Hermanny associated_with Cirandinha (training partner)
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
  NULL, 'unknown'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "training partner at Sinhozinho''s academy"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://capoeirahistory.com/mestre/master-sinhozinho/; nossa-tribo.com',
  'Rudolf Hermanny and Cirandinha (Luiz Pereira de Aguiar) were the two primary fighting representatives of Sinhozinho''s school. Together they represented capoeira carioca in the 1949 challenge against Bimba''s Regional and the 1953 challenge against the Gracie family at Vasco da Gama stadium.',
  'Rudolf Hermanny e Cirandinha (Luiz Pereira de Aguiar) foram os dois principais representantes de luta da escola de Sinhozinho. Juntos representaram a capoeira carioca no desafio de 1949 contra a Regional de Bimba e no desafio de 1953 contra a família Gracie no estádio do Vasco da Gama.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Rudolf Hermanny' AND o.apelido = 'Cirandinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Rudolf Hermanny trained_under Augusto Cordeiro - needs import first (judoka/combat consultant to Sinhozinho)
-- Rudolf Hermanny associated_with Bruno Hermanny - needs import first (brother, also trained under Sinhozinho)
-- Rudolf Hermanny associated_with André Lacé Lopes - needs import first (fellow Sinhozinho student, author of book about them)
