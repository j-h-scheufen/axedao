-- ============================================================
-- STATEMENTS FOR: Forró
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Forró is the SUBJECT.
-- ============================================================

-- Forró student_of Marrom (Rio de Janeiro)
-- Primary teacher-student relationship; trained in Rio de Janeiro
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
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://forum-brasil.de/capoeira/, oral history',
  'Trained under Mestre Marrom in Rio de Janeiro during his ~15-20 years in the city. Part of the Marrom Capoeira & Alunos / Ngoma community.',
  'Treinou sob Mestre Marrom no Rio de Janeiro durante seus ~15-20 anos na cidade. Parte da comunidade Marrom Capoeira & Alunos / Ngoma.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Forró' AND s.apelido_context IS NULL
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Forró received_title_from Marrom (Contra-Mestre title, 2004)
-- Conferral of Contra-Mestre title in Rio de Janeiro
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2004-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "location": "Rio de Janeiro, Brazil"}}'::jsonb,
  'likely'::genealogy.confidence,
  'Oral history (user confirmation)',
  'Made Contra-Mestre by Mestre Marrom in Rio de Janeiro in 2004.',
  'Feito Contra-Mestre por Mestre Marrom no Rio de Janeiro em 2004.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Forró' AND s.apelido_context IS NULL
  AND o.apelido = 'Marrom' AND o.apelido_context = 'Rio de Janeiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Forró founded Aldeia de Angola - group not yet imported
-- Forró teaches_at Ngoma Capoeira Angola (Berlin) - group not yet imported
-- Forró teaches_at Forum Brasil Berlin - group not yet imported (not a capoeira group)
-- Forró cultural_pioneer_of Germany (Hannover) - would need group/region entity
