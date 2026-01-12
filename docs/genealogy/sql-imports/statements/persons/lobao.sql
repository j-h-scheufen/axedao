-- ============================================================
-- STATEMENTS FOR: Lobão
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Lobão is the SUBJECT.
-- ============================================================

-- Lobão trained_under Antônio Rodrigues (Itabuna, 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1969-12-31'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-lobao/',
  E'Trained under Antônio Rodrigues at Academia de Capoeira Nossa Senhora de Fátima in Itabuna during the 1960s, before moving to São Paulo.',
  E'Treinou com Antônio Rodrigues na Academia de Capoeira Nossa Senhora de Fátima em Itabuna durante os anos 1960, antes de se mudar para São Paulo.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lobão' AND o.apelido = 'Antônio Rodrigues'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lobão trained_under Medicina (Itabuna, 1960s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  '1969-12-31'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://www.lalaue.com/learn-capoeira/mestre-lobao/',
  E'Trained under Luiz Medicina in Itabuna during the 1960s. Medicina later recommended Lobão to train with Mestre Suassuna at Cordão de Ouro.',
  E'Treinou com Luiz Medicina em Itabuna durante os anos 1960. Medicina mais tarde recomendou Lobão para treinar com Mestre Suassuna no Cordão de Ouro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lobão' AND o.apelido = 'Medicina'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lobão student_of Suassuna (São Paulo, late 1960s-1970)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1968-01-01'::date, 'year'::genealogy.date_precision,
  '1970-12-31'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://mestrelobaosjc.webnode.com.br/mestre%20lob%C3%A3o/',
  E'Primary teacher. Lobão trained at Cordão de Ouro in São Paulo under Mestre Suassuna, graduating in the class of 1970.',
  E'Professor principal. Lobão treinou no Cordão de Ouro em São Paulo sob Mestre Suassuna, formando-se na turma de 1970.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Lobão' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Lobão co_founded Besouro Mangangá (May 16, 1971)
-- NOTE: Group "Associação Desportiva e Cultural Capoeira Besouro Mangangá" is in groups-backlog.md
-- SQL will be generated when group is imported

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Lobão co_founded Besouro Mangangá - group needs import first (in groups-backlog.md)
-- Lobão associated_with Esdras Filho (Mestre Esdras) - co-founder, person needs import first (in persons-backlog.md)
-- Lobão associated_with Damião - co-founder connection (Damião already in dataset, but this is best handled in a future update if association context warrants)
