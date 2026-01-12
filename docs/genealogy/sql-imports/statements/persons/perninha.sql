-- ============================================================
-- STATEMENTS FOR: Perninha
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Perninha is the SUBJECT.
-- ============================================================

-- Perninha student_of Zé Maria (primary teacher via Grupo Zema lineage)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1998-01-01'::date, 'year'::genealogy.date_precision,
  '2016-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'centrodomundo.org',
  'Trained under Zé Maria lineage through Grupo Zema de Capoeira in Ecuador. Received mestre cord directly from Zé Maria in May 2013.',
  'Treinou sob a linhagem de Zé Maria através do Grupo Zema de Capoeira no Equador. Recebeu corda de mestre diretamente de Zé Maria em maio de 2013.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perninha' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perninha received_title_from Zé Maria (mestre cord, May 2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2013-05-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Mestre cord ceremony", "location": "Ecuador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'centrodomundo.org',
  'Received white cord (corda branca) of mestre de capoeira from Zé Maria and Paulinho Salmon together in Ecuador.',
  'Recebeu corda branca de mestre de capoeira de Zé Maria e Paulinho Salmon juntos no Equador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perninha' AND o.apelido = 'Zé Maria'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perninha received_title_from Paulinho Salmon (mestre cord, May 2013)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '2013-05-01'::date, 'month'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"title_grant": {"title": "mestre", "ceremony": "Mestre cord ceremony", "location": "Ecuador"}}'::jsonb,
  'verified'::genealogy.confidence,
  'centrodomundo.org',
  'Received white cord (corda branca) of mestre de capoeira from Paulinho Salmon and Zé Maria together in Ecuador.',
  'Recebeu corda branca de mestre de capoeira de Paulinho Salmon e Zé Maria juntos no Equador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perninha' AND o.apelido = 'Paulinho Salmon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perninha student_of Marcos (direct teacher at Grupo Zema, 1998+)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1998-01-01'::date, 'year'::genealogy.date_precision,
  '2011-12-17'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://centrodomundo.org/biografias',
  'Started capoeira in 1998 at Grupo Zema de Capoeira in Ecuador under Marco Ayala (later Mestre Marcos). Received first cord and apelido "Perninha" in 1999. Trained under Marcos until co-founding Centro do Mundo (December 17, 2011).',
  'Começou capoeira em 1998 no Grupo Zema de Capoeira no Equador sob Marco Ayala (depois Mestre Marcos). Recebeu primeira corda e apelido "Perninha" em 1999. Treinou sob Marcos até cofundar o Centro do Mundo (17 de dezembro de 2011).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perninha' AND o.apelido = 'Marcos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Perninha baptized_by Marcos (received apelido, 1999)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1999-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL::genealogy.date_precision,
  '{"baptism": {"apelido_given": "Perninha"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://centrodomundo.org/biografias',
  'Received first cord and apelido "Perninha" (little leg) in 1999, one year after starting capoeira at Grupo Zema under Marco Ayala.',
  'Recebeu primeira corda e apelido "Perninha" em 1999, um ano após começar capoeira no Grupo Zema sob Marco Ayala.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Perninha' AND o.apelido = 'Marcos'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================

-- Perninha co_founded Centro do Mundo - PENDING
-- Co-founded December 17, 2011 in Quito with Carvão and Pandeiro.
-- Needs Centro do Mundo group entity imported first.

-- Perninha leads Centro do Mundo - PENDING
-- Director Ecuador of Centro do Mundo.
-- Needs Centro do Mundo group entity imported first.

-- Perninha family_of Pandeiro (Daniel Herrera) - PENDING
-- Brothers (both have surname Herrera); co-founders of Centro do Mundo.
-- relationship_type: brother
-- Note: Birth order unknown; storing in Perninha's file pending age verification.
-- Needs Pandeiro entity imported first.

-- Perninha member_of Grupo Zema de Capoeira - PENDING
-- Member from 1998; trained under Marco Ayala.
-- Needs Grupo Zema entity imported first.
