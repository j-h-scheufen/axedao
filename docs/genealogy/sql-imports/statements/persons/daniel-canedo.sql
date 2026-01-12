-- ============================================================
-- STATEMENTS FOR: Daniel Canedo
-- Generated: 2025-12-30
-- ============================================================
-- Contains all relationships where Daniel Canedo is the SUBJECT.
-- ============================================================

-- Daniel Canedo trained_under Jaime, Alberto, Rubens (informal street capoeira)
-- NOTE: Alberto (Caxias) has been imported. Jaime and Rubens pending.

-- Daniel Canedo trained_under Alberto (Caxias) - informal street teacher
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'https://acaz.site/historicoacaz',
  'Informal street capoeira training in Parque dos Ferreiras neighborhood, Duque de Caxias, early 1970s. Part of preparation for street rodas in central Caxias before joining Mestre Josias''s formal academy.',
  'Treinamento informal de capoeira de rua no bairro Parque dos Ferreiras, Duque de Caxias, início dos anos 1970. Parte da preparação para rodas de rua no centro de Caxias antes de ingressar na academia formal de Mestre Josias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Daniel Canedo' AND o.apelido = 'Alberto' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- PENDING: Daniel Canedo trained_under Jaime (Caxias) - needs Jaime entity import
-- PENDING: Daniel Canedo trained_under Rubens (Caxias) - needs Rubens entity import

-- Daniel Canedo student_of Josias (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  '1988-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://acaz.site/historicoacaz',
  'Joined Associação de Capoeira Josias da Silva in mid-1970s; baptized by Mestre Josias; trained through late 1980s before relocating to Canavieiras.',
  'Ingressou na Associação de Capoeira Josias da Silva em meados de 1970; batizado por Mestre Josias; treinou até o final dos anos 1980 antes de se mudar para Canavieiras.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Daniel Canedo' AND o.apelido = 'Josias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Daniel Canedo baptized_by Josias
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1975-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"baptism": {"apelido_given": "Daniel Canedo"}}'::jsonb, 'verified'::genealogy.confidence,
  'https://acaz.site/historicoacaz',
  'Received apelido during batizado at Associação de Capoeira Josias da Silva in mid-1970s.',
  'Recebeu apelido durante batizado na Associação de Capoeira Josias da Silva em meados de 1970.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Daniel Canedo' AND o.apelido = 'Josias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Daniel Canedo co_founded ACAZ - needs group import first
-- Daniel Canedo founded [First Academy Canavieiras] - informal, no formal group entity

-- The following students are NOT in the dataset and need import:
-- - Mestre Lucas (Lucas Pereira dos Santos) - student of Daniel Canedo
-- - Mestre Barriga (Paulo) - student of Daniel Canedo
-- - Mestre Naval - student of Daniel Canedo
-- - Mestre Isaque - student of Daniel Canedo

-- NOTE: Statements for Daniel Canedo having students should be in the
-- STUDENT'S statement file, not here. Following the ownership rule:
-- "Lucas student_of Daniel Canedo" goes in lucas.sql, not here.
