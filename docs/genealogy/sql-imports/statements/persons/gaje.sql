-- ============================================================
-- STATEMENTS FOR: Gajé
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Gajé is the SUBJECT.
-- ============================================================

-- Gajé trained_under Nagé (primary teacher in childhood, Boa Vista de São Caetano)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1958-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirashop.fr registry; lelecapoeira.com',
  'Gajé learned capoeira as a child from Nagé in Boa Vista de São Caetano, Salvador. Nagé died in 1958 when Gajé was approximately 7 years old.',
  'Gajé aprendeu capoeira ainda criança com Nagé em Boa Vista de São Caetano, Salvador. Nagé morreu em 1958 quando Gajé tinha aproximadamente 7 anos.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gajé' AND o.apelido = 'Nagé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gajé influenced_by Noronha (learned from him at Mercado Modelo after initial training)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-01-01'::date, 'year'::genealogy.date_precision,
  '1977-11-17'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirashop.fr registry; velhosmestres.com 1968 photo',
  'After learning foundations from Nagé, Gajé was inspired by and learned from Noronha at Mercado Modelo. They appear together in 1968 "Dança de Guerra" film photo. Noronha died Nov 17, 1977.',
  'Após aprender fundamentos com Nagé, Gajé foi inspirado e aprendeu com Noronha no Mercado Modelo. Aparecem juntos em foto do filme "Dança de Guerra" de 1968. Noronha morreu em 17 de novembro de 1977.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gajé' AND o.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gajé influenced_by Totonho de Maré (learned from him at Mercado Modelo)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1961-01-01'::date, 'year'::genealogy.date_precision,
  '1974-10-18'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirashop.fr registry; velhosmestres.com 1968 photo',
  'Gajé was inspired by and learned from Totonho de Maré at Mercado Modelo. They appear together in 1968 "Dança de Guerra" film photo. Totonho died Oct 18, 1974.',
  'Gajé foi inspirado e aprendeu com Totonho de Maré no Mercado Modelo. Aparecem juntos em foto do filme "Dança de Guerra" de 1968. Totonho morreu em 18 de outubro de 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gajé' AND o.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gajé associated_with Índio do Mercado Modelo (contemporaries at Mercado Modelo, appeared together in 1968 film)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "photographed_together_danca_de_guerra_1968"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com 1968 Dança de Guerra photo',
  'Both appear in 1968 photo from "Dança de Guerra" film at Salvador port dock. Both Mercado Modelo capoeiristas.',
  'Ambos aparecem em foto de 1968 do filme "Dança de Guerra" no cais do porto de Salvador. Ambos capoeiristas do Mercado Modelo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gajé' AND o.apelido = 'Índio' AND o.apelido_context = 'Mercado Modelo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gajé associated_with DiMola (Domingos André dos Santos) - needs import first (photographed together 1968 Dança de Guerra)
-- Gajé associated_with Valu - needs import first (collaborated on Mercado Modelo album)
-- Gajé associated_with Cacau - needs import first (contemporary at Mercado Modelo)
-- Gajé associated_with Americano - needs import first (contemporary at Mercado Modelo)
-- Gajé associated_with Macumba - needs import first (contemporary at Mercado Modelo)
