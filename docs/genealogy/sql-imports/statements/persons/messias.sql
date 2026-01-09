-- ============================================================
-- STATEMENTS FOR: Messias
-- Generated: 2025-01-02
-- ============================================================
-- Contains all relationships where Messias is the SUBJECT.
-- ============================================================

-- Messias student_of Léo (São Braz)
-- Primary teacher from 1942; formed Messias as mestre in 1947
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-45',
  'Messias began training under Mestre Léo at age 15 in 1942 as part of the weekend training group in São Braz. Léo formed him as mestre in 1947 at age 20.',
  'Messias começou a treinar com Mestre Léo aos 15 anos em 1942 como parte do grupo de treino de fim de semana em São Braz. Léo o formou mestre em 1947 aos 20 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Léo' AND o.apelido_context = 'São Braz'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Messias received_title_from Léo (São Braz)
-- Received mestre title in 1947 at age 20
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1947-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/destaques-45',
  'Formado a mestre at age 20 by Mestre Léo in 1947. One of the youngest mestres of his era.',
  'Formado a mestre aos 20 anos por Mestre Léo em 1947. Um dos mestres mais jovens de sua época.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Léo' AND o.apelido_context = 'São Braz'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Messias associated_with Gato Preto
-- Training companions in Léo's São Braz group from 1942
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1942-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "training_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/gatopreto',
  'Messias and Gato Preto were training companions in Mestre Léo''s São Braz weekend training group from 1942. Messias was 15, Gato Preto was 12.',
  'Messias e Gato Preto foram companheiros de treino no grupo de fim de semana de Mestre Léo em São Braz a partir de 1942. Messias tinha 15 anos, Gato Preto tinha 12.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Messias' AND s.apelido_context IS NULL
  AND o.apelido = 'Gato Preto' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Messias associated_with Felipe de Santo Amaro - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Gary (Santo Amaro) - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Dimas - confirmed Sidney graduation together (Dec 21, 2013); needs import
-- Messias associated_with Mestre Sidney - confirmed his mestre graduation (Dec 21, 2013); needs import
