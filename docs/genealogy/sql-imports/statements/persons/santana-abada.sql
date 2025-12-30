-- ============================================================
-- STATEMENTS FOR: Santana (Abadá)
-- Generated: 2025-12-27
-- ============================================================
-- Contains all relationships where Santana (Abadá) is the SUBJECT.
-- ============================================================

-- Santana associated_with Camisa Roxa (founding colleague)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Co-organizer of Abadá-Capoeira foundational meetings and 1992 Spring Encounter in Salzburg"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-73, abada-capoeira-ba.wixsite.com',
  'Mestre Santana participated with Camisa Roxa in founding meetings for Abadá-Capoeira and in the 1992 Spring Encounter in Salzburg.',
  'Mestre Santana participou com Camisa Roxa nas reuniões fundacionais da Abadá-Capoeira e no Encontro da Primavera de 1992 em Salzburg.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Santana' AND s.apelido_context = 'Abadá'
  AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Santana associated_with Camisa (founding colleague)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "Co-organizer of Abadá-Capoeira foundational meetings and 1992 Spring Encounter in Salzburg"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-73, abada-capoeira-ba.wixsite.com',
  'Mestre Santana participated with Mestre Camisa in founding meetings for Abadá-Capoeira and in the 1992 Spring Encounter in Salzburg.',
  'Mestre Santana participou com Mestre Camisa nas reuniões fundacionais da Abadá-Capoeira e no Encontro da Primavera de 1992 em Salzburg.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Santana' AND s.apelido_context = 'Abadá'
  AND o.apelido = 'Camisa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Santana associated_with Moraes (1992 Spring Encounter colleague)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1992-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Co-participant in 1992 Spring Encounter in Salzburg, Austria"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-73, abada-capoeira-ba.wixsite.com',
  'Mestre Santana participated alongside Mestre Moraes in the first Spring Encounter in Salzburg, Austria (1992).',
  'Mestre Santana participou ao lado de Mestre Moraes no primeiro Encontro da Primavera em Salzburg, Áustria (1992).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Santana' AND s.apelido_context = 'Abadá'
  AND o.apelido = 'Moraes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset or unknown)
-- ============================================================
-- Santana associated_with Abadá-Capoeira (founding meetings) - Abadá-Capoeira group not yet imported
-- Santana student_of [UNKNOWN TEACHER] - lineage not documented
-- Santana leads/teaches_at [UNKNOWN GROUP/ACADEMY] - current affiliation unclear
